# nRF52 클럭: 내부 클럭 사용 설정

## 이 프로젝트에서 바꾼 설정 (내부 클럭)

**LF 클럭(32.768kHz 대역)** 을 외부 크리스탈(XTAL) 대신 **내부 RC** 로 쓰도록 바꿨습니다.

| 설정 | 파일 | 변경 |
|------|------|------|
| `NRFX_CLOCK_CONFIG_LF_SRC` | sdk_config.h | 1 (XTAL) → **0 (RC)** |
| `CLOCK_CONFIG_LF_SRC` | sdk_config.h | 1 (XTAL) → **0 (RC)** |
| `NRF_SDH_CLOCK_LF_SRC` | sdk_config.h | 1 (XTAL) → **0 (RC)** |
| `NRF_SDH_CLOCK_LF_RC_CTIV` | sdk_config.h | 0 → **2** (LF RC 보정 간격) |

32.768kHz 크리스탈 없이 **내부 LF RC** 만으로 동작합니다. BLE(SoftDevice)는 LF RC + 보정으로 타이밍을 맞춥니다.

---

# nRF52 HFCLK / 64MHz (STM32 PLL처럼 쓰려면)

nRF52에는 **STM32 같은 PLL이 없습니다.** 고주파 클럭(HFCLK) 소스는 두 가지뿐입니다.

| 소스 | 주파수 | 용도 |
|------|--------|------|
| **HFXO** (외부 크리스탈) | **32 MHz** | BLE 등 정확한 타이밍 필요 시 |
| **HFINT** (내부 RC) | **64 MHz** | 저전력/빠른 기동, 정확도 낮음 |

- 32MHz 크리스탈을 달면 HFCLK = **32MHz** 로 동작합니다. (×2 해서 64로 올리는 회로 없음.)
- 64MHz로 돌리려면 **내부 64MHz RC(HFINT)** 를 쓰는 경로를 써야 합니다.

## SoftDevice 사용 시 (BLE)

- SoftDevice는 보통 **HFXO(32MHz)** 를 요청합니다. (`sd_clock_hfclk_request()` 등)
- BLE 타이밍 정확도를 위해 크리스탈을 쓰기 때문에, 앱만 바꿔서 64MHz RC로 고정하기는 어렵고, SoftDevice 정책에 따릅니다.

## SoftDevice 없이 단독 앱이라면

- 전원/초기화 후 HFCLK를 **크리스탈이 아닌 내부 RC** 로 두면 이론상 64MHz로 동작할 수 있습니다.
- 이 경우 NRF_CLOCK 레지스터에서 HFCLK 소스를 RC로 설정하는 식으로 제어해야 하며, SDK 예제는 보통 크리스탈 경로를 가정합니다.

## 정리

- **LF**: sdk_config 변경으로 **내부 RC** 사용 중 (32.768kHz 크리스탈 불필요).
- **HF**: 32MHz 크리스탈을 단 상태라면 CPU는 **32MHz** 로 동작하는 것이 맞고, WS2812 타이밍은 `WS2812_CPU_MHZ 32` 기준이 맞습니다.
- 64MHz가 꼭 필요하면: (1) BLE를 쓰지 않고 (2) HFCLK를 내부 64MHz RC로 고정하는 별도 초기화가 필요하며, STM32의 PLL 설정처럼 “크리스탈 × 배율”로 올리는 방식은 nRF52에는 없습니다.

---

## 32MHz를 내부로 설정할 수 있나? / 32MHz 포트가 빠진 보드

**32MHz는 내부로 바꿀 수 없습니다.** nRF52에는 32MHz 내부 오실레이터가 없고, HF 소스는 (1) 외부 32MHz 크리스탈 HFXO (2) 내부 64MHz RC HFINT 둘뿐입니다.

**32MHz 포트가 빠진 보드:** Nordic 공식 답변 기준, **BLE(라디오)를 쓰려면 외부 32MHz 크리스탈이 필수**입니다. 2.4GHz 채널이 32MHz 크리스탈에서 파생되므로, 32MHz 없이는 BLE를 정상 동작시키는 것이 지원되지 않습니다.

**선택지:** (1) **BLE 포기** – 내부 64MHz RC만 사용, SoftDevice 없이 LED 등만 동작. (2) **32MHz 회로 복구** – 보드에 32MHz 크리스탈(또는 32MHz 클럭 소스)을 다시 추가.
