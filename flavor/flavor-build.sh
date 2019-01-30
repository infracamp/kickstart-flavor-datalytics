#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e

apt-get -y update
apt-get -y install python3 python3-pip jupyter r-base  gdebi-core
pip3 install pylint flask



######
# RStudio Server installation
######

cd /tmp
curl -o /tmp/rstudio-server.deb https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb
gdebi -n /tmp/rstudio-server.deb

## Workaround of apparmor bug:
echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf
echo "www-address=0.0.0.0"   >> /etc/rstudio/rserver.conf
echo "www-port=4200"         >> /etc/rstudio/rserver.conf


# Install required R Packages
sudo R -e 'install.packages("evaluate",     repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("digest",       repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("highr",        repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("markdown",     repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("stringr",      repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("yaml",         repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("Rcpp",         repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("htmltools",    repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("caTools",      repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("bitops",       repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("knitr",        repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("jsonlite",     repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("base64enc",    repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("rprojroot",    repos="http://cran.rstudio.com/")'
sudo R -e 'install.packages("rmarkdown",    repos="http://cran.rstudio.com/")'




