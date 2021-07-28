#! /bin/bash
# prep.sh

prep-gas Stanford-2011-species.inp Stanford-2011-gas-model.lua
prep-chem Stanford-2011-gas-model.lua Stanford-2011.lua Stanford-2011-reac-file.lua

e4shared --job=lehr --prep
