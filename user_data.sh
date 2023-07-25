#!/bin/sh
set -e

# docker installation
#
# See https://docs.docker.com/engine/install/ for the installation steps.
#
# This script is meant for quick & easy install via:
#   $ curl -fsSL https://get.docker.com -o get-docker.sh
#   $ sh get-docker.sh

if [ ! "$(command -v docker)" ]
then
    printf "Installing docker engine...\n"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh --version "${docker_version}"
else
    echo "docker is already installed.!"
fi

# docker-compose installation
#
# See https://docs.docker.com/compose/install/

if [ ! "$(command -v docker-compose)" ]
then
    printf "Installing docker compose...\n"
    curl -SL https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    docker-compose --version
else
    echo "docker-compose is already installed.!"
fi

# post install
usermod -aG docker ubuntu


# -------------------------------
# docker aws logging driver
# -------------------------------
docker_configfile_path=/etc/docker/daemon.json

cat << EOF > $docker_configfile_path
{
  "log-driver": "awslogs",
  "log-opts": {
    "awslogs-region": "${region}",
    "awslogs-group": "${log_group}"
  }
}
EOF

systemctl restart docker.service