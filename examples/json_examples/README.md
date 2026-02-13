# JSON 프로토콜 예제 파일

이 디렉토리에는 BLE LED Dongle 통신 프로토콜의 JSON 예제 파일들이 포함되어 있습니다.

## 파일 목록

- `example_image_simple.json` - 간단한 이미지 전송 예제 (JSON 배열 형식)
- `example_animation_init.json` - 애니메이션 초기화 명령 예제
- `example_animation_chunk.json` - 애니메이션 청크 전송 예제
- `example_control_commands.json` - 제어 명령 예제 모음
- `example_responses.json` - 응답 메시지 예제 모음

## 사용 방법

각 예제 파일은 실제 통신에서 사용할 수 있는 JSON 형식을 보여줍니다.

### 이미지 전송 예제

```bash
# example_image_simple.json 파일 내용을 BLE로 전송
```

### 애니메이션 전송 예제

1. `example_animation_init.json` 전송 (초기화)
2. `example_animation_chunk.json` 전송 (청크 0)
3. 추가 청크들 전송 (chunk_id 증가)
4. `set_animation_complete` 명령 전송

## 참고 문서

- `PROTOCOL_JSON.md` - 전체 프로토콜 명세서
- `REQUIREMENTS.md` - 프로젝트 요구사항 문서
