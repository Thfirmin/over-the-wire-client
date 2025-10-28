#!/usr/bin/env bash

get_int()
{
	num=${1?"Int argument is required"}
	if [[ "$num" =~ ^-?[0-9]+$ ]]; then
		echo "$num"
		return 0
	fi
	return 1
}

get_float()
{
	$num=${1?"Int argument is required"}
	if [[ "$num" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
		echo "$num"
		return 0
	fi
	return 1
}

error()
{
	STATUS_CODE=${1-1}
	STATUS_CODE=$((STATUS_CODE))
	shift
	echo $@ >&2
	exit $STATUS_CODE
}

SSHPASS=$(which sshpass)

[ "$?" = 1 ] && error 2 "sshpass package required"
