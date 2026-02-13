import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../models/led_image.dart';
import '../models/pixel.dart';
import '../services/ble_service.dart';
import '../widgets/led_grid.dart';
import '../widgets/color_picker_widget.dart';

class ImageEditorScreen extends StatefulWidget {
  final BleService bleService;

  const ImageEditorScreen({super.key, required this.bleService});

  @override
  State<ImageEditorScreen> createState() => _ImageEditorScreenState();
}

class _ImageEditorScreenState extends State<ImageEditorScreen> {
  late LedImage _image;
  Pixel _currentColor = Pixel(r: 255, g: 255, b: 255);
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _image = LedImage();
  }

  void _onPixelTap(int row, int col, Pixel pixel) {
    setState(() {
      _image.setPixel(row, col, _currentColor);
    });
  }

  void _onPixelDrag(int row, int col, Pixel pixel) {
    setState(() {
      _image.setPixel(row, col, _currentColor);
    });
  }

  void _onColorChanged(Pixel color) {
    setState(() {
      _currentColor = color;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image != null) {
        // 12x12로 리사이즈
        final resized = img.copyResize(image, width: 12, height: 12);

        setState(() {
          for (int row = 0; row < 12; row++) {
            for (int col = 0; col < 12; col++) {
              final pixel = resized.getPixel(col, row);
              final r = img.getRed(pixel);
              final g = img.getGreen(pixel);
              final b = img.getBlue(pixel);
              _image.setPixel(row, col, Pixel(r: r, g: g, b: b));
            }
          }
        });
      }
    }
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image != null) {
        final resized = img.copyResize(image, width: 12, height: 12);

        setState(() {
          for (int row = 0; row < 12; row++) {
            for (int col = 0; col < 12; col++) {
              final pixel = resized.getPixel(col, row);
              final r = img.getRed(pixel);
              final g = img.getGreen(pixel);
              final b = img.getBlue(pixel);
              _image.setPixel(row, col, Pixel(r: r, g: g, b: b));
            }
          }
        });
      }
    }
  }

  Future<void> _clearImage() {
    setState(() {
      _image.clear();
    });
  }

  Future<void> _fillImage() {
    setState(() {
      _image.fill(_currentColor);
    });
  }

  Future<void> _sendImage() async {
    if (!widget.bleService.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('디바이스가 연결되지 않았습니다')),
      );
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      final response = await widget.bleService.sendImage(_image);
      
      if (mounted) {
        if (response['status'] == 'ok') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('이미지 전송 완료')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('전송 실패: ${response['data']?['message'] ?? 'Unknown error'}'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('오류: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 에디터'),
        actions: [
          if (_isSending)
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
              icon: const Icon(Icons.send),
              onPressed: _sendImage,
              tooltip: '전송',
            ),
        ],
      ),
      body: Column(
        children: [
          // 도구 모음
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearImage,
                  tooltip: '지우기',
                ),
                IconButton(
                  icon: const Icon(Icons.format_color_fill),
                  onPressed: _fillImage,
                  tooltip: '채우기',
                ),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: _pickImage,
                  tooltip: '갤러리에서 가져오기',
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _takePhoto,
                  tooltip: '사진 촬영',
                ),
              ],
            ),
          ),

          // LED 그리드
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: LedGrid(
                  image: _image,
                  onPixelTap: _onPixelTap,
                  onPixelDrag: _onPixelDrag,
                  cellSize: 25.0,
                ),
              ),
            ),
          ),

          // 색상 선택기
          ColorPickerWidget(
            currentColor: _currentColor,
            onColorChanged: _onColorChanged,
          ),
        ],
      ),
    );
  }
}
