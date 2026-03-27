#!/bin/bash

CYAN='\033[1;36m'
NC='\033[0m' #serve para voltar o terminal para a cor normal

echo -e "${CYAN}"
echo "Iniciando limpeza dos dados temporários..."
echo -e "${NC}"
rm data/temp/*.intervar
rm data/temp/*.vcf
rm data/temp/*.txt
rm data/temp/*.json