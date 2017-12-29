FROM debian:jessie

ADD ngircd /etc/pam.d/ngircd

RUN apt-get update && apt-get install \
    autoconf automake build-essential expect libgnutls-dev \
    libident-dev libpam-dev libwrap0-dev libz-dev telnet wget -y

RUN wget https://github.com/ngircd/ngircd/releases/download/rel-24/ngircd-24.tar.gz && tar xzf ngircd-24.tar.gz && cd ngircd-24 && ./configure --with-pam="/etc/pam.d/ngircd" && make && make install


ADD ngircd.conf /usr/local/etc/ngircd/ngircd.conf
ADD ngircd.motd /usr/local/etc/ngircd/ngircd.motd


EXPOSE 6667

CMD ["/usr/local/sbin/ngircd", "start"]
