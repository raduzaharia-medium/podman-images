# Container tutorial
This repository has the code for my dockerfiles used in the container tutorial at [Xandikos](https://raduzaharia.medium.com/lets-create-a-calendar-server-container-with-xandikos-and-podman-1a62c1aedc6a) and at [Dovecot](https://raduzaharia.medium.com/email-server-in-a-jar-the-parametrized-dovecot-podman-container-d999fc565ad0). 

## Image build commands
Xandikos: `podman build --file xandikos-server.docker -t xandikos-server` 

Dovecot: `sudo podman build --file dovecot-server.docker --build-arg MAIL_FOLDER=/mnt/storage/radu/personal/mail-archive --build-arg USER_PASSWORD test --build-arg UID 1000 --build-arg GID 1000 -t dovecot-server`

## Container run commands
Xandikos: `podman run --name xandikos-server-instance -p 8081:8081 -v /mnt:/mnt xandikos-server:latest` 

Dovecot: `sudo podman run --name dovecot-server-instance -p 143:143 -p 993:993 -v /mnt:/mnt dovecot-server:latest`
