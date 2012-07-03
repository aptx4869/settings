#!/bin/bash
fortune -s 75% tang300 25% song100 | col -p | sed -e "s/3.m//" -e "s/m//" -e "s/^M//" -e "s/，/，\n/" | sed -e "s/^/   /"

#-e "s/^作者/      作者/" -e "s/^《/       《/" -e "s/^/     /"
