# Chewie Store

[![Build Status](https://travis-ci.org/brunats/chewie.svg?branch=master)](https://travis-ci.org/brunats/chewie)

## Setup

```sh
cp config/database.example.yml config/database.yml
cp sample.env .env
docker-compose up
```

```sh
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s
```

## Test
```
BROWSER=TRUE rails t
```
