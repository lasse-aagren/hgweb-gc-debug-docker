FROM ubuntu:bionic
MAINTAINER "Lasse Aagren <lassea@unity3d.com>"

RUN apt-get update && apt-get install -y build-essential mercurial python-dev w3m vim
RUN hg clone https://www.mercurial-scm.org/repo/hg hg-4.5.2

RUN cd hg-4.5.2 && hg update -r 4.5.2 && make local
RUN cp -a hg-4.5.2 hg-4.5.3 && cd hg-4.5.3 && hg update -r 4.5.3 && make local

RUN mkdir -p /hgweb/repos /hgweb/largefiles /workdir

COPY files/hgweb.config /hgweb/
COPY files/hgrc /root/.hgrc

COPY files/create-repo.sh /hgweb/
COPY files/launch-hgwebs.sh /hgweb/
COPY files/clone-test.sh /hgweb/
COPY files/lfpull-test.sh /hgweb/

RUN chmod +x /hgweb/*.sh
RUN /hgweb/create-repo.sh

CMD ["/bin/bash"]
