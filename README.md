# Simple Flask App

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- W projekcie wykorzystamy virtual environment, dla utworzenia hermetycznego środowisko dla aplikacji:

  ```
  # tworzymy hermetyczne środowisko dla bibliotek aplikacji:
  $ python3 -m venv .venv

  # aktywowanie hermetycznego środowiska
  $ source .venv/bin/activate

  #istnieje plik Makefile, ponizsze polecenia mozna wykona przy pomocy:
   make deps:
  $ pip install -r requirements.txt
  $ pip install -r test_requirements.txt

  # zobacz
  $ pip list
  ```

  Sprawdź: [tutorial venv](https://docs.python.org/3/tutorial/venv.html) oraz [biblioteki flask](http://flask.pocoo.org).

- Uruchamianie applikacji:

  ```
  # jako zwykły program
  $ python main.py

  # albo:
  make run
  $ PYTHONPATH=. FLASK_APP=hello_world flask run
  ```

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ```
  $ PYTHONPATH=. py.test
  #albo
  make test
  $ PYTHONPATH=. py.test --verbose -s

  #istnieje rowniez linter:
  make lint
  flake8 hello_world test
  ```
- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ```
  # deaktywacja
  $ deactivate
  ```

  ```
  ...

  # aktywacja
  $ source .venv/bin/activate
  ```

- Integracja z TravisCI:

  ```
  # Dodaj do repozytorium plik .travis.yml
  # Zaloguj do Travisa uzywajc konta gita i aktywuj projektem  
  #
  ```

- Integracja Travis z Docker:

  ```
  # Dodaj do Travisa zmiena DOCKER_PASSWORD
  # W Dockerfile wprowadz logowanie w stage'u docker_push:
  # @docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}   
  # zwroc uwage na roznice w podanych zmiennych $() vs $${}
  ```

- Integracja z Heroku:
  ```
  # Zainstalowac gunicorn i flask
  # Nalezy stworzyk plik procfile z linia:
  # echo 'web: gunicorn hello_world:app'
  # Zainstalowac i sprawdzic heroku:
  ## sudo snap install --classic Heroku
  ## heroku login -i
  ## heroku create
  ## git remote -v - sprawdzic, czy jest remote dla heroku (i url apki)
  ## git push heroku master - upewnic sie wczesniej, ze git widzi
  ## Procfile
  ## wejsc na url apki
  ```

- Monitoring:
  ```
  # istnieje monitoring w aplikacji statuscake:
  # https://app.statuscake.com
  ## Embedded status image (Badge) z travisa:
  #[![Build Status](https://travis-ci.org/waszczukp/se_hello_printer_app.svg?branch=master)](https://travis-ci.org/waszczukp/se_hello_printer_app)
  ## Embedded status image (Badge) z statuscake:
  #<a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=gbmdY7tXvD&Days=1&Design=1" /></a>
  ```

# Pomocnicze

## Ubuntu

- Instalacja dockera: [dockerce howto](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Centos

- Instalacja docker-a:

  ```
  $ yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

  $ yum install -y yum-utils

  $ yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

  $ yum makecache fast
  $ yum install -y docker-ce
  $ systemctl start docker
  ```
