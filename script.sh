#!/bin/bash

set -ouex pipefail

source ./functions.sh

source <(curl -s "$SCRIPT_URL")


f_terra

echo "done"
