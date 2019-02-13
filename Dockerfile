FROM ruby:2.6.0

RUN gem install bundler -v 2.0.1

ADD Gemfile .
ADD Gemfile.lock .

RUN apt-get update
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install nodejs -y

RUN bundle install

ADD . .

RUN cp config/database.example.yml config/database.yml
