#!/bin/bash
# prep.sh

prep-gas Princeton-2012-species.inp Princeton-2012-gas-model.lua
prep-chem Princeton-2012-gas-model.lua Princeton-2012.lua Princeton-2012-reac-file.lua

e4shared --job=lehr --prep
