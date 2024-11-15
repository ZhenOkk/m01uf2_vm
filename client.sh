#!/bin/bash

PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABEZERA"

echo "DMAM" | nc 127.0.0.1 $PORT

DATA=`nc -l $PORT`

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1: Cabecera incorrecta"
	exit 1
fi
echo "3.ENVIANDO FILE_NAME dragon.txt"
echo "FILE_NAME dragon.txt" | nc 127.0.0.1 $PORT
DATA=`nc -l $PORT`
if [ "$DATA" != "OK_PREFIJO" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	exit 2
fi

echo "5. ENVIANDO CONTENIDO"
CONTENIDO=`cat /client/dragon.txt`
echo "$CONTENIDO" | nc 127.0.0.1 $PORT

if [ "$DATA" != "OK_FILE_NAME" ]
then
	echo "ERROR 2: El nombre que se envió incorrectamente"
	exit 2
fi

echo "8. ENVIANDO CONTENIDO"

cat client/dragon.txt | nc 127.0.0.1 $PORT
