# S112 + 앱 플래시 방법 (nRF52810)

## 왜 LED/RTT가 안 나오고 0xFF로 보이나요?

- **원인**: 지금 플래시에 들어간 건 **예전 S132용 앱**(시작 주소 **0x1b000**)이거나, **앱이 아예 안 들어간 상태**입니다.
- S112는 앱을 **0x19000**에서 실행합니다. 0x19000이 비어 있으면(0xFF) main이 안 불리고, LED/RTT도 동작하지 않습니다.

## 반드시 할 일

### 1) **Clean 후 다시 빌드** (S112용으로 새로 만들기)

SES에서:

1. **Project → Clean**
2. **Project → Build** (또는 Rebuild All)

이후 생성되는 hex가 **0x19000**부터 들어가야 합니다.

### 2) **hex가 0x19000인지 확인** (선택)

`Output\Debug\Exe\ble_app_uart_ble_led_dongle.hex`를 메모장으로 열어서:

- **첫 줄**이 `:02000002**01**00` 이렇게 **01 00**이 들어가 있고  
- **그 다음 줄**이 `:10**90**00 00 ...` 처럼 **90**으로 시작하면  

→ 앱이 0x**19**000부터 들어가는 올바른 S112 빌드입니다.

(예전 S132 빌드면 `:10**B0**00 00` 처럼 B0으로 시작하고, 0x1b000에만 데이터가 들어갑니다.)

### 3) **플래시는 “한 번에 한 파일”로**

**방법 A – 권장: 합쳐진 hex 한 번만 넣기**

1. **전체 칩 지우기(Full chip erase)**  
   (nRF Connect Programmer 또는 J-Link에서 Erase chip)
2. 빌드 후 **아래 파일 하나만** 플래시:
   - `firmware\Output\Debug\Exe\ble_app_uart_ble_led_dongle.hex`  
   (post-build에서 merge가 됐다면 이 파일이 **S112 + 앱**이 합쳐진 hex입니다.)
3. mergehex가 PATH에 없어서 post-build가 실패했다면:
   - `firmware` 폴더에서 `merge_hex.bat` 실행  
     (인자: `Output\Debug\`)
   - 그 다음 위와 같은 hex 파일을 플래시

**방법 B – S112 따로, 앱 따로 넣기**

1. **Full chip erase**
2. **S112 hex** 먼저 플래시  
   - 경로:  
     `C:\nrf5_sdk\nRF5_SDK_17.1.0_ddde560\components\softdevice\s112\hex\s112_nrf52_7.2.0_softdevice.hex`
3. 그 다음 **앱 hex** 플래시  
   - **반드시 방금 Clean+Build한**  
     `Output\Debug\Exe\ble_app_uart_ble_led_dongle.hex`  
   - (0x19000부터 들어가는 S112용 빌드여야 함)

### 4) **디버깅할 때**

- **Run**만 누르면 SES가 현재 프로젝트 elf/hex를 타겟에 올립니다.  
  **Clean + Build** 한 뒤에 Run하면 0x19000에 앱이 올라가서 main이 호출됩니다.
- 전원만 꽂아서 동작 확인할 때는, 위 3)대로 **합쳐진 hex 한 번** 넣은 상태에서 전원 리셋하면 됩니다.

## 요약

1. **Clean → Build** 로 S112용 hex(0x19000 시작) 다시 만들기  
2. **Full chip erase** 후  
3. **S112+앱 합쳐진 hex 한 파일**만 플래시 (또는 S112 먼저, 그 다음 방금 빌드한 앱 hex)  
4. 예전에 “S132용 hex”나 “merge 안 된 앱만” 넣었으면 0x19000이 비어 있어서 지금처럼 동작합니다.
