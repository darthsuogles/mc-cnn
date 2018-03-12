#!/bin/bash

source ${SPACK_ROOT}/share/spack/setup-env.sh
echo "[spack] building package: [$@]"
spack install $@
