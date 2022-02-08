FROM ruby:2.6.6-buster@sha256:1512719e1172fbcaa913997ffcb4b2be0948038fe255040a29f819f6c54c328d

EXPOSE 4567:4567
EXPOSE 35729:35729

WORKDIR /usr/src/gems

COPY ./Gemfile /usr/src/gems

RUN apt-get update && apt-get install -y nodejs

RUN bundle check || bundle install

WORKDIR /usr/src/docs

CMD [ "bundle", "exec", "--gemfile=/usr/src/gems/Gemfile", "middleman", "server" ]
