.PHONY: test

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt
lint:
	flake8 hello_world test
run:
	PYTONPATH=. FLASK_APP=hello_world flask run
test:
	PYTONPATH=. py.test --verbose -s
