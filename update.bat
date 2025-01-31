@echo off
setlocal enabledelayedexpansion

:: �����������Ӻ��ļ���
set "URL=http://plana.ink/update_app/lastest_data"
set "ZIPFILE=lastest_data.zip"
set "DESTINATION=."  :: ��ѹĿ��Ŀ¼

:: ʹ�� curl ���� ZIP �ļ�
echo ���������ļ�...
curl -o "%ZIPFILE%" "%URL%" --silent --fail
if %ERRORLEVEL% neq 0 (
    echo ����ʧ�ܣ������������ӻ� URL �Ƿ���ȷ��
    exit /b 1
)

:: ����Ƿ����سɹ�
if not exist "%ZIPFILE%" (
    echo ����ʧ�ܣ��ļ�δ�ҵ���
    exit /b 1
)

:: ��ѹ ZIP �ļ�����Ҫ 7z �� tar��
echo ���ڽ�ѹ�ļ�...
:: ����Ѿ���װ 7z
tar -xf "%ZIPFILE%" -C "%DESTINATION%"
if %ERRORLEVEL% neq 0 (
    echo ��ѹʧ�ܣ���ȷ�����Ѿ���װ 7z �� tar��
    exit /b 1
)

:: ���� ZIP �ļ�
del "%ZIPFILE%"

echo ��ɣ�
pause

