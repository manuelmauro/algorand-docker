FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y gnupg2 curl software-properties-common
RUN curl -O https://releases.algorand.com/key.pub
RUN apt-key add key.pub
RUN add-apt-repository "deb [arch=amd64] https://releases.algorand.com/deb/ stable main"
RUN apt-get update

# To get both algorand and the devtools:
RUN apt-get install -y algorand-devtools

# Or, to only install algorand:
RUN apt-get install -y algorand

RUN algod -v

ENTRYPOINT ["tail", "-f", "/dev/null"]
