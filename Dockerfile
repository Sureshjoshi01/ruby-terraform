FROM ruby:latest
RUN mkdir /usr/src/app
RUN groupadd  -r appuser && useradd  -r -g appuser appuser
WORKDIR /usr/src/app
ADD . /usr/src/app/
EXPOSE 80
USER appuser
CMD ["ruby", "http_server.rb"]
