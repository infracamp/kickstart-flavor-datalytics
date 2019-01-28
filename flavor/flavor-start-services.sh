#!/bin/bash

## File is executed as root - change to user

echo ""
echo "=========== Kickstart Datalytics ==============="
echo "| JUPYTER on port 4000 (http://localhost:4000) |"
sudo -E -s -u user jupyter notebook --ip=0.0.0.0 --port=4000 --NotebookApp.token='' &


echo "| RStudio on port 4200 (http://localhost:4200) User: user Pass: pass"

/usr/lib/rstudio-server/bin/rserver --server-daemonize=0  --auth-minimum-user-id=100 &

