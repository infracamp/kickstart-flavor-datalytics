#!/bin/bash

set -e

docker build --pull -t infracamp/kickstart-flavor-datalytics:testing .
