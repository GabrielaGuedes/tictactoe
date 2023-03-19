FROM ruby:3.0.0-alpine

WORKDIR /app

COPY . .

RUN bundle install

CMD ruby lib/tictactoe.rb