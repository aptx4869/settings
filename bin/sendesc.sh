#!/bin/bash
cat ~/.fvwm/esc_twice.txt | xmacroplay ":0.0"  1> /dev/null 2>&1
sleep 0.03
cat ~/.fvwm/esc_twice.txt | xmacroplay ":0.0"  1> /dev/null 2>&1
