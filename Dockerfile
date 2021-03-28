FROM golang:1.16-alpine as builder
WORKDIR /go/src/app
COPY main.go .
RUN go build /go/src/app/main.go

FROM scratch
COPY --from=builder /go/src/app /go/src/app

ENTRYPOINT [ "/go/src/app/main" ]
