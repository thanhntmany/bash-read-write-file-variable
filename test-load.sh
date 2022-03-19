#!/bin/bash

. ./ass-main.sh

amp_v='ampv truc khi load'
ac_v='ampv truc khi load'
ade="ade truc khi load"

echo amp_v: $amp_v
echo ac_v: $ac_v
echo ade: $ade

declare -A out
load_variables_from_file out test1.sh amp_v ac_v ade zz xx aint

declare -p out
