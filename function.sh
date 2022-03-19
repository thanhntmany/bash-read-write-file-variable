#!/bin/bash

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
