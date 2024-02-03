FROM golang:latest as builder

WORKDIR /usr/src/app

COPY hello.go ./

RUN go mod init hello && go build -o hello

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/hello /

CMD ["/hello"]