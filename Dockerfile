FROM golang:1.17.5-alpine3.15 as stage

WORKDIR /usr/app

COPY . .

RUN go mod init rocks && \
  go build

FROM scratch
WORKDIR /app 
COPY --from=stage /usr/app/rocks .
CMD ["/app/rocks"]