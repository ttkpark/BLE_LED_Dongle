# nRF52810 BLE UART Terminal Example

이 프로젝트는 nRF5 SDK의 `ble_app_uart` 예제를 기반으로 nRF52810용으로 설정한 간단한 터미널 예제입니다.

## 목적

- SDK 예제가 nRF52810에서 정상 동작하는지 확인
- SoftDevice 초기화 문제가 예제에서도 발생하는지 검증
- 기본 BLE UART 터미널 기능 테스트

## 프로젝트 구조

```
examples/
├── main.c              # 메인 애플리케이션 코드
├── config/
│   └── sdk_config.h   # SDK 설정 파일
├── flash_placement.xml # 메모리 레이아웃 설정
├── merge_hex.bat      # SoftDevice + 앱 병합 스크립트
└── ble_app_uart_example.emProject  # SEGGER Embedded Studio 프로젝트 파일
```

## 빌드 및 실행

1. SEGGER Embedded Studio에서 `ble_app_uart_example.emProject` 열기
2. Project → Build
3. Flash → Download and Debug

## 참고

- SoftDevice: S112 (nRF52810용)
- Flash 시작 주소: 0x19000
- RAM 시작 주소: 0x20000eb8
