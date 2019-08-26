#!/bin/bash

## File is executed as root - change to user


if [ "$DEV_MODE" == "1" ]
then
    echo ""
    echo "=========== Kickstart Datalytics ==============="
    echo "| JUPYTER on port 4000 (http://localhost:4000) |"

    sudo -E -s -u user python3 -m ipykernel install --user
    sudo -E -s -u user PYTHONPATH=/opt/:$PYTHONPATH jupyter notebook --ip=0.0.0.0 --port=4000 --NotebookApp.token='' --notebook-dir=/opt &> /var/log/jupyter.log &

    echo "| Remote debuggging on Port 4100 (SSH)"

    # echo "| RStudio on port 4200 (http://localhost:4200)"

    ## Set user home directory to /opt (Default is /home/user - but rstudio can't change it)
    ### Don't do that - history and ssh keys might end up in the project (See settings in rsession)
    #usermod -d /opt user
    #ln -s /home/user/.bashrc /opt/.bashrc
    #ln -s /home/user/.ssh /opt/.ssh

    # sudo -E -s -u user /usr/lib/rstudio-server/bin/rserver --server-daemonize=0 --server-working-dir=/opt --auth-minimum-user-id=100 --server-user=user --auth-validate-users=0 &> /var/log/rserver.log &

    ## Start SSH Service
    service ssh start
else
    echo "Production mode. Skip starting ssh and jupyter"
fi;

