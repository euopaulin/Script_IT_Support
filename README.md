# 💻 Script para Suporte de TI

### Script para otimizar e automatizar rotinas de manutenção e aprimoramento de desempenho em máquinas."

### O script foi desenvolvido em duas versões: uma definitiva em BAT e outra em Python, usada para estudos da linguagem.

## Como utilizar o script:

- ### Para usar o script, baixe o arquivo script.bat.
- ### Salve o arquivo em um diretório de sua preferência e execute-o com privilégios de administrador.
- ### Algumas opções precisarão de ajustes nos caminhos de rede, que podem ser feitos editando o script diretamente no Bloco de Notas ou no VSCode.

### Por exemplo nesse trecho é necessario alterar para o caminho especifico onde está o executavel do revo no seu ambiente:

```bash

    :programa4
    echo Opcao 4 selecionada: Executando programa Revo Uninstaller...
    start "" "Aqui vc deve colocar o caminho do seu"
    if %errorlevel% neq 0 (
        echo Erro ao executar o programa.
    ) else (
        echo Programa executado com sucesso.
    )
    pause
    goto menu

```


### Sinta-se à vontade para ajustar e aprimorar as frases para otimizar os processos de rotina do Suporte de TI.

