FROM golang:1.20.4-alpine3.18

WORKDIR /app

# Goモジュールの依存関係のセキュリティチェックとバージョン管理のファイル
COPY /app/go.mod ./
COPY /app/go.sum ./

RUN go get github.com/labstack/echo/v4
RUN go get github.com/labstack/echo/v4/middleware

RUN go mod download

COPY /app/*.go ./

RUN go build -o /build

EXPOSE 5000

CMD ["/build"]