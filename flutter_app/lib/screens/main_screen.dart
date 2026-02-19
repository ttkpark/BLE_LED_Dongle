import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../services/ble_service.dart';
import 'image_editor_screen.dart';
import 'animation_editor_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BleService _bleService = BleService();
  List<BluetoothDevice> _devices = [];
  bool _isScanning = false;
  BluetoothDevice? _connectedDevice;
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _checkBluetoothState();
    _setupBluetoothListeners();
  }

  void _setupBluetoothListeners() {
    // BLE 어댑터 상태 모니터링
    FlutterBluePlus.adapterState.listen((state) {
      setState(() {
        _adapterState = state;
      });
    });

    // 스캔 결과 리스너
    FlutterBluePlus.scanResults.listen((results) {
      if (mounted) {
        setState(() {
          _devices = results
              .map((r) => r.device)
              .where((d) => d.name.isNotEmpty && d.name.contains('Nordic'))
              .toList();
        });
      }
    });

    // 스캔 상태 리스너
    FlutterBluePlus.isScanning.listen((isScanning) {
      if (mounted) {
        setState(() {
          _isScanning = isScanning;
        });
      }
    });
  }

  Future<void> _checkBluetoothState() async {
    try {
      final state = await FlutterBluePlus.adapterState.first;
      setState(() {
        _adapterState = state;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'BLE 상태 확인 실패: $e';
      });
    }
  }

  Future<void> _startScan() async {
    if (_adapterState != BluetoothAdapterState.on) {
      setState(() {
        _errorMessage = '블루투스를 켜주세요';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('블루투스를 켜주세요')),
      );
      return;
    }

    try {
      setState(() {
        _isScanning = true;
        _devices = [];
        _errorMessage = null;
      });

      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 4),
        androidUsesFineLocation: false,
      );
    } catch (e) {
      setState(() {
        _isScanning = false;
        _errorMessage = '스캔 시작 실패: $e';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('스캔 실패: $e')),
        );
      }
    }
  }

  Future<void> _connectDevice(BluetoothDevice device) async {
    try {
      final connected = await _bleService.connect(device);
      if (connected) {
        setState(() {
          _connectedDevice = device;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('연결되었습니다')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('연결 실패')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('연결 오류: $e')),
        );
      }
    }
  }

  Future<void> _disconnectDevice() async {
    await _bleService.disconnect();
    setState(() {
      _connectedDevice = null;
    });
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    _bleService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE LED Dongle'),
        actions: [
          if (_isScanning)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _adapterState == BluetoothAdapterState.on ? _startScan : null,
            ),
        ],
      ),
      body: Column(
        children: [
          // BLE 상태 표시
          if (_adapterState != BluetoothAdapterState.on)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.orange.shade100,
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _adapterState == BluetoothAdapterState.off
                          ? '블루투스를 켜주세요'
                          : 'BLE 초기화 중...',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

          // 에러 메시지 표시
          if (_errorMessage != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.red.shade100,
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),

          // 연결 상태 표시
          Container(
            padding: const EdgeInsets.all(16),
            color: _connectedDevice != null ? Colors.green.shade100 : Colors.grey.shade200,
            child: Row(
              children: [
                Icon(
                  _connectedDevice != null ? Icons.bluetooth_connected : Icons.bluetooth_disabled,
                  color: _connectedDevice != null ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _connectedDevice != null
                        ? '연결됨: ${_connectedDevice!.name}'
                        : '디바이스를 선택하세요',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                if (_connectedDevice != null)
                  TextButton(
                    onPressed: _disconnectDevice,
                    child: const Text('연결 해제'),
                  ),
              ],
            ),
          ),

          // 디바이스 목록
          Expanded(
            child: _adapterState != BluetoothAdapterState.on
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.bluetooth_disabled, size: 64, color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text('블루투스를 켜주세요'),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('새로고침'),
                          onPressed: _checkBluetoothState,
                        ),
                      ],
                    ),
                  )
                : _devices.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isScanning)
                              const Column(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 16),
                                  Text('스캔 중...'),
                                ],
                              )
                            else
                              Column(
                                children: [
                                  const Icon(Icons.bluetooth_searching, size: 64, color: Colors.grey),
                                  const SizedBox(height: 16),
                                  const Text('디바이스를 찾을 수 없습니다'),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.search),
                                    label: const Text('스캔 시작'),
                                    onPressed: _startScan,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _devices.length,
                        itemBuilder: (context, index) {
                          final device = _devices[index];
                          final isConnected = _connectedDevice?.id == device.id;
                          return ListTile(
                            leading: Icon(
                              isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
                              color: isConnected ? Colors.green : Colors.grey,
                            ),
                            title: Text(device.name),
                            subtitle: Text(device.id.toString()),
                            trailing: isConnected
                                ? const Icon(Icons.check, color: Colors.green)
                                : const Icon(Icons.chevron_right),
                            onTap: isConnected ? null : () => _connectDevice(device),
                          );
                        },
                      ),
          ),

          // 빠른 액션 버튼
          if (_connectedDevice != null)
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.image),
                      label: const Text('이미지 에디터'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageEditorScreen(bleService: _bleService),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.animation),
                      label: const Text('애니메이션 에디터'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimationEditorScreen(bleService: _bleService),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
