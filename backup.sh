#!/bin/bash

sudo mkdir -p /volume1/docker/gitea/backups
sudo chown 1000:1000 /volume1/docker/gitea/backups

sudo /usr/local/bin/docker exec -t -u git synology_gitea bash -c "cd /data/backups && gitea dump -c /data/gitea/conf/app.ini && chmod -R 777 /data/backups/*"