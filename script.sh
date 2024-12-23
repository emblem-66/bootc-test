#!/bin/bash

set -ouex pipefail

source <(curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/functions.sh")

rpm -qa | grep mesa

f_terra

rpm -qa | grep kernel

echo "done"
