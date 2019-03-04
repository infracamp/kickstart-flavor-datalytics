#!/bin/bash

## File is executed as root - change to user

echo ""
echo "=========== Kickstart Datalytics ==============="
echo "| JUPYTER on port 4000 (http://localhost:4000) |"
sudo -E -s -u user jupyter notebook --ip=0.0.0.0 --port=4000 --NotebookApp.token='' &> /var/log/jupyter.log &


echo "| RStudio on port 4200 (http://localhost:4200)"

## Set user home directory to /opt (Default is /home/user - but rstudio can't change it)
### Don't do that - history and ssh keys might end up in the project (See settings in rsession)
#usermod -d /opt user
#ln -s /home/user/.bashrc /opt/.bashrc
#ln -s /home/user/.ssh /opt/.ssh

sudo -E -s -u user /usr/lib/rstudio-server/bin/rserver --server-daemonize=0 --server-working-dir=/opt --auth-minimum-user-id=100 --server-user=user --auth-validate-users=0 &> /var/log/rserver.log &


