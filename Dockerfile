FROM infracamp/kickstart-flavor-base
LABEL maintainer="Matthias Leuffen <m@tth.es>"

ADD / /kickstart
RUN chmod -R 755 /kickstart

RUN /kickstart/flavor/flavor-build.sh


# Use for debugging:
#ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/kickstart/flavorkit/scripts/start.sh"]
