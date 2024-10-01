FROM golang:1.22

WORKDIR /app

COPY . .

RUN go get modernc.org/sqlite@v1.27.0

RUN go get "github.com/stretchr/testify/require"

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o exec.exe

CMD ["/main"] 