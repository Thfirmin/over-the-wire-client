#!/usr/bin/env bash

source "srcs/utils.sh"
source "bandit.env" 2>/dev/null || error 2 "bandit.env required, use init command"

LVL=$(get_int $1)

[ -z "$LVL" ] && error 1 "Numeric argument required"

PSSWD=$(cat "bandit${LVL}/data.txt" 2>/dev/null)
[ -z "${PSSWD}" ] && error 1 "Level ${LVL} not solved yet"

SOLVE_SCRIPT="bandit${LVL}/solve.sh"

if [ -f "$SOLVE_SCRIPT" ]; then
	SOLVE_FILE="bandit$((LVL + 1))/data.txt"
	mkdir -p $(dirname -- "${SOLVE_FILE}")
	$SSHPASS -p "${PSSWD}" ssh -p ${BANDIT_PORT} bandit${LVL}@${BANDIT_HOST} 'bash -s' < "${SOLVE_SCRIPT}" 2>/dev/null | grep -oEi [A-Z0-9]{32} > "${SOLVE_FILE}"
else
	error 2 "Level ${LVL} don't have solved yet"
fi
