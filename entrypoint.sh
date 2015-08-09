#!/bin/bash
set -e

case "$1" in
  install)
    echo "Installing node..."
    install -m 0755 /scripts/nodejs /target/
    ln -sf nodejs /target/node
    echo "Installing npm..."
    ln -sf nodejs /target/npm
    echo "Installing express-generator..."
    ln -sf nodejs /target/express
    echo "Installing nodemon..."
    ln -sf nodejs /target/nodemon
    ;;
  uninstall)
    echo "Uninstalling node..."
    rm -rf /target/nodejs
    rm -rf /target/node
    echo "Uninstalling npm..."
    rm -rf /target/npm
    echo "Uninstalling express-generator..."
    rm -rf /target/express
    echo "Uninstalling nodemon..."
    rm -rf /target/nodemon
    ;;
  node|nodejs|npm|express|nodemon)
    chown -R nodejs:nodejs /home/nodejs/src
    cd /home/nodejs/src
    exec sudo -u nodejs -H $@
    ;;
  *)
    exec $@
    ;;
esac
