# SoftDevice 초기화 오류 검증 코드 분석

## 현재 문제점

1. **SVC 호출 블로킹**: `nrf_sdh_enable_request()` 호출 후 SVC_Handler에서 멈춤
2. **크리스탈 확인 완료**: 32MHz 크리스탈은 정상 동작 (force_32mhz_crystal 브랜치에서 확인)
3. **SoftDevice 존재 확인**: 플래시에 SoftDevice가 있음 (0x20000400 0x00000A81)
4. **벡터 테이블 유효**: Reset handler = 0x00000A81 (유효한 범위)

## 현재 검증 코드 구조

### 1. `check_softdevice_present()` (203-254줄)
- ✅ SoftDevice 플래시 존재 확인
- ✅ 벡터 테이블 유효성 검증
- ✅ 상세한 로그 출력

### 2. `ble_stack_init()` (257-369줄)
- ✅ SoftDevice 존재 확인 후 초기화 시도
- ✅ 클럭 설정 로그
- ⚠️ SVC 호출 전후 로그 (하지만 SVC 호출이 블로킹되면 "After SVC" 로그가 출력되지 않음)
- ✅ 에러 코드 확인
- ✅ `nrf_sdh_is_enabled()` 대기 (하지만 SVC 호출이 블로킹되면 여기까지 도달하지 않음)

## 문제 분석

### SVC 호출 블로킹 원인
- `nrf_sdh_enable_request()` → `sd_softdevice_enable()` SVC 호출
- SoftDevice가 SVC 인터럽트를 처리하지 못함
- 기본 `SVC_Handler`로 진입하여 무한 루프

### 가능한 원인
1. **SoftDevice 초기화 실패**: SoftDevice가 내부적으로 초기화에 실패
2. **SVC 인터럽트 벡터 문제**: SoftDevice가 SVC 벡터를 제대로 설정하지 못함
3. **RAM 설정 문제**: SoftDevice가 요구하는 RAM 영역이 올바르지 않음
4. **클럭 문제**: SoftDevice가 32MHz 크리스탈을 기다리다가 타임아웃 (하지만 크리스탈은 정상)

## 개선 제안

### 1. 32MHz 크리스탈 미리 시작
force_32mhz_crystal 브랜치에서 성공한 방법을 적용:
- SoftDevice 초기화 전에 32MHz 크리스탈을 미리 시작
- `nrfx_clock_hfclk_start()` 호출

### 2. 더 자세한 디버깅
- SVC 호출 전에 모든 레지스터 상태 로그
- HFCLK 상태 확인
- RAM 영역 확인

### 3. 타임아웃 감지 (한계)
- SVC 호출이 블로킹되면 타임아웃 감지 불가
- 하드웨어 워치독이 필요하지만, 현재는 소프트웨어로는 불가능

## 다음 단계

1. **32MHz 크리스탈 미리 시작 코드 추가**
   - `nrfx_clock` 사용하여 SoftDevice 초기화 전에 크리스탈 시작
   - force_32mhz_crystal 브랜치의 코드 참고

2. **RAM 설정 확인**
   - `flash_placement.xml` 확인
   - RAM 시작 주소가 올바른지 확인

3. **SoftDevice 재플래시**
   - Full chip erase 후 SoftDevice 재플래시
   - 올바른 버전의 SoftDevice 사용 확인
