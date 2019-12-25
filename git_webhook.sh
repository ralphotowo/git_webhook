#!/usr/bin/env bash

# Redirect stdout/stderr to a file
DS=`date +%Y-%m-%d`; mkdir -p /var/log/webhook/$DS/
exec > /var/log/webhook/$DS/webhook_output.log 2>&1

# Locate and assign git binary.
git=$(which git)
app_path=/var/www/api.enomy.com/

cd $app_path && $git fetch && $git pull

# Restart PM2 webserver
/usr/bin/pm2 restart all

# /usr/bin/webhook -nopanic -hooks /etc/webhook.conf -secure -key /etc/letsencrypt/live/enomy.com/privkey.pem -cert /etc/letsencrypt/live/enomy.com/fullchain.pem -verbose
