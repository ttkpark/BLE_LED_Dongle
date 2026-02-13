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

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    setState(() {
      _isScanning = true;
      _devices = [];
    });

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        _devices = results
            .map((r) => r.device)
            .where((d) => d.name.isNotEmpty && d.name.contains('Nordic'))
            .toList();
      });
    });

    FlutterBluePlus.isScanning.listen((isScanning) {
      setState(() {
        _isScanning = isScanning;
      });
    });
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
              onPressed: _startScan,
            ),
        ],
      ),
      body: Column(
        children: [
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
            child: _devices.isEmpty
                ? Center(
                    child: _isScanning
                        ? const Text('스캔 중...')
                        : const Text('디바이스를 찾을 수 없습니다'),
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
