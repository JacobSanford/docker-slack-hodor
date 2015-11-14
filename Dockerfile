FROM debian:jessie
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

RUN apt-get update && \
  apt-get install -y git python python-pip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/slackhq/python-rtmbot.git
RUN cd python-rtmbot && \
  pip install -r requirements.txt && \
  git submodule add -f git://github.com/JacobSanford/python-rtmbot-hodor.git plugins/hodor && \
  cp doc/example-config/rtmbot.conf .
RUN mv python-rtmbot /opt/hodorbot

ADD bin/hodor.sh /hodor.sh
CMD ["/hodor.sh"]
