#!/bin/bash

_ass=daa
_asb=(132 asdas 2 sd sd)

declare -p _ass _asb

echo ----------------
_asb="xxxxx"
declare -p _ass _asb

echo ---------------- load
. ./data.sh
declare -p _ass _asb

echo =============

asda=1234567
echo current- $asda
(
    asda=654129874
    declare -p asda
)>axx.sh



echo -e "\n-- out:"
cat axx.sh
echo -e "-- \n"

echo current- $asda
. ./axx.sh
echo -e "after reload:"
echo current- $asda
