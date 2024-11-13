#!/bin/bash

PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABEZERA"

echo "DMAM" | nc 127.0.0.1 $PORT

DATA=`nc -l $PORT`

if [ $DATA != "OK_HEADER" ]
then
	echo "Error 1: Cabecera incorrecta"
	exit 1
fi
