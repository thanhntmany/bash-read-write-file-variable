#!/bin/bash

. ./ass-main.sh

amp_v='ampv truc khi load'
ac_v='ampv truc khi load'
ade="ade truc khi load"

echo amp_v: $amp_v
echo ac_v: $ac_v
echo ade: $ade

echo -- load --
load_variables_from_file test1.sh aas ss amp_v ade ac_v
. $load_variables_from_file_RET_FILE

echo amp_v: $amp_v
echo ac_v: ${ac_v[@]}
echo ade: $ade
