#!/bin/bash

amp_v="asimple variable"
ac_v=("a" "complex" "variable")

write_variables_to_file()
{
    local f=$1
    shift
    (
        declare -p $@
    )>"$f"

}

write_variables_to_file "test1.sh" amp_v ac_v
cat test1.sh

echo -------------
echo test load file

amp_v='1 value'
echo amp_v before load: $amp_v

amp_v='2 value xxx'
write_variables_to_file "test1.sh" amp_v ac_v

load_variables_from_file()
{
    local f=$1
    shift
    local $@

    echo "in func : $amp_v"
    source "$f"
    echo "in func : $amp_v"
}

echo ------ file -----
cat test1.sh
echo ------ file -----

load_variables_from_file test1.sh aas ss amp_v
echo amp_v after load: $amp_v
