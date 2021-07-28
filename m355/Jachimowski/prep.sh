#! /bin/bash
# prep.sh

prep-gas Jachimowski-species.inp Jachimowski-gas-model.lua
prep-chem Jachimowski-gas-model.lua Jachimowski.lua Jachimowski-reac-file.lua
e4shared --job=lehr --prep
