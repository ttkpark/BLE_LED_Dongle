import 'package:flutter/material.dart';
import '../models/pixel.dart';

/// 색상 선택기 위젯
class ColorPickerWidget extends StatefulWidget {
  final Pixel currentColor;
  final Function(Pixel) onColorChanged;

  const ColorPickerWidget({
    super.key,
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late Pixel _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.currentColor;
  }

  @override
  void didUpdateWidget(ColorPickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentColor != widget.currentColor) {
      _currentColor = widget.currentColor;
    }
  }

  void _updateColor(int r, int g, int b) {
    setState(() {
      _currentColor = Pixel.clamp(r, g, b);
    });
    widget.onColorChanged(_currentColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('색상 선택', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          // 현재 색상 미리보기
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromRGBO(_currentColor.r, _currentColor.g, _currentColor.b, 1.0),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                'RGB(${_currentColor.r}, ${_currentColor.g}, ${_currentColor.b})',
                style: TextStyle(
                  color: _currentColor.r + _currentColor.g + _currentColor.b > 384
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // RGB 슬라이더
          _buildSlider('Red', _currentColor.r, 255, (value) {
            _updateColor(value.round(), _currentColor.g, _currentColor.b);
          }),
          _buildSlider('Green', _currentColor.g, 255, (value) {
            _updateColor(_currentColor.r, value.round(), _currentColor.b);
          }),
          _buildSlider('Blue', _currentColor.b, 255, (value) {
            _updateColor(_currentColor.r, _currentColor.g, value.round());
          }),
          
          const SizedBox(height: 16),
          
          // 빠른 색상 버튼
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildQuickColorButton('검정', 0, 0, 0),
              _buildQuickColorButton('흰색', 255, 255, 255),
              _buildQuickColorButton('빨강', 255, 0, 0),
              _buildQuickColorButton('초록', 0, 255, 0),
              _buildQuickColorButton('파랑', 0, 0, 255),
              _buildQuickColorButton('노랑', 255, 255, 0),
              _buildQuickColorButton('마젠타', 255, 0, 255),
              _buildQuickColorButton('시안', 0, 255, 255),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, int value, int max, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('$value'),
          ],
        ),
        Slider(
          value: value.toDouble(),
          min: 0,
          max: max.toDouble(),
          divisions: max,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildQuickColorButton(String label, int r, int g, int b) {
    return InkWell(
      onTap: () => _updateColor(r, g, b),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(r, g, b, 1.0),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: r + g + b > 384 ? Colors.black : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
