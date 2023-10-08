#!/bin/sh

set -e

if ! [[ -f bin/portainer-2.18.1-linux-amd64.tar.gz ]]; then

wget -P bin/  https://github.com/portainer/portainer/releases/download/2.18.1/portainer-2.18.1-linux-amd64.tar.gz

fi

if ! [[ -f data/portainer/portainer ]]; then

tar -xvf bin/portainer-2.18.1-linux-amd64.tar.gz -C /data/data/

fi

# the password must be hashed, no text plain password
./data/portainer/portainer  --admin-password='$2y$05$kvqEmSvsUPQJXwkPiHCYiOz8qL2FaukLBX2/xPlKWWGe4JdixIEqS'

