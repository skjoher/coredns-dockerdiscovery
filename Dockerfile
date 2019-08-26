FROM golang:1.12.7-stretch

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

COPY . /coredns-dockerdiscovery
RUN go get github.com/skjoher/coredns-dockerdiscovery
RUN cd /coredns-dockerdiscovery && make coredns

EXPOSE 15353 15353/udp
ENTRYPOINT ["/coredns-dockerdiscovery/coredns"]
