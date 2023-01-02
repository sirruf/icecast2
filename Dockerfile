FROM ubuntu:focal

LABEL maintainer="Artem Kolesnikov <ask@res.bz>" \
      github="https://github.com/sirruf/icecast2"

RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*
    
EXPOSE 8000

CMD /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log
# CMD /etc/init.d/icecast2 start
