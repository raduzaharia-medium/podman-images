# Container tutorial
This repository has the code for my dockerfiles used in the container tutorial at [Xandikos](https://raduzaharia.medium.com/lets-create-a-calendar-server-container-with-xandikos-and-podman-1a62c1aedc6a) and at [Dovecot](https://raduzaharia.medium.com/email-server-in-a-jar-the-parametrized-dovecot-podman-container-d999fc565ad0). 

Xandikos: `podman run --name xandikos-server-instance -p 8081:8081 -v /mnt:/mnt xandikos-server:latest`
Dovecot: `sudo podman run --name dovecot-server-instance -p 143:143 -p 993:993 -v /mnt:/mnt dovecot-server:latest`
