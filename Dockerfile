FROM debian/jessie

RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install ngircd

ADD ngircd.conf /etc/ngircd/ngircd.conf
ADD ngircd.motd /etc/ngircd/ngircd.motd


EXPOSE 6667

CMD ["/usr/local/bin/supervisord", "-n"]

