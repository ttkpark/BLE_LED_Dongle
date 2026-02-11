@echo off
REM Merge SoftDevice S112 and application hex for one-shot programming.
REM Requires: mergehex (nRF Command Line Tools) on PATH.
REM No arguments: path is derived from script location (avoids SES "duplicated argument" error).

set "SDK_HEX=C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/hex/s112_nrf52_7.2.0_softdevice.hex"
set "SCRIPT_DIR=%~dp0"
set "APP_HEX=%SCRIPT_DIR%Output\Release\Exe\ble_app_uart_pca10040e_s112.hex"

if not exist "%APP_HEX%" (
  echo merge_hex.bat: App hex not found: %APP_HEX%
  exit /b 1
)
if not exist "%SDK_HEX%" (
  echo merge_hex.bat: SoftDevice hex not found: %SDK_HEX%
  echo Edit SDK path in merge_hex.bat if needed.
  exit /b 1
)

REM Output to temp so mergehex never has -o same as an -m path (avoids "duplicated argument")
set "TMP_MERGED=%TEMP%\ble_app_uart_pca10040e_s112_merged.hex"
mergehex -m "%SDK_HEX%" "%APP_HEX%" -o "%TMP_MERGED%"
if errorlevel 1 exit /b 1
copy /Y "%TMP_MERGED%" "%APP_HEX%"
del /Q "%TMP_MERGED%" 2>nul
echo Merged SoftDevice + app into %APP_HEX%
