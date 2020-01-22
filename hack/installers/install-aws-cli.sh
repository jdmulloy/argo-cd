#!/bin/bash
set -eux -o pipefail

AWS_CLI_VERSION=1.17.7

[ -e $DOWNLOADS/awscli-bundle.zip ] || curl -sLf --retry 3 -o $DOWNLOADS/awscli-bundle.zip https://s3.amazonaws.com/aws-cli/awscli-bundle-${AWS_CLI_VERSION}.zip
pushd $DOWNLOADS
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
popd
aws --version
