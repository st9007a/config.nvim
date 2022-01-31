#!/bin/sh

sed "s~HOME~$HOME~g" lua/setup/lsp/lsp_template.lua > lua/setup/lsp/lsp.lua
