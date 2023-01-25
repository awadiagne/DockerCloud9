setup:
	python3 -m venv ~/.docker-build

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

validate-circleci:
    circleci config process .circleci/config.yml

run-circleci-local:
    circleci local execute

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	hadolint Dockerfile 
	pylint --disable=R,C,W1203 app.py

all: install lint test