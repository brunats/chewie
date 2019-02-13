# Chewie Store

[![Build Status](https://travis-ci.org/brunats/chewie.svg?branch=master)](https://travis-ci.org/brunats/chewie)
[![Coverage Status](https://coveralls.io/repos/github/brunats/chewie/badge.svg?branch=master)](https://coveralls.io/github/brunats/chewie?branch=master)

## Setup

Nós usamos docker :tada:!

[![asciicast](https://asciinema.org/a/9UmgPPEl6suJQ6Kov0VfXOdg7.svg)](https://asciinema.org/a/9UmgPPEl6suJQ6Kov0VfXOdg7)

```sh
docker-compose up --build
```

Mas você também pode executar da forma tradicional...

```sh
cp config/database.example.yml config/database.yml
cp sample.env .env

bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s
```

## Test
```
docker-compose up db
BROWSER=TRUE rails t
```
