FROM infracamp/kickstart-flavor-base:testing
LABEL maintainer="Matthias Leuffen <m@tth.es>"

ADD / /kickstart
RUN chmod -R 755 /kickstart && /kickstart/flavor/flavor-build.sh && rm -R /var/lib/apt/lists


# Use for debugging:
#ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/kickstart/flavorkit/scripts/start.sh"]
