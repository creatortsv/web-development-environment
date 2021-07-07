ARG GOLANG_VERSION
ARG GOLANG_DIST

FROM golang:$GOLANG_VERSION-$GOLANG_DIST

RUN apk add git alpine-sdk bash automake autoconf libtool linux-headers

RUN git clone https://github.com/spiral/framework /spiral
RUN cd /spiral \
    && go mod tidy \
    && make

RUN apk del --purge alpine-sdk bash automake autoconf libtool linux-headers