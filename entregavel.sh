#!/bin/bash



# variaveis
corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"





function baixarProj (){
	echo "Baixando os arquivos necessários para execução"
				
		sudo apt install git-all -y

		git clone https://github.com/teuscapellari/entregaveis.git
}

function listaProcessosInfos (){
	cd entregaveis
	cd Listar_Processos_jar

		echo "Listando os processos do computador"
		java -jar Listar_Processos.jar

		echo "Listando informações do computador"
		java -jar ListaInfo.jar
}

function listaInfosBD (){
	echo "Deseja prosseguir para Listar informações com o Banco de Dados? [s/n]"

		read get
		if [ "$get" == "s" ];
			then
			echo "Iniciando bla bla bla"
			sudo apt install mysql-server -y
			echo "Iniciando script"
			mysql -h localhost -u root -p <script-desenvolvimento.sql
			cd COM-O-BD
			java -jar ListaInfo.jar
		else
			echo -e "$vermelho Execução cancelada \033[0m"
		fi
}

sudo apt-get update && sudo apt-get upgrade

echo -e "\033[1;32m ✔ 🅱 🅴 🅼 -🆅 🅸 🅽 🅳 🅾 \033[0m"
echo -e "\033[0;32m Vamos iniciar a instalação do sistema BankSecure \033[0m"
echo -e "\033[0;32m Vamos começar verificando a existência do Java na sua máquina \033[0m"
echo -e "\033[1;33m Caso não exista uma versão do Java compatível, uma será instalada \033[0m"
echo -e "$amarelo Deseja continuar? [s/n] \033[0m"

read get
if [ "$get" == "s" ];
	then

		java -version #verifica versao atual do java

		if [  $? = 0 ]; #se retorno for igual a 0
			then #entao,
				echo "Java instalado" #print no terminal
				
				baixarProj
				
				listaProcessosInfos
				
				listaInfosBD

			else #se nao,
				echo -e "$vermelho Java não instalado \033[0m" #print no terminal
				echo "Iniciando instalação " #print no terminal

				sudo apt install openjdk-17-jre -y #executa instalacao do Java forcando o Yes
				
				baixarProj

				listaProcessosInfos

				listaInfosBD
		fi

	else
		echo -e "$vermelho ✘ Para utilizar nossos serviços, é necessário atualizar ou instalar o Java \033[0m"
fi


