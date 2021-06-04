FROM ruby:latest
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ADD . /usr/src/app/
EXPOSE 80
CMD ["ruby", "http_server.rb"]