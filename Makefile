# Variáveis
VENV_PATH=venv/bin/activate

run:
	@echo "Iniciando o servidor Flask..."
	. $(VENV_PATH) && python app.py

test:
	@echo "Rodando os testes..."
	. $(VENV_PATH) && python -m unittest discover -s tests

install:
	@echo "Instalando dependências..."
	pip install -r requirements.txt
