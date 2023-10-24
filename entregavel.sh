#!/bin/bash



# variaveis

vermelho="\033[0;31m"
verde="\033[0;32m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"

function baixarProj (){
	echo -e "$verde Baixando os arquivos necessários para execução \033[0m"
				
		sudo apt install git-all -y

		git clone https://github.com/teuscapellari/entregaveis.git
}

function listaProcessosInfos (){
	cd entregaveis
	cd Listar_Processos_jar

		echo -e "$verde Listando os processos do computador \033[0m"
		java -jar Listar_Processos.jar

		echo -e "$verde Listando informações do computador \033[0m"
		java -jar ListaInfo.jar
}

function listaInfosBD (){
	echo -e "$amarelo Deseja prosseguir para Listar informações com o Banco de Dados? [s/n] \033[0m"

		read get
		if [ "$get" == "s" ];
			then
			echo -e "$amarelo Iniciando banco de dados \033[0m"
			sudo apt install mysql-server -y
			echo -e "$amarelo Iniciando script \033[0m"
			sudo mysql -h localhost -u root -p <script-desenvolvimento.sql
			cd COM-O-BD
			java -jar ListaInfo.jar
		else
			echo -e "$vermelho Execução cancelada \033[0m"
		fi
}

sudo apt-get update && sudo apt-get upgrade

echo -e "\033[1;32m 🅱 🅴 🅼 -🆅 🅸 🅽 🅳 🅾 \033[0m"
echo -e "$verde Vamos iniciar a instalação do sistema BankSecure \033[0m"
echo -e "$verde Vamos começar verificando a existência do Java na sua máquina \033[0m"
echo -e "\033[1;33m Caso não exista uma versão do Java compatível, uma será instalada \033[0m"
echo -e "$amarelo Deseja continuar? [s/n] \033[0m"

read get
if [ "$get" == "s" ];
	then

		java -version #verifica versao atual do java

		if [  $? = 0 ]; #se retorno for igual a 0
			then #entao,
				echo -e "$verdeClaro ✔ 🅹 🅰 🆅 🅰  🅸 🅽 🆂 🆃 🅰 🅻 🅰 🅳 🅾 \033[0m" #print no terminal
				
				baixarProj
				
				listaProcessosInfos
				
				listaInfosBD

			else #se nao,
				echo -e "$vermelho ✘ Java não instalado \033[0m" #print no terminal
				echo -e "$verde Iniciando instalação \033[0m" #print no terminal

				sudo apt install openjdk-17-jre -y #executa instalacao do Java forcando o Yes
				
				baixarProj

				listaProcessosInfos

				listaInfosBD
		fi

	else
		echo -e "$vermelho ✘ Para utilizar nossos serviços, é necessário atualizar ou instalar o Java \033[0m"
fi


