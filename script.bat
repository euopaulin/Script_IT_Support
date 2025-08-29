@echo off
goto menu

:menu
cls
echo ----------------------------------------------
echo            Menu Suporte N2 - IPEA
echo  Melhores comandos para manuntecao de máquinas
echo ----------------------------------------------
echo           Feito por Paulo Henrique
echo ----------------------------------------------
echo 1. Rodar SFC/SCANNOW
echo 2. Rodar CHKDSK
echo 3. Executar instalador do Driver Booster
echo 4. Executar Revo Uninstaller
echo 4. Sair
echo ----------------------------------------------
set /p "escolha=Digite o numero da sua escolha: "
echo Voce escolheu a opcao: %escolha%
echo.

if "%escolha%"=="1" goto sfc
if "%escolha%"=="2" goto chkdsk
if "%escolha%"=="3" goto programa3
if "%escolha%"=="4" goto programa4
if "%escolha%"=="5" goto programa5
if "%escolha%"=="" goto sair

echo Opcao invalida. Por favor, digite um numero de 1 a 4.
pause
goto menu

:sfc
echo Opcao 1 selecionada: Rodando SFC/SCANNOW...
sfc /scannow
if %errorlevel% neq 0 (
    echo Erro ao executar SFC/SCANNOW. Execute o arquivo como Administrador.
) else (
    echo SFC/SCANNOW executado com sucesso.
)
pause
goto menu

:chkdsk
echo Opcao 2 selecionada: Rodando CHKDSK...
set /p "drive=Digite a letra do drive (ex: C)? "
echo Verificando o drive %drive%...
chkdsk %drive%: /f /r
if %errorlevel% neq 0 (
    echo Erro ao executar CHKDSK.
) else (
    echo CHKDSK executado com sucesso.
)
pause
goto menu

:programa3
echo Opcao 3 selecionada: Executando programa Driver Booster...
start "" "\\storage1\bibsoft\# PH - Softwares\Dia a dia\driver_booster_setup.exe"
if %errorlevel% neq 0 (
    echo Erro ao executar o programa.
) else (
    echo Programa executado com sucesso.
)
pause
goto menu

:programa4
echo Opcao 4 selecionada: Executando programa Revo Uninstaller...
start "" "\\storage1\bibsoft\# PH - Softwares\Dia a dia\RevoUninstaller_Portable\RevoUPort.exe
if %errorlevel% neq 0 (
    echo Erro ao executar o programa.
) else (
    echo Programa executado com sucesso.
)
pause
goto menu

:programa5
echo Opcao 5 selecionada: Executando Windows Defender...
start "" "\\storage1\bibsoft\#BibSoft_NEW#\1_ SOFTWARES PADRÃO\PADRÕES\WindowsDefenderATPLocalOnboardingScript.cmd"
if %errorlevel% neq 0 (
    echo Erro ao executar o programa.
) else (
    echo Programa executado com sucesso.
)
pause
goto menu

:sair
echo Saindo do script. Tchau!
timeout /t 2 /nobreak >nul
exit