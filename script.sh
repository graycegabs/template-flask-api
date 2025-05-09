#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: ./criar_projeto.sh nome-do-projeto"
    exit 1
fi

NOME_PROJETO=$1
TEMPLATE_REPO="https://github.com/graycegabs/api-receitas.git"

git clone --depth=1 "$TEMPLATE_REPO" "$NOME_PROJETO"

cd "$NOME_PROJETO" || { echo "Erro ao acessar o diretório do projeto"; exit 1; }

rm -rf .git

echo "Criando ambiente virtual..."
python3 -m venv venv

echo "Ativando ambiente virtual..."
source venv/bin/activate || { echo "Erro ao ativar o ambiente virtual"; exit 1; }

echo "Instalando dependências..."
pip install -r requirements.txt

echo "Inicializando repositório Git..."
git init
git add .
git commit -m "Início do projeto $NOME_PROJETO"

echo "Projeto $NOME_PROJETO criado com sucesso!"
echo "Para começar, siga os passos abaixo:"
echo "  cd $NOME_PROJETO"
echo "  source venv/bin/activate  # Para ativar o ambiente virtual"
echo "  make install   # Para instalar as dependências"
echo "  make run       # Para rodar o servidor Flask"