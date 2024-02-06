#!/bin/bash

source set_env_variables.sh

echo $HARMONIE_HOME

cd $HARMONIE_SRC && $HARMONIE_MAKEUP/configure -c -H -G -B -E sources.linux $HARMONIE_MAKEUP/config.$HARMONIE_CONFIG

cd $HARMONIE_SRC && $HARMONIE_MAKECMD
