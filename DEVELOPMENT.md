# Developing this container

## Adding libraries to the container


See [`flavor/flavor-build.sh`](flavor/flavor-build.sh) on how to add modules and install
R and python packages.


## Debugging the container

Logging:
- RStudio will log to `/var/log/rstudio.log`
- Jupyter will log to `/var/log/jupyter.log`

### RStudio Server

```
sudo /usr/lib/rstudio-server/bin/rserver --server-daemonize=0
```
