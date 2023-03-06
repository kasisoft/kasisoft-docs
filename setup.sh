#!/bin/bash
rm -rf ./public/*
hugo
yarn prettier
yarn build-index
yarn crc32-menu
cp static/*.json ./public

# rss
mv ./public/index.xml ./public/index.rss
find ./public -name index.xml | xargs rm
xpretty ./public/index.rss

# rsync --delete -avz --rsync-path="sudo rsync" "./public/" "kasisoft.com:/var/www/public"
