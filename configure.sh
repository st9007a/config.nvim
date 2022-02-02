#!/bin/sh

sed "s~HOME~$HOME~g" lua/plugins/lsp/init_template.lua > lua/plugins/lsp/init.lua
