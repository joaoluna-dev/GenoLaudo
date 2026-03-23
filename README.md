# PathoClin 📄🧬 

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Streamlit](https://img.shields.io/badge/Streamlit-1.54-red)
![Weasyprint](https://img.shields.io/badge/weasyprint-67.0-red)
![Snakemake](https://img.shields.io/badge/Snakemake-7.32.4-teal)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED)
![Apptainer](https://img.shields.io/badge/Apptainer-Container-2496ED)
![bcftools](https://img.shields.io/badge/bcftools-red)
![samtools](https://img.shields.io/badge/samtools-red)
![ANNOVAR](https://img.shields.io/badge/ANNOVAR-green)
![Intervar](https://img.shields.io/badge/Intervar-green)


Repositório oficial do projeto PathoClin, um pipeline opensource 100% automatizado pra a anotação de variantes em arquivos .vcf e geração de laudos genéticos 
padronizados conforme as diretrizes laboratoriais brasileiras da ANVISA.

## 🌟 Destaques

- Processamento automatizado de arquivos .vcf fornecidos pelo usuário.
- Filtragem de variantes com base nas diretrizes da ACMG e Broad Institute.
- Anotação das variantes utilizando o ANNOVAR e o InterVar, utilizando bancos de dados ABraOm, ClinVar e dbnsfp.
- Processamento de dados da anotação e criação de laudo automatizado em PDF.
- Interface visual de fácil utilização para preenchimento de dados clínicos de cada amostra.
- Conteinerização para maior versatilidade e reprodutibilidade.
- Sistema completamente automatizado. Foque apenas no que importa.
- Instalação simples e modular. Utilize as versões de bancos de dados de seu interesse.

## 👤 Visão geral do projeto

O PathoClin é um pipeline bioinformático automatizado, desenvolvido em Python, dedicado à anotação e interpretação de 
variantes genômicas humanas a partir de arquivos VCF. Projetado para processar dados de fluxos padrão de variant calling. 
O software foca na triagem de mutações em genes de relevância médica. O seu principal objetivo é assessorar a tomada de 
decisão clínica de forma ágil e abrangente, reduzindo a complexidade operacional na rotina de diagnóstico molecular 
através de uma interface de fácil preenchimento de informações clínicas. Como diferencial tecnológico e de privacidade, 
o sistema realiza a anotação das variantes empregando bancos de dados executados localmente por meio do ANNOVAR e Intervar, 
eliminando a necessidade de submissão de dados genéticos, garantindo a segurança e sigilo às informações sensíveis dos pacientes, 
além de acelerar substancialmente o tempo de processamento analítico.

### 👨‍💻 Algorítmo
1. Entrada de Dados (Input): A inicialização do sistema requer três componentes essenciais, o diretório com os bancos de dados do ANNOVAR, o arquivo FASTA/FA do genoma de referência (na mesma versão de montagem utilizada na etapa de chamada de variantes) e o arquivo VCF bruto da amostra. A entrada destes arquivos no conteiner ocorre através de mapeamento de volumes (bind mount).
2. Filtragem de Variantes (Filtering): O VCF bruto é submetido a um processo de controle de qualidade. As variantes são avaliadas e filtradas com base nas métricas do arquivo, seguindo as diretrizes técnicas do Broad Institute (GATK) e as recomendações de boas práticas da ACMG/AMP. As variantes aprovadas são exportadas para um arquivo VCF temporário.
3. Normalização e Anotação Genômica: As variantes filtradas são primeiramente normalizadas (alinhadas à esquerda e parsimoniosas) para garantir uma representação padronizada. Em seguida, ocorre a anotação. As variantes são enriquecidas com dados clínicos (ClinVar), frequências alélicas da população brasileira [ABraOM](https://abraom.ib.usp.br/) e escores de predição computacional de impacto patogênico (dbNSFP). O produto desta etapa é salvo nos formatos nativos das ferramentas, incluindo arquivos .intervar, .multianno.txt e o .vcf normalizado.
4. Processamento e Estruturação de Dados (Parsing): Os arquivos gerados na etapa de anotação são processados para extrair os dados exigidos pelas diretrizes da ACMG para a elaboração de laudos (Coordenada Genômica, Gene, Transcrito, Nomenclatura da Variante HGVS, Zigosidade, Classificação de Patogenicidade e Doença Associada). O sistema possui suporte a VCFs multiamostra, segregando automaticamente as informações por paciente e serializando os dados processados de forma estruturada em um arquivo JSON.
5. Integração Fenotípica e Emissão de Laudo: A interface gráfica interativa é executada automaticamente. O ambiente disponibiliza formulários para o preenchimento dos dados clínicos e de identificação de cada amostra. Após a confirmação, o painel cruza os dados clínicos com o JSON estruturado, aplicando as informações em um template HTML. Finalmente, o sistema escreve esse template em um documento PDF, liberado para download direto na interface.

### ➡️ Fluxograma das análises



### ⚙️ Dependências 



### ❓ Sobre mim

Biomédico, Bioinformata e Desenvolvedor Python. Trabalha com ciência de dados aplicada à genômica, transcriptômica, epigenômica e proteômica. Esta ferramenta é desenvolvida por profissionais para profissionais, para facilitar a tomada de decisões em genômica médica, democratizando o acesso à este tipo de ferramenta para centros de pesquisa e pequenos laboratórios.

### ✍️ Informação dos autores

[GitHub](https://github.com/joaoluna-dev)
[Linkedin](https://www.linkedin.com/in/jo%C3%A3o-gabriel-a3b28130a/)
[Lattes](https://lattes.cnpq.br/3598905984017635)



