@echo off
chcp 65001
setlocal

set env=%1
set bump=%2

echo [INFO] ExcelToProto 실행 시작...

:: 표준 출력과 에러 출력을 함께 콘솔로 출력
ExcelToProto.exe %env% %bump% 2>&1

:: 종료 코드 확인
IF ERRORLEVEL 1 (
    echo [ERROR] ExcelToProto 실행 중 오류 발생
    PAUSE
    exit /b 1
)
echo [INFO] ExcelToProto 실행 완료

:: ./json 폴더 → ../Client/Assets/Resources/01_Data 복사
echo [INFO] 데이터 빌드 내용을 Client 경로로 복사 중...1
xcopy ".\db\DesignData.db" "..\Client\Assets\Resources\01_Data\DesignData.bytes" /Y /I
echo [INFO] 데이터 빌드 내용을 Client 경로로 복사 중...2
xcopy ".\csharp\*" "..\Client\Assets\01_Scripts\10_Table\" /E /Y /I

exit /b 0