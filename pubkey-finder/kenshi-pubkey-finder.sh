#!/bin/bash
cd

if [ ! -d "kenshi-pubkey-finder" ]; then
    mkdir kenshi-pubkey-finder
fi

cd kenshi-pubkey-finder

if [ ! -f "package.json" ]; then
    wget https://raw.githubusercontent.com/ruesandora/Kenshi/main/pubkey-finder/package.json
fi

if [ ! -f "index.js" ]; then
    wget https://raw.githubusercontent.com/ruesandora/Kenshi/main/pubkey-finder/index.js
fi

if [ ! -d "node_modules" ]; then
    npm install
fi

node index.js
