import 'led_image.dart';

/// LED 애니메이션 모델
class LedAnimation {
  final List<LedImage> frames;
  final List<int> durations; // 각 프레임의 지속 시간 (ms)
  final bool loop;
  final int loopCount; // 0 = 무한 반복
  final String playMode; // "forward", "reverse", "pingpong"
  final int fps;

  LedAnimation({
    required this.frames,
    List<int>? durations,
    this.loop = true,
    this.loopCount = 0,
    this.playMode = 'forward',
    this.fps = 20,
  }) : durations = durations ?? List.filled(frames.length, (1000 / (fps)).round());

  /// 프레임 추가
  void addFrame(LedImage frame, {int? durationMs}) {
    frames.add(frame);
    durations.add(durationMs ?? (1000 / fps).round());
  }

  /// 프레임 삭제
  void removeFrame(int index) {
    if (index >= 0 && index < frames.length) {
      frames.removeAt(index);
      durations.removeAt(index);
    }
  }

  /// 프레임 수
  int get frameCount => frames.length;

  /// 총 재생 시간 (초)
  double get totalDuration {
    return durations.fold(0, (sum, duration) => sum + duration) / 1000.0;
  }

  /// 복사
  LedAnimation copy() {
    return LedAnimation(
      frames: frames.map((frame) => frame.copy()).toList(),
      durations: List.from(durations),
      loop: loop,
      loopCount: loopCount,
      playMode: playMode,
      fps: fps,
    );
  }

  @override
  String toString() => 'LedAnimation(frames: ${frames.length}, duration: ${totalDuration.toStringAsFixed(1)}s)';
}
