FROM ubuntu:15.04

RUN apt-get update
RUN apt-get -yy install  software-properties-common sudo \
 supervisor x11vnc xvfb openssh-server
RUN add-apt-repository ppa:obsproject/obs-studio
RUN apt-add-repository multiverse
RUN apt-get update
RUN apt-get -yy install ffmpeg obs-studio && rm -rf /var/cache/*
ADD etc /etc
RUN  adduser -q ubuntu \
&& echo "ubuntu:ubuntu" | /usr/sbin/chpasswd \
&& echo "ubuntu    ALL=(ALL) ALL" >> /etc/sudoers \
&& chown -R ubuntu:ubuntu /home/ubuntu
ADD docker-entrypoint.sh /usr/sbin
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
