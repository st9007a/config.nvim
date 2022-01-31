#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '.bak' "s~HOME~$HOME~g" lua/setup/lsp/lsp.lua
elif [[ "$OSTYPE" == "linux-gun"* ]]; then
    sed -i "s~HOME~$HOME~g" lua/setup/lsp/lsp.lua
else
    exit 1
fi
