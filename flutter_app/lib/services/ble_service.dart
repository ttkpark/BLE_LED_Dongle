import 'dart:async';
import 'dart:convert';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/led_image.dart';

/// BLE 통신 서비스
class BleService {
  static const String nusServiceUuid = '6E400001-B5A3-F393-E0A9-E50E24DCCA9E';
  static const String nusTxCharacteristicUuid = '6E400002-B5A3-F393-E0A9-E50E24DCCA9E';
  static const String nusRxCharacteristicUuid = '6E400003-B5A3-F393-E0A9-E50E24DCCA9E';

  BluetoothDevice? _device;
  BluetoothCharacteristic? _txCharacteristic;
  BluetoothCharacteristic? _rxCharacteristic;
  
  StreamSubscription<List<int>>? _rxSubscription;
  final StreamController<Map<String, dynamic>> _responseController = StreamController.broadcast();
  
  int _requestIdCounter = 1000;
  final Map<int, Completer<Map<String, dynamic>>> _pendingRequests = {};

  /// 응답 스트림
  Stream<Map<String, dynamic>> get responseStream => _responseController.stream;

  /// 디바이스 연결
  Future<bool> connect(BluetoothDevice device) async {
    try {
      _device = device;
      await device.connect(
        autoConnect: false,
        timeout: const Duration(seconds: 15),
        license: License.free,
      );
      
      // MTU 협상
      await device.requestMtu(247);
      
      // 서비스 발견
      final services = await device.discoverServices();
      final nusService = services.firstWhere(
        (service) => service.uuid.toString().toUpperCase() == nusServiceUuid.toUpperCase(),
        orElse: () => throw Exception('NUS service not found'),
      );

      // 특성 찾기
      _txCharacteristic = nusService.characteristics.firstWhere(
        (c) => c.uuid.toString().toUpperCase() == nusTxCharacteristicUuid.toUpperCase(),
      );
      
      _rxCharacteristic = nusService.characteristics.firstWhere(
        (c) => c.uuid.toString().toUpperCase() == nusRxCharacteristicUuid.toUpperCase(),
      );

      // 알림 구독
      await _rxCharacteristic!.setNotifyValue(true);
      _rxSubscription = _rxCharacteristic!.lastValueStream.listen(_onDataReceived);

      return true;
    } catch (e) {
      print('Connection error: $e');
      return false;
    }
  }

  /// 연결 해제
  Future<void> disconnect() async {
    await _rxSubscription?.cancel();
    _rxSubscription = null;
    await _device?.disconnect();
    _device = null;
    _txCharacteristic = null;
    _rxCharacteristic = null;
    _pendingRequests.clear();
  }

  /// 데이터 수신 처리
  void _onDataReceived(List<int> data) {
    try {
      final jsonString = utf8.decode(data);
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      
      // 응답 스트림에 전송
      _responseController.add(json);

      // 대기 중인 요청 처리
      final id = json['id'] as int?;
      if (id != null && _pendingRequests.containsKey(id)) {
        _pendingRequests[id]!.complete(json);
        _pendingRequests.remove(id);
      }
    } catch (e) {
      print('Error parsing response: $e');
    }
  }

  /// JSON 메시지 전송
  Future<void> _sendJson(Map<String, dynamic> json) async {
    if (_txCharacteristic == null) {
      throw Exception('Not connected');
    }

    final jsonString = jsonEncode(json);
    final bytes = utf8.encode(jsonString + '\n');
    
    // MTU 크기로 분할 전송
    const chunkSize = 200; // 안전한 크기
    for (var i = 0; i < bytes.length; i += chunkSize) {
      final chunk = bytes.sublist(i, (i + chunkSize < bytes.length) ? i + chunkSize : bytes.length);
      await _txCharacteristic!.write(chunk, withoutResponse: false);
      await Future.delayed(const Duration(milliseconds: 10)); // 작은 딜레이
    }
  }

  /// 요청 ID 생성
  int _getNextRequestId() => _requestIdCounter++;

  /// 이미지 전송 (Base64 형식)
  Future<Map<String, dynamic>> sendImage(LedImage image, {int brightness = 255}) async {
    final requestId = _getNextRequestId();
    final pixelBytes = image.getPixelBytes();
    final base64Pixels = base64Encode(pixelBytes);

    final completer = Completer<Map<String, dynamic>>();
    _pendingRequests[requestId] = completer;

    final json = {
      'cmd': 'set_image',
      'id': requestId,
      'data': {
        'format': 'base64',
        'pixels': base64Pixels,
        'brightness': brightness,
        'apply': true,
      },
    };

    await _sendJson(json);

    return completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () => {'cmd': 'error', 'status': 'error', 'data': {'code': 'TIMEOUT', 'message': 'Request timeout'}},
    );
  }

  /// 애니메이션 초기화
  Future<Map<String, dynamic>> initAnimation({
    required int totalFrames,
    int fps = 20,
    bool loop = true,
    int loopCount = 0,
    String playMode = 'forward',
  }) async {
    final requestId = _getNextRequestId();
    final completer = Completer<Map<String, dynamic>>();
    _pendingRequests[requestId] = completer;

    final json = {
      'cmd': 'set_animation_init',
      'id': requestId,
      'data': {
        'total_frames': totalFrames,
        'fps': fps,
        'loop': loop,
        'loop_count': loopCount,
        'play_mode': playMode,
      },
    };

    await _sendJson(json);

    return completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () => {'cmd': 'error', 'status': 'error', 'data': {'code': 'TIMEOUT', 'message': 'Request timeout'}},
    );
  }

  /// 애니메이션 청크 전송
  Future<Map<String, dynamic>> sendAnimationChunk({
    required int chunkId,
    required int totalChunks,
    required int frameStart,
    required List<LedImage> frames,
    List<int>? durations,
  }) async {
    final requestId = _getNextRequestId();
    final completer = Completer<Map<String, dynamic>>();
    _pendingRequests[requestId] = completer;

    // 프레임 데이터를 바이트로 변환
    final List<int> frameBytes = [];
    for (var frame in frames) {
      frameBytes.addAll(frame.getPixelBytes());
    }
    final base64Frames = base64Encode(frameBytes);

    final json = {
      'cmd': 'set_animation_chunk',
      'id': requestId,
      'data': {
        'chunk_id': chunkId,
        'total_chunks': totalChunks,
        'frame_start': frameStart,
        'frame_count': frames.length,
        'format': 'base64',
        'frames': base64Frames,
        if (durations != null) 'durations': durations,
      },
    };

    await _sendJson(json);

    return completer.future.timeout(
      const Duration(seconds: 10),
      onTimeout: () => {'cmd': 'error', 'status': 'error', 'data': {'code': 'TIMEOUT', 'message': 'Request timeout'}},
    );
  }

  /// 애니메이션 완료
  Future<Map<String, dynamic>> completeAnimation({bool verify = true}) async {
    final requestId = _getNextRequestId();
    final completer = Completer<Map<String, dynamic>>();
    _pendingRequests[requestId] = completer;

    final json = {
      'cmd': 'set_animation_complete',
      'id': requestId,
      'data': {'verify': verify},
    };

    await _sendJson(json);

    return completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () => {'cmd': 'error', 'status': 'error', 'data': {'code': 'TIMEOUT', 'message': 'Request timeout'}},
    );
  }

  /// 재생 제어
  Future<void> play() => _sendJson({'cmd': 'play'});
  Future<void> pause() => _sendJson({'cmd': 'pause'});
  Future<void> stop() => _sendJson({'cmd': 'stop'});
  Future<void> reset() => _sendJson({'cmd': 'reset'});

  /// 밝기 설정
  Future<void> setBrightness(int brightness) {
    return _sendJson({
      'cmd': 'set_brightness',
      'data': {'brightness': brightness.clamp(0, 255)},
    });
  }

  /// 상태 조회
  Future<Map<String, dynamic>> getStatus() async {
    final requestId = _getNextRequestId();
    final completer = Completer<Map<String, dynamic>>();
    _pendingRequests[requestId] = completer;

    await _sendJson({'cmd': 'get_status'});

    return completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () => {'cmd': 'error', 'status': 'error', 'data': {'code': 'TIMEOUT', 'message': 'Request timeout'}},
    );
  }

  /// 연결 상태
  bool get isConnected => _device != null && _txCharacteristic != null;

  /// 디바이스
  BluetoothDevice? get device => _device;

  void dispose() {
    _rxSubscription?.cancel();
    _responseController.close();
    disconnect();
  }
}
