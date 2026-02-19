# JSON 프로토콜 통합 완료

BLE LED Dongle 펌웨어에 JSON 프로토콜 처리가 완료되었습니다.

## 추가된 파일

1. **json_parser.h / json_parser.c** - 경량 JSON 파서
2. **base64.h / base64.c** - Base64 디코더
3. **json_protocol.h / json_protocol.c** - JSON 프로토콜 핸들러

## 수정된 파일

1. **main.c** - JSON 프로토콜 통합
   - `ble_nus_cmd_received()` 함수가 JSON 명령 처리
   - `idle_state_handle()`에서 애니메이션 업데이트
   - `json_protocol_init()` 호출 추가

## 빌드 설정

프로젝트에 다음 소스 파일을 추가해야 합니다:
- `json_parser.c`
- `base64.c`
- `json_protocol.c`

## 기능

### 지원하는 명령어

1. **이미지 전송**
   - `set_image`: Base64 인코딩된 12x12 이미지 수신 및 표시

2. **애니메이션**
   - `set_animation_init`: 애니메이션 초기화
   - `set_animation_chunk`: 프레임 청크 수신
   - `set_animation_complete`: 전송 완료 확인

3. **제어**
   - `play`, `pause`, `stop`, `reset`
   - `set_brightness`: 밝기 조절 (0-255)
   - `get_status`: 현재 상태 조회

### 메모리 제약

- 최대 애니메이션 프레임: 100개
- 프레임당 데이터: 432 바이트
- 총 버퍼 크기: 약 43KB

## 테스트

1. 펌웨어를 빌드하고 디바이스에 플래시
2. Flutter 앱에서 디바이스 연결
3. 이미지 에디터에서 이미지 전송 테스트
4. 애니메이션 에디터에서 애니메이션 전송 테스트

## 디버깅

RTT 로그를 통해 다음을 확인할 수 있습니다:
- 수신된 JSON 명령
- 처리 결과
- 에러 메시지

## 주의사항

1. 애니메이션 타이밍은 현재 LED 업데이트 타이머(50ms)와 함께 처리됩니다.
2. 더 정확한 타이밍이 필요하면 별도의 app_timer를 사용하세요.
3. 메모리 부족 시 MAX_ANIMATION_FRAMES 값을 줄이세요.
