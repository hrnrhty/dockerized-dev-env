# Dockerized Development Environment

## Usage

### Build and initial setting
```sh
$ cd dockerized-dev-env
$ docker-compose up -d
$ docker cp your-public-key.pub dde:/root
$ docker exec -it dde /bin/bash
# mkdir ~/.ssh
# cat ~/your-public-key.pub > ~/.ssh/authorized_keys
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/authorized_keys
# cp /etc/skel/.bash_logout ~/
# cp /etc/skel/.bashrc ~/
# cp /etc/skel/.profile ~/
# exit
```

### SSH access
```sh
$ ssh -Y root@localhost
```

### Stop the container
```sh
$ docker-compose down
```
Even if you stop the container, your home directory and its contents will be keep on the volume 'dde_home-data'

### Restart the container
```sh
$ docker-compose up -d
```
