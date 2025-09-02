function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "                Menu Suporte N2 - IPEA" -ForegroundColor White
    Write-Host "Comandos Essenciais de Manutencao para Windows 10 e 11" -ForegroundColor White
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "                Escolha uma opcao:" -ForegroundColor White
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "1.  Rodar SFC/SCANNOW" -ForegroundColor Blue
    Write-Host "2.  Rodar CHKDSK" -ForegroundColor Blue
    Write-Host "3.  Executar instalador do Driver Booster" -ForegroundColor Blue
    Write-Host "4.  Executar Revo Uninstaller" -ForegroundColor Blue
    Write-Host "5.  Executar Windows Defender" -ForegroundColor Blue
    Write-Host "6.  Limpar arquivos temporarios" -ForegroundColor Blue
    Write-Host "7.  Restaurar imagem do sistema (DISM)" -ForegroundColor Blue
    Write-Host "8.  Ver IP da maquina" -ForegroundColor Blue
    Write-Host "9.  Pingar um endereco IP" -ForegroundColor Blue
    Write-Host "10. Sair" -ForegroundColor Red
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan
}

# Laço principal do menu
while ($true) {
    Show-Menu

    # Solicita a escolha do usuário
    $escolha = Read-Host "Digite o numero da sua escolha"

    # Manipula a escolha do usuário
    switch ($escolha) {
        "1" {
            Write-Host "Opcao 1 selecionada: Rodando SFC/SCANNOW..." -ForegroundColor Yellow
            try {
                & sfc /scannow
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "SFC/SCANNOW executado com sucesso." -ForegroundColor Green
                } else {
                    Write-Host "Erro ao executar SFC/SCANNOW. Execute o script como Administrador." -ForegroundColor Red
                }
            } catch {
                Write-Host "Ocorreu um erro ao executar o comando." -ForegroundColor Red
            }
            break
        }
        "2" {
            Write-Host "Opcao 2 selecionada: Rodando CHKDSK..." -ForegroundColor Yellow
            $drive = Read-Host "Digite a letra do drive (ex: C)"
            Write-Host "Verificando o drive $drive..." -ForegroundColor Yellow
            try {
                # Usando o comando nativo de PowerShell
                Repair-Volume -DriveLetter $drive -Scan -Verbose
                Write-Host "CHKDSK executado com sucesso." -ForegroundColor Green
            } catch {
                Write-Host "Ocorreu um erro ao executar o comando." -ForegroundColor Red
            }
            break
        }
        "3" {
            Write-Host "Opcao 3 selecionada: Executando instalador do Driver Booster..." -ForegroundColor Yellow
            $path = "\\storage1\bibsoft\# PH - Softwares\Dia a dia\driver_booster_setup.exe"
            try {
                if (Test-Path -Path $path) {
                    Start-Process -FilePath $path
                    Write-Host "Programa executado com sucesso." -ForegroundColor Green
                } else {
                    Write-Host "Erro: Arquivo nao encontrado. Verifique o caminho." -ForegroundColor Red
                }
            } catch {
                Write-Host "Ocorreu um erro ao executar o programa." -ForegroundColor Red
            }
            break
        }
        "4" {
            Write-Host "Opcao 4 selecionada: Executando Revo Uninstaller..." -ForegroundColor Yellow
            $path = "\\storage1\bibsoft\# PH - Softwares\Dia a dia\RevoUninstaller_Portable\RevoUPort.exe"
            try {
                if (Test-Path -Path $path) {
                    Start-Process -FilePath $path
                    Write-Host "Programa executado com sucesso." -ForegroundColor Green
                } else {
                    Write-Host "Erro: Arquivo nao encontrado. Verifique o caminho." -ForegroundColor Red
                }
            } catch {
                Write-Host "Ocorreu um erro ao executar o programa." -ForegroundColor Red
            }
            break
        }
        "5" {
            Write-Host "Opcao 5 selecionada: Executando Windows Defender..." -ForegroundColor Yellow
            $path = "\\storage1\bibsoft\#BibSoft_NEW#\1_ SOFTWARES PADRAO\PADROES\WindowsDefenderATPLocalOnboardingScript.cmd"
            try {
                if (Test-Path -Path $path) {
                    Start-Process -FilePath $path
                    Write-Host "Programa executado com sucesso." -ForegroundColor Green
                } else {
                    Write-Host "Erro: Arquivo nao encontrado. Verifique o caminho." -ForegroundColor Red
                }
            } catch {
                Write-Host "Ocorreu um erro ao executar o programa." -ForegroundColor Red
            }
            break
        }
        "6" {
            Write-Host "Opcao 6 selecionada: Limpando arquivos temporarios..." -ForegroundColor Yellow
            try {
                $tempPaths = "$env:TEMP\*", "$env:SystemRoot\Temp\*"
                foreach ($tempPath in $tempPaths) {
                    if (Test-Path $tempPath) {
                        Remove-Item -Path $tempPath -Recurse -Force -ErrorAction SilentlyContinue
                    }
                }
                Write-Host "Arquivos temporarios limpos com sucesso." -ForegroundColor Green
            } catch {
                Write-Host "Ocorreu um erro ao limpar os arquivos temporarios." -ForegroundColor Red
            }
            break
        }
        "7" {
            Write-Host "Opcao 7 selecionada: Restaurando imagem do sistema (DISM)..." -ForegroundColor Yellow
            try {
                & dism /Online /Cleanup-Image /RestoreHealth
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "DISM executado com sucesso." -ForegroundColor Green
                } else {
                    Write-Host "Erro ao executar DISM. Execute o script como Administrador." -ForegroundColor Red
                }
            } catch {
                Write-Host "Ocorreu um erro ao executar o comando." -ForegroundColor Red
            }
            break
        }
        "8" {
            Write-Host "Opcao 8 selecionada: Verificando o IP da maquina..." -ForegroundColor Yellow
            try {
                Get-NetIPAddress | Format-Table -Property IPAddress, InterfaceAlias, AddressFamily -AutoSize
                Write-Host "Comando executado com sucesso." -ForegroundColor Green
            } catch {
                Write-Host "Ocorreu um erro ao executar o comando." -ForegroundColor Red
            }
            break
        }
        "9" {
            Write-Host "Opcao 9 selecionada: Pingar um endereco IP..." -ForegroundColor Yellow
            $endereco = Read-Host "Digite o endereco IP ou HostName para pingar"
            try {
                Test-Connection -ComputerName $endereco
                Write-Host "Comando executado com sucesso." -ForegroundColor Green
            } catch {
                Write-Host "Ocorreu um erro ao executar o comando." -ForegroundColor Red
            }
            break
        }
        "10" {
            Write-Host "Saindo do script. Tchau!" -ForegroundColor Red
            Start-Sleep -Seconds 2
            exit
        }
        default {
            Write-Host "Opcao invalida. Por favor, digite um numero de 1 a 10." -ForegroundColor Red
            break
        }
    }
    
    # Pausa e espera a interação do usuário para continuar
    Write-Host ""
    Write-Host "Pressione qualquer tecla para continuar..." -ForegroundColor White
    $null = [System.Console]::ReadKey($true)
}