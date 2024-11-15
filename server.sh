#!/bin/bash


PORT="2022"

echo "Servidor de Dragón Magia Abuelita Miedo 2022"

echo "0. ESCUCHAMOS"

DATA=`nc -l $PORT`

if [ "$DATA" != "DMAM" ]
then
	echo "ERROR 1: Cabecera incorrecta"
	echo "KO_HEADER" | nc localhost 2022
	exit 1
fi

echo "2. CHECK OK - Enviando OK _HEADER"
echo "OK_HEADER" | nc 127.0.0.1 2022
DATA=`nc -l $PORT`
PREFIJO=`echo "$DATA" | cut -d ' ' -f 1`

if [ "$PREFIJO" != "FILE_NAME" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	echo "KO_PREFIJO" | nc 127.0.0.1 $PORT
	exit 2
fi

echo "4. CHECK OK - ENVIANDO OK_PREFIJO"
echo "OK_PREFIJO" | nc 127.0.0.1 $PORT

echo "6. CHECK OK - ENVIANDO OK_FILE_NAME"
echo "OK_FILE_NAME" | nc 127.0.0.1 $PORT
DATA=`nc -l $PORT`
echo "$DATA" > server/dragon.txt

