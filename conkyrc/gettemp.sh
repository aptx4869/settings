#!/bin/bash
# get the current data of given line (start with $1)
sensors|grep "^$1" |cut -d'(' -f1|grep -Po '\d+(.\d)?(?!:)'
