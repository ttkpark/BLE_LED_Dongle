import 'pixel.dart';

/// 12x12 LED 이미지 모델
class LedImage {
  static const int width = 12;
  static const int height = 12;
  static const int totalPixels = 144;

  final List<List<Pixel>> pixels;

  LedImage() : pixels = List.generate(height, (_) => List.generate(width, (_) => Pixel(r: 0, g: 0, b: 0)));

  LedImage.fromPixels(this.pixels) {
    if (pixels.length != height || pixels.any((row) => row.length != width)) {
      throw ArgumentError('Invalid image size. Must be 12x12');
    }
  }

  /// 픽셀 설정
  void setPixel(int row, int col, Pixel pixel) {
    if (row >= 0 && row < height && col >= 0 && col < width) {
      pixels[row][col] = pixel;
    }
  }

  /// 픽셀 가져오기
  Pixel getPixel(int row, int col) {
    if (row >= 0 && row < height && col >= 0 && col < width) {
      return pixels[row][col];
    }
    return Pixel(r: 0, g: 0, b: 0);
  }

  /// 모든 픽셀 지우기
  void clear() {
    for (var row in pixels) {
      for (var i = 0; i < row.length; i++) {
        row[i] = Pixel(r: 0, g: 0, b: 0);
      }
    }
  }

  /// 특정 색상으로 채우기
  void fill(Pixel pixel) {
    for (var row in pixels) {
      for (var i = 0; i < row.length; i++) {
        row[i] = pixel;
      }
    }
  }

  /// 행 우선 순서로 픽셀 리스트 가져오기
  List<Pixel> getPixelList() {
    final List<Pixel> result = [];
    for (var row in pixels) {
      result.addAll(row);
    }
    return result;
  }

  /// 행 우선 순서로 RGB 바이트 리스트 가져오기
  List<int> getPixelBytes() {
    final List<int> result = [];
    for (var row in pixels) {
      for (var pixel in row) {
        result.add(pixel.r);
        result.add(pixel.g);
        result.add(pixel.b);
      }
    }
    return result;
  }

  /// 복사
  LedImage copy() {
    final newPixels = pixels.map((row) => row.map((pixel) => pixel.copyWith()).toList()).toList();
    return LedImage.fromPixels(newPixels);
  }

  @override
  String toString() => 'LedImage($width x $height)';
}
