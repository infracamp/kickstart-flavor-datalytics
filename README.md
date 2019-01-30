
# kickstart-flavor-datalytics :: Data Analytics Container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-datalytics/builds/)


## Installed Software

| Package | Url |
|---------|-----|
| **Jupyter** | [http://localhost:4000](http://localhost:4000)          |
| **RStudio Server** | [http://localhost:4200](http://localhost:4200)   |


- R
- Python 3
- Flask

## Creating a new Project

- Create and checkout an empty repository
- Download and execute [`kickstart.sh`](https://infracamp.org/getting-started/) - let it create an empty .kick.yml
- Change `from:`-Line in `.kick.yml` to `infracamp/kickstart-flavor-datalytics`
- Create a `.gitignore` from [this preset](doc/gitignore.preset)





