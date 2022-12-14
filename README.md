# Container tutorial
This repository has the code for my dockerfiles used in the container tutorial at [Xandikos](https://raduzaharia.medium.com/lets-create-a-calendar-server-container-with-xandikos-and-podman-1a62c1aedc6a), [Dovecot](https://raduzaharia.medium.com/email-server-in-a-jar-the-parametrized-dovecot-podman-container-d999fc565ad0), [MiniDLNA](https://raduzaharia.medium.com/media-server-container-minidlna-and-podman-e3a6e07362c8), [Avahi](https://raduzaharia.medium.com/network-service-discovery-with-an-avahi-container-3dfdce4f1c75) and [NFS](https://raduzaharia.medium.com/defining-nfs-network-shares-in-a-podman-container-c6740e8e0fec). 

It also has code for the [IP change](https://raduzaharia.medium.com/revisiting-ip-change-monitoring-from-a-container-b08b86637537) detection container tutorial. 

## Image build commands
Xandikos: `podman build --file xandikos-server.docker -t xandikos-server` 

Dovecot: `sudo podman build --file dovecot-server.docker --build-arg MAIL_FOLDER=/mnt/storage/radu/personal/mail-archive --build-arg USER_PASSWORD test --build-arg UID 1000 --build-arg GID 1000 -t dovecot-server`

MiniDLNA: `sudo podman build --file minidlna.docker --build-arg MUSIC_FOLDER=/mnt/storage/media/music --build-arg PHOTOS_FOLDER=/mnt/storage/media/photos --build-arg VIDEOS_FOLDER=/mnt/storage/media/videos -t minidlna-server:latest`

Avahi: `sudo podman build --file avahi.docker -t avahi-server`

NFS: `sudo podman build --file nfs.docker -t nfs-server`

IP check: `sudo podman build --file ipcheck.docker -t ipcheck-server`

## Container run commands
Xandikos: `podman run --name xandikos-server-instance -p 8081:8081 -v /mnt:/mnt xandikos-server:latest` 

Dovecot: `sudo podman run --name dovecot-server-instance -p 143:143 -p 993:993 -v /mnt:/mnt dovecot-server:latest`

MiniDLNA: `sudo podman run --name minidlna-server-instance -p 8200:8200 -p 1900:1900 -v /mnt:/mnt minidlna-server:latest`

Avahi: `sudo podman run --name avahi-server-instance --net host -v /mnt:/mnt avahi-server:latest`

NFS: `sudo podman run --name nfs-server-instance --privileged --net host -v /mnt:/mnt nfs-server:latest`

IP check: `sudo podman run --name ipcheck-server-instance ipcheck-server:latest`
