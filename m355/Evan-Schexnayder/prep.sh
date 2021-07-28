#!/bin/bash
# prep-chem.sh
prep-gas Evans-Schexnayder-species.inp Evans-Schexnayder-gas-model.lua
prep-chem Evans-Schexnayder-gas-model.lua Evans-Schexnayder.lua Evans-Schexnayder-reac-file.lua

#!/bin/bash
# prep.sh
e4shared --job=lehr --prep

