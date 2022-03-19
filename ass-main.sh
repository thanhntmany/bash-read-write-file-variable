#!/bin/bash

# Author: Thanhntmany
#
# Write and load bash variable to/from file
# Write:
#   $> write_variables_to_file FILEPATH var1 var2 var3 ...
# Load: (First, create an associative array to store the ouput)
#   $> declare -A var_out
#   $> load_variables_from_file var_out FILEPATH var1 var3
#   $> declare -p var_out
#

write_variables_to_file()
{
    local _file_output=$1
    shift
    (
        declare -p $@
    )>"$_file_output"

}

load_variables_from_file()
{
    declare -n _ref=$1
    local _file_input=$2
    shift 2

    local vars=$@
    local $vars _var_name

    . "$_file_input" &>/dev/null

    for _var_name in $vars; do
        declare -n _var_ref=$_var_name
        _ref[$_var_name]=${_var_ref[@]}
    done

}
