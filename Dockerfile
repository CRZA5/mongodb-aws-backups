FROM mongo:4.4

RUN apt update -y && apt install -y awscli curl

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD ["bash", "/usr/local/bin/backup"]