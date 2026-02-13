# BLE LED Dongle Flutter App

BLE LED Dongle을 제어하는 Flutter 앱입니다.

## 기능

- **BLE 디바이스 스캔 및 연결**: 주변 BLE LED Dongle 디바이스 검색 및 연결
- **이미지 에디터**: 12x12 LED 매트릭스 이미지 편집 및 전송
- **애니메이션 에디터**: 프레임 단위 애니메이션 편집 및 전송
- **이미지 가져오기**: 갤러리 또는 카메라에서 이미지 가져오기
- **실시간 미리보기**: 편집 중인 이미지/애니메이션 미리보기

## 설치 및 실행

### 필수 요구사항

- Flutter SDK 3.0.0 이상
- Android Studio 또는 VS Code
- Android 디바이스 (BLE 지원)

### 설치 방법

1. 프로젝트 디렉토리로 이동:
```bash
cd flutter_app
```

2. 의존성 설치:
```bash
flutter pub get
```

3. Android 권한 설정 확인:
   - `android/app/src/main/AndroidManifest.xml` 파일에 필요한 권한이 포함되어 있는지 확인

4. 앱 실행:
```bash
flutter run
```

## 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── models/                   # 데이터 모델
│   ├── pixel.dart           # 픽셀 모델
│   ├── led_image.dart       # LED 이미지 모델
│   └── led_animation.dart   # 애니메이션 모델
├── services/                 # 서비스
│   └── ble_service.dart     # BLE 통신 서비스
├── screens/                  # 화면
│   ├── main_screen.dart     # 메인 화면
│   ├── image_editor_screen.dart    # 이미지 에디터
│   └── animation_editor_screen.dart # 애니메이션 에디터
└── widgets/                  # 위젯
    ├── led_grid.dart        # LED 그리드 위젯
    └── color_picker_widget.dart # 색상 선택기
```

## 사용 방법

### 1. 디바이스 연결

1. 앱 실행 후 메인 화면에서 "스캔" 버튼을 누릅니다
2. "Nordic_UART" 디바이스를 찾아 탭합니다
3. 연결이 완료되면 "연결됨" 상태가 표시됩니다

### 2. 이미지 편집 및 전송

1. "이미지 에디터" 버튼을 누릅니다
2. 그리드를 터치하여 픽셀을 그립니다
3. 색상 선택기에서 원하는 색상을 선택합니다
4. "갤러리에서 가져오기" 또는 "사진 촬영" 버튼으로 이미지를 가져올 수 있습니다
5. "전송" 버튼을 눌러 디바이스로 이미지를 전송합니다

### 3. 애니메이션 편집 및 전송

1. "애니메이션 에디터" 버튼을 누릅니다
2. "프레임 추가" 버튼으로 프레임을 추가합니다
3. 각 프레임을 편집합니다
4. 타임라인에서 프레임을 선택하여 편집할 수 있습니다
5. "전송" 버튼을 눌러 애니메이션을 전송합니다

## 프로토콜

JSON 기반 통신 프로토콜을 사용합니다. 자세한 내용은 `PROTOCOL_JSON.md`를 참조하세요.

## 문제 해결

### BLE 연결이 안 될 때

1. 디바이스가 켜져 있는지 확인
2. 디바이스가 다른 앱에 연결되어 있지 않은지 확인
3. 앱 권한이 올바르게 설정되어 있는지 확인

### 이미지가 전송되지 않을 때

1. 디바이스 연결 상태 확인
2. 펌웨어가 최신 버전인지 확인
3. 로그를 확인하여 에러 메시지 확인

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다.
