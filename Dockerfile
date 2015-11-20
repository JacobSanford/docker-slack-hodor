FROM debian:jessie
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

RUN apt-get update && \
  apt-get install -y wget unzip python python-pip && \
  cd opt && \
  wget http://github.com/slackhq/python-rtmbot/archive/master.zip && \
  unzip master.zip && rm -f python-rtmbot-master.zip && \
  mv python-rtmbot-master python-rtmbot && \
  cd python-rtmbot && \
  pip install -r requirements.txt && \
  wget http://github.com/JacobSanford/python-rtmbot-hodor/archive/master.zip && \
  unzip master.zip && rm -f master.zip && \
  mv python-rtmbot-hodor-master plugins/python-rtmbot-hodor && \
  apt-get remove --purge -y wget unzip && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  cp doc/example-config/rtmbot.conf . && \
  mv /opt/python-rtmbot /opt/hodorbot

ADD bin/hodor.sh /hodor.sh
CMD ["/hodor.sh"]
