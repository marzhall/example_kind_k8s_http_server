FROM golang:1.18.8-alpine3.16 AS buildcontainer

COPY . .
WORKDIR src
RUN go build -o foo
RUN ls
RUN cp foo /
RUN ls /
WORKDIR /

EXPOSE 8080
ENTRYPOINT [ "/foo"]