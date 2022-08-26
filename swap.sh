#!/bin/bash

set -euo pipefail
GREEN='\033[0;32m'
CLEAR='\033[0m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
PREFIX='++'

read -p "Please select PHP version: " version

cd /etc/php
for d in * ; do
sudo a2dismod php$d
done

sudo a2enmod php$version
sudo update-alternatives --set php /usr/bin/php$version
sudo service apache2 restart

php -v
printf "${GREEN}$PREFIX DONE ${CLEAR}\n"
exit
