FROM golang:1.21.5-alpine3.18

RUN apk update && apk add git

ENV TZ /usr/share/zoneinfo/Asia/Tokyo

WORKDIR /app

COPY /app/* ./

RUN go mod download

RUN go install github.com/cosmtrek/air@latest

EXPOSE 5050

CMD ["air", "-c", ".air.toml"]