FROM phusion/baseimage
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

# Use the phusion/baseimage init system
CMD ["/sbin/my_init"]

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install rtmbot/plugin
RUN apt-get update && apt-get install -y git python python-pip && apt-get clean
RUN git clone git://github.com/slackhq/python-rtmbot.git
RUN cd python-rtmbot; pip install -r requirements.txt; git submodule add -f git://github.com/JacobSanford/python-rtmbot-hodor.git plugins/hodor; cp doc/example-config/rtmbot.conf .
RUN mv python-rtmbot hodorbot; mv hodorbot /opt

# Init system files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run; chmod -v +x /etc/my_init.d/*.sh

# Add hodor user
RUN useradd -u 918 -U -s /bin/false hodor; usermod -G users hodor
