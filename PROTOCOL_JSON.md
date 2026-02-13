# BLE LED Dongle - JSON 통신 프로토콜 명세서

## 1. 개요

본 문서는 BLE LED Dongle과 Flutter 앱 간의 JSON 기반 통신 프로토콜을 정의합니다.

### 1.1 기본 규칙
- **인코딩**: UTF-8
- **형식**: JSON (RFC 8259)
- **전송**: BLE NUS (Nordic UART Service)
- **MTU**: 기본 20바이트, 최대 247바이트 (협상 후)
- **구분자**: 각 JSON 메시지는 `\n` 또는 `\r\n`으로 종료

### 1.2 데이터 크기 제약
- **단일 메시지**: MTU 크기 이내 (안전하게 200바이트 이하 권장)
- **대용량 데이터**: 청크 분할 전송 필수
- **이미지**: 432 바이트 (12×12×3) → Base64 인코딩 시 576 바이트
- **애니메이션**: 최대 300 프레임 (10초 × 30 FPS) → 약 130KB

---

## 2. 명령어 형식

모든 명령은 다음 기본 구조를 따릅니다:

```json
{
  "cmd": "command_name",
  "id": 12345,  // 선택사항: 요청 ID (응답 매칭용)
  "data": { ... }  // 명령별 데이터
}
```

---

## 3. 이미지 전송 프로토콜

### 3.1 형식 1: Base64 인코딩 (권장)

**단일 메시지로 전송 가능** (576 바이트 → 청크 분할 필요)

```json
{
  "cmd": "set_image",
  "id": 1001,
  "data": {
    "format": "base64",
    "pixels": "AACAgICA...",  // Base64 인코딩된 RGB 데이터 (432 바이트)
    "brightness": 255,  // 선택사항: 0-255 (기본값: 255)
    "apply": true  // 선택사항: 즉시 적용 여부 (기본값: true)
  }
}
```

**픽셀 데이터 형식**:
- 행 우선 순서 (Row-major): (0,0), (0,1), ..., (0,11), (1,0), ..., (11,11)
- 각 픽셀: [R, G, B] (각 1바이트, 0-255)
- 총 144 픽셀 × 3 바이트 = 432 바이트
- Base64 인코딩: 432 × 4/3 = 576 바이트

### 3.2 형식 2: JSON 배열 (작은 이미지용)

**단일 메시지로 전송 가능** (약 1KB, MTU 협상 후 가능)

```json
{
  "cmd": "set_image",
  "id": 1002,
  "data": {
    "format": "array",
    "pixels": [
      [255, 0, 0],    // (0,0) - Red
      [0, 255, 0],    // (0,1) - Green
      [0, 0, 255],    // (0,2) - Blue
      ...              // 총 144개
    ],
    "brightness": 200
  }
}
```

### 3.3 형식 3: 압축 형식 (색상 팔레트)

**메모리 효율적, 반복되는 색상이 많은 경우**

```json
{
  "cmd": "set_image",
  "id": 1003,
  "data": {
    "format": "palette",
    "palette": [
      [0, 0, 0],      // 인덱스 0: 검정
      [255, 255, 255], // 인덱스 1: 흰색
      [255, 0, 0],    // 인덱스 2: 빨강
      [0, 255, 0],    // 인덱스 3: 초록
      [0, 0, 255]     // 인덱스 4: 파랑
    ],
    "pixels": "00001111222233334444...",  // 각 픽셀의 팔레트 인덱스 (Base64 또는 16진수)
    "brightness": 255
  }
}
```

---

## 4. 애니메이션 전송 프로토콜

### 4.1 청크 분할 전송 (필수)

애니메이션은 여러 청크로 나누어 전송합니다.

#### 4.1.1 초기화 명령

```json
{
  "cmd": "set_animation_init",
  "id": 2001,
  "data": {
    "total_frames": 100,
    "fps": 20,  // 프레임 레이트 (선택사항, 기본값: 20)
    "loop": true,  // 반복 여부
    "loop_count": 0,  // 0 = 무한, >0 = 지정 횟수
    "play_mode": "forward"  // "forward", "reverse", "pingpong"
  }
}
```

#### 4.1.2 청크 전송

```json
{
  "cmd": "set_animation_chunk",
  "id": 2002,
  "data": {
    "chunk_id": 0,  // 청크 번호 (0부터 시작)
    "total_chunks": 5,  // 전체 청크 수
    "frame_start": 0,  // 이 청크의 시작 프레임 인덱스
    "frame_count": 20,  // 이 청크의 프레임 수
    "format": "base64",
    "frames": "AACAgICA...",  // Base64 인코딩된 프레임 데이터
    "durations": [100, 100, 100, ...]  // 선택사항: 각 프레임의 지속 시간(ms)
  }
}
```

**프레임 데이터 형식**:
- 각 프레임: 432 바이트 (12×12×3)
- N개 프레임: 432 × N 바이트
- Base64 인코딩: (432 × N) × 4/3 바이트

**예시 계산**:
- 20 프레임 = 8,640 바이트 → Base64 = 11,520 바이트
- MTU 247바이트 기준: 약 47개 패킷 필요

#### 4.1.3 완료 확인

```json
{
  "cmd": "set_animation_complete",
  "id": 2003,
  "data": {
    "verify": true  // 선택사항: 데이터 검증 요청
  }
}
```

### 4.2 단일 프레임 업데이트 (실시간 스트리밍)

```json
{
  "cmd": "set_animation_frame",
  "id": 2004,
  "data": {
    "frame_index": 5,  // 프레임 번호
    "format": "base64",
    "pixels": "AACAgICA...",  // 단일 프레임 데이터
    "duration_ms": 100  // 이 프레임의 지속 시간
  }
}
```

---

## 5. 응답 메시지

### 5.1 성공 응답

```json
{
  "cmd": "ack",
  "id": 1001,  // 요청한 명령의 ID
  "status": "ok",
  "data": {
    "message": "Image set successfully"
  }
}
```

### 5.2 에러 응답

```json
{
  "cmd": "error",
  "id": 1001,  // 요청한 명령의 ID (에러인 경우)
  "status": "error",
  "data": {
    "code": "INVALID_FORMAT",  // 에러 코드
    "message": "Invalid pixel data format"
  }
}
```

**에러 코드 목록**:
- `INVALID_FORMAT`: 잘못된 데이터 형식
- `INVALID_SIZE`: 데이터 크기 오류
- `MEMORY_FULL`: 메모리 부족
- `INVALID_CMD`: 알 수 없는 명령
- `CHUNK_MISMATCH`: 청크 번호 불일치
- `NOT_READY`: 아직 준비되지 않음 (예: 초기화 전 청크 수신)

### 5.3 진행 상황 응답 (대용량 전송 시)

```json
{
  "cmd": "progress",
  "id": 2002,
  "status": "ok",
  "data": {
    "chunk_id": 2,
    "total_chunks": 5,
    "progress": 40  // 진행률 (%)
  }
}
```

---

## 6. 제어 명령

### 6.1 재생 제어

```json
{
  "cmd": "play"
}
```

```json
{
  "cmd": "pause"
}
```

```json
{
  "cmd": "stop"
}
```

```json
{
  "cmd": "reset"
}
```

### 6.2 밝기 조절

```json
{
  "cmd": "set_brightness",
  "data": {
    "brightness": 150  // 0-255
  }
}
```

### 6.3 상태 조회

**요청**:
```json
{
  "cmd": "get_status"
}
```

**응답**:
```json
{
  "cmd": "status",
  "status": "ok",
  "data": {
    "mode": "animation",  // "image", "animation", "idle"
    "brightness": 200,
    "animation": {
      "current_frame": 15,
      "total_frames": 100,
      "is_playing": true,
      "loop": true
    }
  }
}
```

---

## 7. 데이터 인코딩 상세

### 7.1 Base64 인코딩 규칙

**픽셀 데이터 → Base64 변환 예시** (Dart):

```dart
// 픽셀 데이터 준비 (432 바이트)
List<int> pixelData = [];
for (int row = 0; row < 12; row++) {
  for (int col = 0; col < 12; col++) {
    pixelData.add(r);  // Red
    pixelData.add(g);  // Green
    pixelData.add(b);  // Blue
  }
}

// Base64 인코딩
String base64Data = base64Encode(pixelData);
```

**Base64 디코딩** (C 펌웨어):

```c
// Base64 디코딩 후 픽셀 데이터 추출
// 각 3바이트가 하나의 픽셀 (R, G, B)
uint8_t* decoded = base64_decode(base64_string, &decoded_len);
for (int i = 0; i < 144; i++) {
    uint8_t r = decoded[i * 3 + 0];
    uint8_t g = decoded[i * 3 + 1];
    uint8_t b = decoded[i * 3 + 2];
    uint8_t row = i / 12;
    uint8_t col = i % 12;
    matrix_set_pixel(row, col, r, g, b);
}
```

### 7.2 픽셀 순서

**행 우선 순서 (Row-major)**:
```
(0,0)  (0,1)  ...  (0,11)
(1,0)  (1,1)  ...  (1,11)
...
(11,0) (11,1) ...  (11,11)
```

**인덱스 계산**:
```
index = row * 12 + col
row = index / 12
col = index % 12
```

---

## 8. 전송 프로토콜 예시

### 8.1 이미지 전송 시나리오

**1단계: 앱 → 디바이스 (이미지 전송)**
```json
{"cmd":"set_image","id":1001,"data":{"format":"base64","pixels":"AACAgICA...","brightness":255}}
```

**2단계: 디바이스 → 앱 (응답)**
```json
{"cmd":"ack","id":1001,"status":"ok","data":{"message":"Image set successfully"}}
```

### 8.2 애니메이션 전송 시나리오

**1단계: 앱 → 디바이스 (초기화)**
```json
{"cmd":"set_animation_init","id":2001,"data":{"total_frames":100,"fps":20,"loop":true,"play_mode":"forward"}}
```

**2단계: 디바이스 → 앱 (초기화 확인)**
```json
{"cmd":"ack","id":2001,"status":"ok","data":{"message":"Animation buffer initialized"}}
```

**3단계: 앱 → 디바이스 (청크 0 전송)**
```json
{"cmd":"set_animation_chunk","id":2002,"data":{"chunk_id":0,"total_chunks":5,"frame_start":0,"frame_count":20,"format":"base64","frames":"AACAgICA..."}}
```

**4단계: 디바이스 → 앱 (청크 0 수신 확인)**
```json
{"cmd":"progress","id":2002,"status":"ok","data":{"chunk_id":0,"total_chunks":5,"progress":20}}
```

**5단계: 앱 → 디바이스 (청크 1-4 전송)**
... (반복)

**6단계: 앱 → 디바이스 (완료)**
```json
{"cmd":"set_animation_complete","id":2003,"data":{"verify":true}}
```

**7단계: 디바이스 → 앱 (완료 확인)**
```json
{"cmd":"ack","id":2003,"status":"ok","data":{"message":"Animation ready to play"}}
```

---

## 9. 구현 가이드라인

### 9.1 앱 측 (Flutter)

1. **JSON 생성**: `dart:convert`의 `jsonEncode()` 사용
2. **Base64 인코딩**: `dart:convert`의 `base64Encode()` 사용
3. **청크 분할**: MTU 크기 고려하여 메시지 분할
4. **전송 큐**: 순차 전송 보장
5. **타임아웃**: 각 명령에 대한 타임아웃 설정 (기본 5초)

### 9.2 펌웨어 측 (C)

1. **JSON 파싱**: cJSON 라이브러리 사용
2. **Base64 디코딩**: 경량 Base64 디코더 구현
3. **버퍼 관리**: 
   - 이미지: 432 바이트 고정 버퍼
   - 애니메이션: 동적 할당 또는 제한된 프레임 수
4. **에러 처리**: 모든 명령에 대한 검증 및 에러 응답
5. **메모리 검증**: 버퍼 오버플로우 방지

### 9.3 메시지 크기 제한

- **단일 명령**: 200 바이트 이하 권장
- **Base64 이미지**: 576 바이트 → 청크 분할 필요
- **Base64 애니메이션 청크**: 프레임 수에 따라 조절 (권장: 5-10 프레임/청크)

---

## 10. 버전 관리

### 10.1 프로토콜 버전

```json
{
  "cmd": "get_protocol_version"
}
```

```json
{
  "cmd": "protocol_version",
  "data": {
    "version": "1.0",
    "supported_formats": ["base64", "array", "palette"]
  }
}
```

---

## 11. 참고사항

### 11.1 성능 고려사항

- **전송 속도**: BLE는 약 1-2 KB/s (연결 품질에 따라 다름)
- **100 프레임 애니메이션**: 약 130KB → 전송 시간 약 65-130초
- **진행률 표시**: 사용자 경험을 위해 필수

### 11.2 메모리 제약

- **nRF52 RAM**: 약 64KB
- **애니메이션 버퍼**: 프레임 수 제한 필요 (예: 최대 50-100 프레임)
- **스트리밍**: 실시간 수신 및 재생 고려

### 11.3 에러 복구

- **전송 실패**: 재시도 로직 구현
- **청크 누락**: 청크 번호 검증 및 재요청
- **연결 끊김**: 재연결 후 상태 복구

---

**문서 버전**: 1.0  
**작성일**: 2024년  
**최종 수정일**: 2024년
