FROM golang:1.21 AS compiler

WORKDIR /app

COPY message.go .
RUN go build -o message message.go

FROM scratch

WORKDIR /app
COPY --from=compiler /app/message .

CMD [ "./message" ]

