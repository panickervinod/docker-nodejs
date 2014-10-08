FROM sameersbn/ubuntu:14.04.20141001
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y nodejs npm \
 && adduser --disabled-login --gecos 'NodeJS' nodejs \
 && npm install -g express-generator nodemon \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD scripts /scripts
ADD start /start
RUN chmod 755 /start

ENTRYPOINT ["/start"]
