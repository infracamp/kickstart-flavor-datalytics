
# kickstart-flavor-datalytics :: Data Analytics Container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/builds/)


## Container specific `.kick.yml`-directives

## Installed Software

- Python 3
- Flask
- Jupyter (on [http://localhost:4000](http://localhost:4000) - without password / token)
- R
- RStudio (on [http://localhost:4200](http://localhost:4200) - user: "user" pass: "pass")



## Runnin flask


## Debugging the container

### RStudio Server

```
sudo /usr/lib/rstudio-server/bin/rserver --server-daemonize=0
```

