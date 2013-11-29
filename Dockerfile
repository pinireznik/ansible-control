FROM ubuntu
MAINTAINER Pini Reznik "p.reznik@uglyduckling.nl"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y python2.7 python-software-properties python-setuptools ssh build-essential python-crypto python-dev 

RUN easy_install pip
RUN pip install ansible
