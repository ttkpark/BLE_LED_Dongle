# Flutter 앱 프로젝트 구조

## 개요

이 Flutter 앱은 BLE LED Dongle과 통신하여 12x12 LED 매트릭스를 제어하는 앱입니다.

## 프로젝트 구조

```
flutter_app/
├── lib/
│   ├── main.dart                          # 앱 진입점
│   ├── models/                            # 데이터 모델
│   │   ├── pixel.dart                    # 픽셀 데이터 모델
│   │   ├── led_image.dart                # 12x12 LED 이미지 모델
│   │   └── led_animation.dart            # 애니메이션 모델
│   ├── services/                          # 서비스 레이어
│   │   └── ble_service.dart              # BLE 통신 서비스
│   ├── screens/                           # 화면
│   │   ├── main_screen.dart              # 메인 화면 (디바이스 스캔/연결)
│   │   ├── image_editor_screen.dart      # 이미지 에디터 화면
│   │   └── animation_editor_screen.dart   # 애니메이션 에디터 화면
│   └── widgets/                           # 재사용 가능한 위젯
│       ├── led_grid.dart                 # 12x12 LED 그리드 위젯
│       └── color_picker_widget.dart       # 색상 선택기 위젯
├── android/                                # Android 플랫폼 설정
│   ├── app/
│   │   ├── build.gradle                  # 앱 빌드 설정
│   │   └── src/main/
│   │       ├── AndroidManifest.xml       # Android 매니페스트 (권한 설정)
│   │       └── kotlin/.../MainActivity.kt # MainActivity
│   ├── build.gradle                       # 프로젝트 빌드 설정
│   └── settings.gradle                    # Gradle 설정
├── pubspec.yaml                           # Flutter 의존성 관리
├── README.md                              # 프로젝트 설명서
└── .gitignore                             # Git 무시 파일

```

## 주요 컴포넌트

### 1. Models (데이터 모델)

#### Pixel
- RGB 색상 값을 저장하는 모델
- 0-255 범위의 정수 값

#### LedImage
- 12x12 픽셀 배열을 관리
- 픽셀 설정/가져오기, 지우기, 채우기 기능
- Base64 인코딩을 위한 바이트 배열 변환

#### LedAnimation
- 여러 프레임으로 구성된 애니메이션
- 각 프레임의 지속 시간 관리
- 반복, 재생 모드 설정

### 2. Services (서비스)

#### BleService
- BLE 디바이스 연결/해제
- JSON 프로토콜 기반 통신
- 이미지/애니메이션 전송
- 응답 스트림 관리

### 3. Screens (화면)

#### MainScreen
- BLE 디바이스 스캔 및 연결
- 연결 상태 표시
- 이미지/애니메이션 에디터로 네비게이션

#### ImageEditorScreen
- 12x12 그리드 편집
- 색상 선택
- 이미지 가져오기 (갤러리/카메라)
- 이미지 전송

#### AnimationEditorScreen
- 프레임 추가/삭제/복사
- 타임라인 기반 프레임 편집
- 애니메이션 전송 (청크 분할)

### 4. Widgets (위젯)

#### LedGrid
- 12x12 픽셀 그리드 표시
- 터치/드래그 이벤트 처리
- 선택된 픽셀 하이라이트

#### ColorPickerWidget
- RGB 슬라이더
- 빠른 색상 버튼
- 색상 미리보기

## 통신 프로토콜

JSON 기반 프로토콜을 사용합니다. 자세한 내용은 `PROTOCOL_JSON.md`를 참조하세요.

### 주요 명령어

- `set_image`: 이미지 전송
- `set_animation_init`: 애니메이션 초기화
- `set_animation_chunk`: 애니메이션 청크 전송
- `set_animation_complete`: 애니메이션 전송 완료
- `play`, `pause`, `stop`, `reset`: 재생 제어
- `set_brightness`: 밝기 조절
- `get_status`: 상태 조회

## 의존성

### 주요 패키지

- `flutter_blue_plus`: BLE 통신
- `image`: 이미지 처리
- `image_picker`: 이미지 선택
- `shared_preferences`: 로컬 저장소

## 빌드 및 실행

### 개발 환경 설정

1. Flutter SDK 설치 (3.0.0 이상)
2. Android Studio 또는 VS Code 설치
3. Android SDK 설치

### 실행 방법

```bash
cd flutter_app
flutter pub get
flutter run
```

### Android 권한

다음 권한이 필요합니다:
- BLUETOOTH
- BLUETOOTH_SCAN
- BLUETOOTH_CONNECT
- ACCESS_FINE_LOCATION (Android 12 이상)
- CAMERA (사진 촬영)
- READ_EXTERNAL_STORAGE (갤러리 접근)

## 향후 개선 사항

1. 패턴 저장/불러오기 기능
2. 비디오에서 애니메이션 생성
3. 프리셋 패턴 라이브러리
4. 다크 모드 지원
5. 애니메이션 프리뷰 기능
