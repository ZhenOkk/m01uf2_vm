#!/bin/bash
PORT="2022"
IP_SERVER=$1

if [ "$1" == "" ]
then
	echo "Debes indicar la dirección del servidor"
	echo "Ejemplo:"
	echo -e "\t$0 127.0.0.1"
	exit 1
	fi

IP=`ip a | grep "score global" | xargs | cut -d " " -f 3 | cut -d "/" -f 1`
PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABEZERA"

echo "DMAM" | nc $IP_SERVER  $PORT

DATA=`nc -l $PORT`

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1: Cabecera incorrecta"
	exit 1
fi
echo "3.ENVIANDO FILE_NAME dragon.txt"
echo "FILE_NAME dragon.txt" | nc $IP_SERVER $PORT
DATA=`nc -l $PORT`
if [ "$DATA" != "OK_PREFIJO" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	exit 2
fi

echo "5. ENVIANDO CONTENIDO"
CONTENIDO=`cat /client/dragon.txt`
echo "$CONTENIDO" | nc $IP_SERVER $PORT

if [ "$DATA" != "OK_FILE_NAME" ]
then
	echo "ERROR 2: El nombre que se envió incorrectamente"
	exit 2
fi

echo "8. ENVIANDO CONTENIDO"

cat client/dragon.txt | nc $IP_SERVER $PORT
