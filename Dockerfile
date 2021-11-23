FROM ubuntu:20.04

ENV ALGORAND_NODE="/node"
ENV ALGORAND_DATA="/node/data"
ENV PATH="/node:${PATH}"

RUN mkdir /node
WORKDIR /node

RUN apt-get update -y && apt-get install --no-install-recommends -y -q wget curl build-essential ca-certificates git mercurial runit
RUN wget https://raw.githubusercontent.com/algorand/go-algorand-doc/master/downloads/installers/update.sh
RUN chmod 544 update.sh

RUN ./update.sh -i -c stable -p ${ALGORAND_NODE} -d ${ALGORAND_DATA} -n

RUN cp ${ALGORAND_NODE}/genesisfiles/mainnet/genesis.json ${ALGORAND_DATA}

COPY config.json ${ALGORAND_DATA}

VOLUME ${ALGORAND_DATA}

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "goal node start && tail -f ${ALGORAND_DATA}/node.log"]
