FROM golang:latest as build

WORKDIR /service
ADD . /service

RUN cd /service && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /http-service .

CMD /http-service

EXPOSE 8080