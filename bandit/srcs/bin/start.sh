#!/usr/bin/env bash

source "srcs/utils.sh"
source "bandit.env" 2>/dev/null || error 2 "bandit.env required, use init command"

LVL=$(get_int $1)

[ -z "$LVL" ] && error 1 "Numeric argument required"

PSSWD=$(cat "bandit${LVL}/data.txt" 2>/dev/null)
[ -z "${PSSWD}" ] && error 1 "Level ${LVL} not solved yet"
$SSHPASS -p "${PSSWD}" ssh -p ${BANDIT_PORT} bandit${LVL}@${BANDIT_HOST}
