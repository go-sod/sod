FROM golang:1.16 AS builder

RUN apt-get -qq update && apt-get -yqq install upx

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64

WORKDIR /src
COPY . .

ENV BUILD_INFO_PACKAGE=github.com/go-sod/sod/internal/buildinfo
ENV BUILD_NAME=sod-srv

RUN go build \
  -trimpath \
  -ldflags "-s -w -X $BUILD_INFO_PACKAGE.BuildTag=$(git describe --tags --abbrev=0) -X $BUILD_INFO_PACKAGE.Time=$(date -u '+%Y-%m-%d-%H:%M') -X $BUILD_INFO_PACKAGE.Name=$BUILD_NAME -extldflags '-static'" \
  -installsuffix cgo \
  -o /bin/sod \
  ./cmd/sod-srv

RUN strip /bin/sod
RUN upx -q -9 /bin/sod


RUN mkdir /data

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /bin/sod /bin/sod
COPY --from=builder /data /data

VOLUME /data

ENTRYPOINT ["/bin/sod"]