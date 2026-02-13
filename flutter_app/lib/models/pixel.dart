/// 픽셀 데이터 모델
class Pixel {
  final int r;
  final int g;
  final int b;

  Pixel({required this.r, required this.g, required this.b});

  /// 0-255 범위로 클램핑
  Pixel.clamp(int r, int g, int b)
      : r = r.clamp(0, 255),
        g = g.clamp(0, 255),
        b = b.clamp(0, 255);

  /// Color에서 Pixel로 변환
  factory Pixel.fromColor(int color) {
    return Pixel(
      r: (color >> 16) & 0xFF,
      g: (color >> 8) & 0xFF,
      b: color & 0xFF,
    );
  }

  /// Color 값으로 변환
  int toColor() {
    return (0xFF << 24) | (r << 16) | (g << 8) | b;
  }

  /// 리스트로 변환 [R, G, B]
  List<int> toList() => [r, g, b];

  /// 복사
  Pixel copyWith({int? r, int? g, int? b}) {
    return Pixel(
      r: r ?? this.r,
      g: g ?? this.g,
      b: b ?? this.b,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pixel && r == other.r && g == other.g && b == other.b;

  @override
  int get hashCode => r.hashCode ^ g.hashCode ^ b.hashCode;

  @override
  String toString() => 'Pixel(r: $r, g: $g, b: $b)';
}
