FROM alpine:3.8

RUN apk add --update python git make bash g++ npm py-pip && mkdir /opt
RUN pip install awscli
RUN cd /opt && git clone https://github.com/ethereum/web3.js/ && cd web3.js && npm install
ADD ./ /opt/liverpeer-txn-tracker/
RUN cd /opt/liverpeer-txn-tracker && npm install && mkdir -p ./data && rm -Rf ./output/* && rm -Rf .git .gitignore Dockerfile
WORKDIR /opt/liverpeer-txn-tracker

