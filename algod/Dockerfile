FROM ubuntu:20.04

# Install dependencies
RUN apt-get update -y && apt-get install --no-install-recommends -y -q wget curl ca-certificates

# Use a non-privilidged user with a random UID / GID for security reasons
RUN groupadd -g 10353 algorand && \
  useradd -m -u 10353 -g algorand algorand && \
  chown -R algorand:algorand /opt && \
  ls -lha /opt

USER algorand

# Create a folder to hold the install package and files.
RUN mkdir -p /opt/algorand/node
WORKDIR /opt/algorand/node

# When the installer runs, it will pull down the latest update package from S3 and install it. The -n option above tells the installer to not auto-start the node.
RUN wget https://raw.githubusercontent.com/algorand/go-algorand-doc/master/downloads/installers/update.sh
RUN chmod 544 update.sh
RUN ./update.sh -i -c stable -p . -d ./data -n

RUN cp ./genesisfiles/mainnet/genesis.json ./data

COPY config.json ./data
COPY ./start.sh .

VOLUME ./data

ENV ALGORAND_DATA="/opt/algorand/node/data"
ENV PATH="${ALGORAND_NODE}:${PATH}"

EXPOSE 8080
ENTRYPOINT [ "/algorand/start.sh" ]
