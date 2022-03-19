#!/bin/bash

# Author: Thanhntmany
#
# Write and load bash variable to/from file
# Write:
#   $> write_variables_to_file FILEPATH var1 var2 var3 ...
# Load:
#   $> load_variables_from_file FILEPATH var1 var3
#   $> . $load_variables_from_file_RET_FILE
#
# After run load_variables_from_file, delacrations of listed variables will be
# stored in load_variables_from_file_RET_FILE.
# Then you can use the second command to load the listed variables into
# the current variable environment.
# NOTE: load_variables_from_file_RET_FILE is a file stored in tmp folder,
# it's removed automatically by OS. However, in som case, you must remove
# it by yourself

write_variables_to_file()
{
    local _file_output=$1
    shift
    (
        declare -p $@
    )>"$_file_output"

}

load_variables_from_file_RET_FILE=
load_variables_from_file()
{
    local _file_input=$1
    shift
    local $@
    load_variables_from_file_RET_FILE=$(mktemp --suffix=__asstraiers )
    (
        . "$_file_input" &>/dev/null
        declare -p $@ 2>/dev/null
    )>$load_variables_from_file_RET_FILE
}
#NOTE: to load the result, run the code below
# $> . $load_variables_from_file_RET_FILE
