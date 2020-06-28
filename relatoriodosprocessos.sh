#!/usr/bin/bash

function pause() {
    read -p "$*"
}


echo -e "Vamos criar um arquivo de informações dos processos? \nSim: digite y \nNão: digite n"

read yesno

if [ $yesno != "y" ]; then
    exit 1
else

    if [ -d != "/Documents/Processos" ]; then
        echo "Vamos começar removendo aquivos e pastas criados anteriormente..."
        rm -rf Processos
    fi
    echo "criando a pasta e seu subdiretório.."
    cd ~/Documents && mkdir Processos && cd Processos && mkdir Processos2 && cd Processos2
    echo "criando o arquivo proc.."
    touch proc.txt
    echo "colocando os processos dentro do arquivo.."
    df -la | cat > proc.txt
    echo "criando um backup de nosso arquivo"
    cp proc.txt procBkp.txt && mv procBkp.txt ~/Documents/Processos
    echo "Excluindo os arquivos e pastas que não iremos mais usar.."
    cd ~/Documents/Processos && rm -rf Processos2
    echo "Pronto!"
    pause "Aperte uma tecla para visualizar o arquivo criado. 
    Use as setas do teclado para percorrer o arquivo e quando tiver terminado aperte a tecla (q) do teclado!"
    less procBkp.txt
fi
