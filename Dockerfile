FROM golang:1.15-alpine3.13 AS builder

WORKDIR /workspace

COPY . /workspace

ARG GO111MODULE=on
## Build
RUN CGO_ENABLED=0 go build -v -o /bin/hello ./main.go

FROM alpine:3.13

COPY --from=builder /bin/hello /bin/hello
RUN chmod a+x /bin/hello
