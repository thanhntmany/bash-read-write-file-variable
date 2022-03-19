#!/bin/bash

# . ./function.sh
load_variables_from_file_RET_FILE=
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


amp_v='ampv truc khi load'
ac_v='ampv truc khi load'
ade="ade truc khi load"

echo amp_v: $amp_v
echo ac_v: $ac_v
echo ade: $ade

echo ---- load ----
load_variables_from_file test1.sh aas ss amp_v ade
echo ---- load ----

echo amp_v: $amp_v
echo ac_v: $ac_v
echo ade: $ade
