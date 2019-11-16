#!/bin/bash

init() 
{
	echo "-------------------------------------------------------------------"
	echo "Executando update-alternatives para java, javac e jar "
	echo "-------------------------------------------------------------------"
	
	sudo update-alternatives --config java
	sudo update-alternatives --config javac
	sudo update-alternatives --config jar
	
	echo "-------------------------------------------------------------------"
	echo "Removendo link  /usr/lib/jvm/jdk"
	echo "-------------------------------------------------------------------"
	sudo rm /usr/lib/jvm/jdk

	echo "-------------------------------------------------------------------"
	echo "Criando novo link  /usr/lib/jvm/jdk"
	echo "-------------------------------------------------------------------"

	if [[ $(java -version 2>&1) == *"OpenJDK"* ]] ; then 
		sudo ln -sf /usr/lib/jvm/jdk-amazon-corretto-11 /usr/lib/jvm/jdk		
	else 
		sudo ln -sf /usr/lib/jvm/jdk-oracle-8 /usr/lib/jvm/jdk
	fi

	echo "-------------------------------------------------------------------"
	echo "Recarregando /etc/profile"
	echo "-------------------------------------------------------------------"

	sudo -s
	source /etc/profile
}

init
