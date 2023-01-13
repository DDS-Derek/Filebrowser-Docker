# Filebrowser-Docker

A more easy-to-use filebrowser docker image

```bash
docker run -d \
    -v /data:/data \
    -v /config:/config \
    -e PUID=0 \
    -e PGID=0 \
    -e UMASK=022 \
    -p 80:80 \
    ddsderek/filebrowser:latest
```

```yaml
version: '3.3'
services:
    filebrowser:
        volumes:
            - '/data:/data'
            - '/config:/config'
        environment:
            - PUID=0
            - PGID=0
            - UMASK=022
        ports:
            - '80:80'
        image: 'ddsderek/filebrowser:latest'
```