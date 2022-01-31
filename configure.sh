#!/bin/sh

sed -i '.bak' "s~HOME~$HOME~g" lua/setup/lsp/lsp.lua
