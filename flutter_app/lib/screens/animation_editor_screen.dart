import 'package:flutter/material.dart';
import '../models/led_animation.dart';
import '../models/led_image.dart';
import '../services/ble_service.dart';
import '../widgets/led_grid.dart';
import '../widgets/color_picker_widget.dart';
import 'image_editor_screen.dart';

class AnimationEditorScreen extends StatefulWidget {
  final BleService bleService;

  const AnimationEditorScreen({super.key, required this.bleService});

  @override
  State<AnimationEditorScreen> createState() => _AnimationEditorScreenState();
}

class _AnimationEditorScreenState extends State<AnimationEditorScreen> {
  late LedAnimation _animation;
  int _currentFrameIndex = 0;
  Pixel _currentColor = Pixel(r: 255, g: 255, b: 255);
  bool _isPlaying = false;
  bool _isSending = false;
  double _sendProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _animation = LedAnimation(frames: [LedImage()]);
  }

  void _onPixelTap(int row, int col, Pixel pixel) {
    setState(() {
      _animation.frames[_currentFrameIndex].setPixel(row, col, _currentColor);
    });
  }

  void _onPixelDrag(int row, int col, Pixel pixel) {
    setState(() {
      _animation.frames[_currentFrameIndex].setPixel(row, col, _currentColor);
    });
  }

  void _onColorChanged(Pixel color) {
    setState(() {
      _currentColor = color;
    });
  }

  void _addFrame() {
    setState(() {
      _animation.addFrame(LedImage());
      _currentFrameIndex = _animation.frames.length - 1;
    });
  }

  void _duplicateFrame() {
    if (_animation.frames.isNotEmpty) {
      setState(() {
        final currentFrame = _animation.frames[_currentFrameIndex];
        _animation.addFrame(currentFrame.copy());
        _currentFrameIndex = _animation.frames.length - 1;
      });
    }
  }

  void _deleteFrame() {
    if (_animation.frames.length > 1) {
      setState(() {
        _animation.removeFrame(_currentFrameIndex);
        if (_currentFrameIndex >= _animation.frames.length) {
          _currentFrameIndex = _animation.frames.length - 1;
        }
      });
    }
  }

  void _selectFrame(int index) {
    setState(() {
      _currentFrameIndex = index;
    });
  }

  void _editCurrentFrame() async {
    // 현재 프레임을 이미지 에디터로 전달하는 대신, 인라인 편집 사용
    // 필요시 별도 화면으로 분리 가능
  }

  Future<void> _sendAnimation() async {
    if (!widget.bleService.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('디바이스가 연결되지 않았습니다')),
      );
      return;
    }

    if (_animation.frames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('프레임이 없습니다')),
      );
      return;
    }

    setState(() {
      _isSending = true;
      _sendProgress = 0.0;
    });

    try {
      // 초기화
      final initResponse = await widget.bleService.initAnimation(
        totalFrames: _animation.frames.length,
        fps: _animation.fps,
        loop: _animation.loop,
        loopCount: _animation.loopCount,
        playMode: _animation.playMode,
      );

      if (initResponse['status'] != 'ok') {
        throw Exception('초기화 실패: ${initResponse['data']?['message']}');
      }

      // 청크 분할 전송
      const framesPerChunk = 5; // 청크당 프레임 수
      final totalChunks = (_animation.frames.length / framesPerChunk).ceil();

      for (int chunkId = 0; chunkId < totalChunks; chunkId++) {
        final frameStart = chunkId * framesPerChunk;
        final frameEnd = (frameStart + framesPerChunk < _animation.frames.length)
            ? frameStart + framesPerChunk
            : _animation.frames.length;
        final chunkFrames = _animation.frames.sublist(frameStart, frameEnd);
        final chunkDurations = _animation.durations.sublist(frameStart, frameEnd);

        final chunkResponse = await widget.bleService.sendAnimationChunk(
          chunkId: chunkId,
          totalChunks: totalChunks,
          frameStart: frameStart,
          frames: chunkFrames,
          durations: chunkDurations,
        );

        if (chunkResponse['status'] != 'ok') {
          throw Exception('청크 전송 실패: ${chunkResponse['data']?['message']}');
        }

        setState(() {
          _sendProgress = (chunkId + 1) / totalChunks;
        });
      }

      // 완료
      final completeResponse = await widget.bleService.completeAnimation(verify: true);

      if (mounted) {
        if (completeResponse['status'] == 'ok') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('애니메이션 전송 완료')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('완료 실패: ${completeResponse['data']?['message'] ?? 'Unknown error'}'),
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
          _sendProgress = 0.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('애니메이션 에디터'),
        actions: [
          if (_isSending)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  value: _sendProgress > 0 ? _sendProgress : null,
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: _sendAnimation,
              tooltip: '전송',
            ),
        ],
      ),
      body: Column(
        children: [
          // 프레임 컨트롤
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addFrame,
                  tooltip: '프레임 추가',
                ),
                IconButton(
                  icon: const Icon(Icons.content_copy),
                  onPressed: _duplicateFrame,
                  tooltip: '프레임 복사',
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: _deleteFrame,
                  tooltip: '프레임 삭제',
                ),
                const Spacer(),
                Text(
                  '프레임 ${_currentFrameIndex + 1}/${_animation.frames.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // 타임라인
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _animation.frames.length,
              itemBuilder: (context, index) {
                final isSelected = index == _currentFrameIndex;
                return GestureDetector(
                  onTap: () => _selectFrame(index),
                  child: Container(
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: isSelected ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // LED 그리드
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: LedGrid(
                  image: _animation.frames[_currentFrameIndex],
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
