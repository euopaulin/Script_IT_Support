import subprocess

def exibir_menu():
    print("---------------------------------")
    print("       Menu Suporte N2 - IPEA       ")
    print("  Melhores comandos para manutenção  ")                             
    print("---------------------------------")
    print("1. Rodar SFC/SCANNOW")
    print("2. Rodar CHKDSK")
    print("3. Executar programa X")
    print("4. Sair")
    print("---------------------------------")

def main():
    while True:
        exibir_menu()
        if input("Deseja continuar? (s/n): ").lower() == 's':
            escolha = input("Digite o número da sua escolha: ")

            print(f"Você escolheu a opção: {escolha}")
            if escolha == "1":
                print(f"Opção 1 selecionada: Rodando SFC/SCANNOW...")
                try:
                    subprocess.run(["sfc", "/scannow"], check=True, shell=True)
                    print("SFC/SCANNOW executado com sucesso.")
                    return
                except subprocess.CalledProcessError as e:
                    print(f"Erro ao executar SFC/SCANNOW: {e}")
                    return exibir_menu()
                
            if escolha == "2":
                print(f"Opção 2 selecionada: Rodando CHKDSK...")
                drive = input("Digite a letra do drive (ex: C)? ").upper()
                print(f"Verificando o drive {drive}...")
                try:
                    subprocess.run(["chkdsk", f"{drive}:", "/f", "/r"], check=True, shell=True)
                    print("CHKDSK executado com sucesso.")
                except subprocess.CalledProcessError as e:
                    print(f"Erro ao executar CHKDSK: {e}")

            if escolha == "3":
                caminho_programa=r"\\storage1\bibsoft\# PH - Softwares\Dia a dia\driver_booster_setup.exe"
                print(f"Opção 3 selecionada: Executando programa Driver Booster...")
                try:
                    subprocess.run([caminho_programa], check=True, shell=True)
                    print("Programa executado com sucesso.")
                except subprocess.CalledProcessError as e:
                    print(f"Erro ao executar o programa: {e}")           
        else:
            print("Saindo do programa.")
            break

# Chama a função principal para iniciar o script
if __name__ == "__main__":
    main()
