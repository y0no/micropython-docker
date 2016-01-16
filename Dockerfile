FROM debian
MAINTAINER Marc Rooding <admin@webresource.nl>

RUN apt-get update && apt-get -y install build-essential libreadline-dev libffi-dev pkg-config python-setuptools python-dev git

WORKDIR /

RUN git clone https://github.com/micropython/micropython.git

WORKDIR /micropython/unix

RUN make

WORKDIR / 

RUN git clone https://github.com/micropython/micropython-lib.git

WORKDIR /micropython-lib

RUN make install

WORKDIR /micropython/unix

ENTRYPOINT ["./micropython"]