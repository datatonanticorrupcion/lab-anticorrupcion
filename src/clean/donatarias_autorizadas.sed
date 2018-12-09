#!/usr/bin/env -S sed -Ef

# Remove 231 trailing commas
s/,{231}//g

# Eliminate multiple blanks
s/[[:blank:]]+/ /g

# Remove spaces between comas
s/([[:alnum:]]|\.) ,/\1,/g
