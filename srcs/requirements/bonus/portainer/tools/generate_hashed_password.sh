#!/bin/sh

set -e

# Load environment variables from .env file
. ../../../../.env

echo "PORTAINER_PASS is: $PORTAINER_PASS"
echo HASHED PASSWORD:
echo "'$(htpasswd -nb -B admin $PORTAINER_PASS | cut -d ":" -f2)'"
