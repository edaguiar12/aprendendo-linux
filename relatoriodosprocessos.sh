#!/usr/bin/bash

function pause(){
    read -p "$*"
}

if [ -d != "/Documents/Processos" ];
then
    echo "removing trash along the way.."
    rm -rf Processos
fi

echo -e "Vamos criar um arquivo de informações dos processos? \nSim: digite y \nNão: digite n"

read yesno

if [ $yesno != "y" ];
then
    exit 1
else
    echo "criando a pasta processos e seu subdiretório.."
    cd ~/Documents && mkdir Processos && cd Processos && mkdir Processos2 && cd Processos2
    pause 'Pressione o botão [Enter] para continuar...'
    echo "criando o arquivo proc.."
    touch proc.txt
    pause 'Pressione o botão [Enter] para continuar...'
    echo "colocando os processos dentro do arquivo.."
    df -la | cat > proc.txt
    pause 'Pressione o botão [Enter] para continuar...'
    echo "Vamos visualizar o arquivo criado?"
    less proc.txt
    pause 'Pressione o botão [Enter] para continuar...'
    echo "Vamos agora fazer um backup de nosso arquivo!"
    cp proc.txt procBkp.txt && mv procBkp.txt ~/Documents/Processos
    pause 'Pressione o botão [Enter] para continuar...'
    echo "Vamos então excluir o arquivo e a pasta que criamos!"
    cd ~/Documents/Processos && rm -rf Processos2
    pause 'Pressione o botão [Enter] para continuar...'
    echo "Pronto!"
fi



