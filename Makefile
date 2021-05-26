include .env
export

####################
# Setup tasks	   #
####################
install_dev:
	pip install -e ".[dev]"

install: 
	pip install .

setup_venv:
		python3.9 -m venv venv
	

setup_dev: setup_venv
	(\
		. venv/bin/activate;\
		pip install -e ".[dev]";\
	)

setup: setup_venv
	(\
		. venv/bin/activate;\
		pip install .;\
	)



####################
# Testing   	   #
####################
test: 
	pytest  -vvv -x .

lint:
	flake8 wave.py app tests
	mypy wave.py app

cover:
	coverage run --source=app -m pytest -xv .

coverage-report: cover
	coverage report -m --skip-empty  

coverage-gutter: cover
	coverage html --skip-empty -d coverage
	coverage xml --skip-empty

bandit:
	bandit -r app wave.py

bandit-ci:
	bandit -r -ll -ii app wave.py

test-all: lint test bandit


####################
# Run       	   #
####################
run: 
	uvicorn --host "0.0.0.0" --port 8000 recital:serve --reload