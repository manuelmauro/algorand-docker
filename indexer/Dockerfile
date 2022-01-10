FROM ubuntu:20.04

RUN mkdir ~/indexer
RUN cd /path/to/download-dir
RUN tar -xf <your-os-tarfile> -C ~/indexer
RUN cd ~/indexer/<tarfile-name>

COPY ./start.sh /opt/algorand

ENTRYPOINT [ "/opt/algorand/start.sh" ]
