FROM ruby:3.4.1-bullseye

EXPOSE 4567:4567
EXPOSE 35729:35729

WORKDIR /usr/src/gems

COPY ./Gemfile /usr/src/gems
COPY Gemfile.lock /usr/src/gems

RUN apt-get update && apt-get install -y nodejs

RUN bundle install

WORKDIR /usr/src/docs

CMD [ "bundle", "exec", "--gemfile=/usr/src/gems/Gemfile", "middleman", "server" ]
