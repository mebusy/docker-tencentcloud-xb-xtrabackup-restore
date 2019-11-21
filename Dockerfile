FROM mysql:5.6

RUN apt-get update \
    &&  apt-get install -y apt-utils \
    && apt-get install -y lsb-release

RUN  apt-get install -y wget \
    && wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb

RUN dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb  \
    && apt-get update \
    && apt-get install -y percona-xtrabackup

RUN apt-get install -y qpress

RUN rm *_all.deb \
    && apt-get purge -y --auto-remove ca-certificates wget

COPY blacklist /

COPY xtrabackup.sh /usr/bin/
RUN chmod +x /usr/bin/xtrabackup.sh

ENTRYPOINT []
CMD [  "/bin/sh", "-c", "xtrabackup.sh" ]


