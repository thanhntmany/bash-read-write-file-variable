#!/bin/bash

. ./ass-main.sh

amp_v="asimple variable"
ac_v=("a" "complex" "variable")
ade="smt"

write_variables_to_file "test1.sh" amp_v ac_v ade
cat test1.sh