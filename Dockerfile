FROM golang:1.22

WORKDIR /app

COPY . .

RUN go get modernc.org/sqlite@v1.27.0

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

CMD ["/main"] 