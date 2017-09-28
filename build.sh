#!/bin/zsh
bundle exec middleman build --clean
cp -R build/* /data/apidoc/
