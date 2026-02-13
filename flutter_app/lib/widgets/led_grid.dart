import 'package:flutter/material.dart';
import '../models/pixel.dart';
import '../models/led_image.dart';

/// 12x12 LED 그리드 위젯
class LedGrid extends StatefulWidget {
  final LedImage image;
  final Function(int row, int col, Pixel pixel)? onPixelTap;
  final Function(int row, int col, Pixel pixel)? onPixelDrag;
  final bool showGrid;
  final double cellSize;

  const LedGrid({
    super.key,
    required this.image,
    this.onPixelTap,
    this.onPixelDrag,
    this.showGrid = true,
    this.cellSize = 30.0,
  });

  @override
  State<LedGrid> createState() => _LedGridState();
}

class _LedGridState extends State<LedGrid> {
  int? _selectedRow;
  int? _selectedCol;

  void _handleTap(int row, int col) {
    if (widget.onPixelTap != null) {
      widget.onPixelTap!(row, col, widget.image.getPixel(row, col));
    }
  }

  void _handleDrag(int row, int col) {
    if (widget.onPixelDrag != null) {
      widget.onPixelDrag!(row, col, widget.image.getPixel(row, col));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(LedImage.height, (row) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(LedImage.width, (col) {
              final pixel = widget.image.getPixel(row, col);
              final isSelected = _selectedRow == row && _selectedCol == col;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRow = row;
                    _selectedCol = col;
                  });
                  _handleTap(row, col);
                },
                onPanUpdate: (details) {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final localPosition = box.globalToLocal(details.globalPosition);
                  final cellWidth = widget.cellSize;
                  final cellHeight = widget.cellSize;
                  final newCol = (localPosition.dx / cellWidth).floor();
                  final newRow = (localPosition.dy / cellHeight).floor();

                  if (newRow >= 0 &&
                      newRow < LedImage.height &&
                      newCol >= 0 &&
                      newCol < LedImage.width &&
                      (newRow != _selectedRow || newCol != _selectedCol)) {
                    setState(() {
                      _selectedRow = newRow;
                      _selectedCol = newCol;
                    });
                    _handleDrag(newRow, newCol);
                  }
                },
                child: Container(
                  width: widget.cellSize,
                  height: widget.cellSize,
                  margin: EdgeInsets.all(widget.showGrid ? 1 : 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(pixel.r, pixel.g, pixel.b, 1.0),
                    border: widget.showGrid
                        ? Border.all(color: Colors.grey.shade400, width: 0.5)
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ]
                        : null,
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
