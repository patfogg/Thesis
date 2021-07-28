#!/bin/bash
# prep.sh

prep-gas Rogers-Schexnayder-species.inp Rogers-Schexnayder-gas-model.lua
prep-chem Rogers-Schexnayder-gas-model.lua Rogers-Schexnayder.lua Rogers-Schexnayder-reac-file.lua

e4shared --job=lehr --prep
