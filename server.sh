#!/bin/bash


PORT="2022"

echo "Servidor de Dragón Magia Abuelita Miedo 2022"

echo "0. ESCUCHAMOS"

DATA=`nc -l $PORT`

HEADER=`echo $DATA | cut -d " " -f 1`
IP=`echo $DATA | cut -d " " -f 2`

if ["$HEADER" != "DMAM" ]
then
	echo "ERROR 1: Cabecera incorrecta"
	echo "KO_HEADER" | nc $IP $PORT
	exit 1
fi

echo "La IP del cliente es: $IP"

echo "2. CHECK OK - Enviando OK _HEADER"
echo "OK_HEADER" | nc $IP $PORT
DATA=`nc -l $PORT`

PREFIJO=`echo "$DATA" | cut -d ' ' -f 1`
NOMDRAGO=`echo "$DATA" | cut -d ' ' -f 2`

if [ "$PREFIJO" != "FILE_NAME" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	echo "KO_PREFIJO" | nc $IP $PORT
	exit 2
fi

echo "4. CHECK OK - ENVIANDO OK_PREFIJO"
echo "OK_PREFIJO" | nc $IP $PORT

echo "6. CHECK OK - ENVIANDO OK_FILE_NAME"
echo "OK_FILE_NAME" | nc $IP $PORT
DATA=`nc -l $PORT`
echo "$DATA" > server/$NOMDRAGO

