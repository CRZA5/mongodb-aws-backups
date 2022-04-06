FROM mongo

RUN apt update -y && apt install -y awscli

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD ["bash", "/usr/local/bin/backup"]