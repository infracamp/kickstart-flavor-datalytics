#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e

apt-get -y update
apt-get -y install python3 python3-pip jupyter r-base  gdebi-core
pip3 install pylint flask virtualenv scikit-learn scipy matplotlib seaborn



######
# RStudio Server installation
######

cd /tmp
curl -o /tmp/rstudio-server.deb https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb
gdebi -n /tmp/rstudio-server.deb
rm /tmp/rstudio-server.deb

## Workaround of apparmor bug:
echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf
echo "www-address=0.0.0.0"   >> /etc/rstudio/rserver.conf
echo "www-port=4200"         >> /etc/rstudio/rserver.conf

## Make studio start in /opt instead of /home/user
echo "session-default-working-dir=/opt"     >> /etc/rstudio/rsession.conf
echo "session-default-new-project-dir=/opt" >> /etc/rstudio/rsession.conf
echo "r-libs-user=/opt/R/x86_64-pc-linux-gnu-library/3.4" >> /etc/rstudio/rsession.conf
## Don't suspend any session
echo "session-timeout-minutes=0" >> /etc/rstudio/rsession.conf


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
#
# Required for shiny web apps
#sudo R -e 'install.packages("shiny",    repos="http://cran.rstudio.com/")'


# Set R User-Libs path to /opt
echo "R_LIBS_USER='/opt/R/x86_64-pc-linux-gnu-library/3.4'" >> /etc/R/Renviron
