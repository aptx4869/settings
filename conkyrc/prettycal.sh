#!/bin/bash
DJS=`date +%_d`
env LANG= cal | sed '1d' | sed -e '/./!d' -e 's/$/                     /' | fold -w 21 | sed -n '/^.\{21\}/p' | sed /"$DJS "/s/"$DJS "/'${color green}'"$DJS"'${color gold}'" "/ | sed -e 's/Sa/Sa${color gold}/' | sed -e 's/^/${alignc}/'
