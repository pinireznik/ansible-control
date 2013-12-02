FROM ubuntu
MAINTAINER Pini Reznik "p.reznik@uglyduckling.nl"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y less sshpass vim inetutils-ping python2.7 python-software-properties python-setuptools ssh openssh-server build-essential python-crypto python-dev 

RUN mkdir /var/run/sshd 
RUN echo 'root:ansible' |chpasswd

RUN easy_install pip
RUN pip install ansible

EXPOSE 22
CMD    /usr/sbin/sshd -D
