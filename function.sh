#!/bin/bash

write_variables_to_file()
{
    local f=$1
    shift
    (
        declare -p $@
    )>"$f"

}

load_variables_from_file()
{
    local _file_input=$1
    shift
    echo "in func amp_v: $amp_v"
    . <(
        . "$_file_input" &>/dev/null
        declare -p $@ 2>/dev/null
    )
    echo "in func amp_v: $amp_v"
}
