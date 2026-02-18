#!/bin/bash

echo "Bem vindo ao assistente de instalação do GenoLaudo!"
echo "São necessários no mínimo 55Gb de espaço livre de armazenamento para continuar"

#verifica se o usuário possui o armazenamento necessário para a execução
read -p "Deseja prosseguir? (s/n)" selection
if [[ $selection == "s" ]]; then
  :
elif [[ $selection == "n" ]]; then
  exit 1
fi

echo "É necessário um link de download do ANNOVAR para prosseguir."
echo "Para mais informações, acesse https://annovar.openbioinformatics.org/en/latest/user-guide/download/"

#obtendo link de download do ANNOVAR
read -p "Insira o seu link de download do ANNOVAR: " annovar_link

#baixando o ANNOVAR
curl "$annovar_link" -o annovar.latest.tar.gz

#extraindo o ANNOVAR
tar -xvzf annovar.latest.tar.gz

#movendo o ANNOVAR para o diretório /data
mkdir data
mv annovar data/

#instalando bancos de dados necessários: refGene, clinvar_20250721, gnomad41_exome, abraom, dbnsfp35a, dbscsnv11
#cerca de 55Gb de dados serão baixados
echo "Iniciando download de bancos de dados para anotação"
echo "Isto pode demorar um pouco, a depender da sua conexão de internet e computador utilizado..."

echo "Baixando definições de Genes..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refGene humandb

echo "Baixando ClinVar ..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar clinvar_20250721 humandb

echo "Baixando banco de dados de frequência global (gnomAD)..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad41_exome humandb

echo "Baixando banco de dados de frequências brasileiras (ABraOM)..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar abraom humandb

echo "Baixando preditores in silico..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbnsfp35a humandb

echo "Baixando scores de Splicing..."
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbscsnv11 humandb

#sanity check do ANNOVAR