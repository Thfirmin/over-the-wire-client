#!/usr/bin/env bash

BANDIT_LVL=$(ls -d bandit*[0-9] | sed "s/^bandit//g")

for lvl in {1..33}; do
	HASPSSWD=$(ls "bandit${lvl}/data.txt" 2>/dev/null)
	SOLVED=$(ls "bandit${lvl}/solve.sh" 2>/dev/null)

	if [ -n "${SOLVED}" ]; then
		echo -e "\x1b[32m[ lvl $lvl ]: SOLVED\x1b[0m"
	else
		if [ -n "${HASPSSWD}" ]; then
			echo -e "\x1b[33m[ lvl $lvl ]: ABLE TO START\x1b[0m"
		else
			echo -e "\x1b[31m[ lvl $lvl ]: NOT STARTED YET\x1b[0m"
		fi
	fi
done
