
# kickstart-flavor-datalytics :: Data Analytics Container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-py3/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-py3/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-py3/builds/)


## Container specific `.kick.yml`-directives

| Key | Default | Description |
|----------------|----------------|---------------------|
|

## Installed Software

- Python 3
- Flask
- Jupyter (on [http://localhost:4000](http://localhost:4000) - without password / token)
- R



## Runnin flask


## Debugging the container

### RStudio Server

```
sudo /usr/lib/rstudio-server/bin/rserver --server-daemonize=0
```

