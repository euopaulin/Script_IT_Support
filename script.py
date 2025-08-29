def exibir_menu():
    print("---------------------------------")
    print("       Menu Suporte N2       ")
    print("---------------------------------")
    print("1. Rodar SFC /SCANNOW")
    print("2. Rodar CHKDSK")
    print("3. Executar programa X")
    print("4. Sair")
    print("---------------------------------")

def main():
    exibir_menu()

    # Pede ao usuário para digitar uma opção e armazena a resposta na variável 'escolha'
    escolha = input("Digite o número da sua escolha: ")

    # Exibe a escolha do usuário
    print(f"Você escolheu a opção: {escolha}")

       # Lógica de decisão
    if escolha == "1":
        print("Opção 1 selecionada: Rodando SFC /SCANNOW...")
        # Aqui no futuro o comando será executado
    elif escolha == "2":
        print("Opção 2 selecionada: Rodando CHKDSK...")
        # Aqui no futuro o comando será executado
    elif escolha == "3":
        print("Opção 3 selecionada: Executando programa X...")
        # Aqui no futuro o executável será rodado
    elif escolha == "4":
        print("Saindo do script. Tchau!")
    else:
        print("Opção inválida. Por favor, digite um número de 1 a 4.")

# Inicia o script
if __name__ == "__main__":
    main()

# Chama a função principal para iniciar o script
if __name__ == "__main__":
    main()

