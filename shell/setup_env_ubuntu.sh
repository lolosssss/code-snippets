#!/bin/bash
#
# This script is used to set development environment on Ubuntu.
# To run this script: `sudo sh path/to/script/setup_env.sh`
#

set +e

start_date=`date +"%F %T"`

# Software version
NODE_VERSION="8.11.2"

apt-get update
apt-get upgrade -y

# Install dev essential dependencies
apt-get install -y build-essential python wget openssh-server


# Install nvm, node version manager
if ! (command -v nvm >/dev/null 2>&1); then
    echo "\n[ Command nvm not exists. Installing... ]"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    source ~/.bashrc
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    if ! (command -v  nvm >/dev/null 2>&1); then
        echo "\n[ Install nvm failed, please install manually. ]"
        echo "[ Refer to https://github.com/creationix/nvm ]\n"
        exit 1
    fi
fi
echo "\n[ Install node-v$NODE_VERSION ]\n"
nvm install $NODE_VERSION
if command -v node >/dev/null 2>&1; then
    echo "\n[ node-v$NODE_VERSION installed ]\n"
else
    echo "\n[ node-v$NODE_VERSION installation failed, please try to install manually ]"
    exit 1
fi
npm install -g nrm

# Install *-cli for frontend DEV
# web
npm install -g node-gyp yarn
npm install -g @angular/cli babel-cli karma-cli gulp-cli ts-node json5 semver
npm install -g eslint-cli jest-cli yo
# mobile
npm install -g cordova ionic


# Install Java 1.8.* ENV
#apt-get install default-jre default-jdk maven
# Install Tomcat8
#apt-get install tomcat8 tomcat8-docs tomcat8-examples tomcat8-admin


end_date=`date +"%F %T"`

echo "\n[ Run \"$0\" Done. $start_date ~ $end_date ]\n"

set -e
