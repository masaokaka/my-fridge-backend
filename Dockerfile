FROM golang:1.20.4-alpine3.18
RUN apk update &&  apk add git

WORKDIR /app

COPY /app/go.mod ./

COPY /app/go.sum ./

RUN go install github.com/cosmtrek/air@latest

COPY /app/*.go ./

RUN go mod download

EXPOSE 5050

CMD ["air", "-c", ".air.toml"]