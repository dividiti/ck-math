#! /bin/bash

#
# Installation script.
#
# See CK LICENSE.txt for licensing details.
# See CK COPYRIGHT.txt for copyright details.
#
# Developer(s):
# - Grigori Fursin, grigori.fursin@cTuning.org, 2017
# - Anton Lokhmotov, anton@dividiti.com, 2017
#

if [ "${CK_HAS_OPENMP}" != "0"  ]; then
  export CK_REF_LIBRARIES="${CK_LINKER_FLAG_OPENMP}"
fi

export CK_CMAKE_EXTRA="${CK_CMAKE_EXTRA} \
 -DOPENCL_ROOT:PATH=${CK_ENV_LIB_OPENCL} \
 -DOPENCL_LIBRARIES:FILEPATH=${CK_ENV_LIB_OPENCL_LIB}/${CK_ENV_LIB_OPENCL_DYNAMIC_NAME} \
 -DOPENCL_INCLUDE_DIRS:PATH=${CK_ENV_LIB_OPENCL_INCLUDE} \
 -DTUNERS=${CK_CLTUNE_TUNERS} \
 -DCLTUNE_ROOT:PATH=${CK_ENV_TOOL_CLTUNE} \
 -DCLIENTS=ON \
 -DCBLAS_INCLUDE_DIRS:PATH=${CK_ENV_LIB_OPENBLAS_INCLUDE} \
 -DCBLAS_LIBRARIES:FILEPATH=${CK_ENV_LIB_OPENBLAS_LIB}/${CK_ENV_LIB_OPENBLAS_STATIC_NAME} -lgomp \
 -DSAMPLES=${CK_CLTUNE_SAMPLES} \
 -DCLIENTS=${CK_CLTUNE_CLIENTS} \
 -DCK_REF_LIBRARIES=${CK_REF_LIBRARIES} \
 -DANDROID=ON"

return 0
