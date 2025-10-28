#!/usr/bin/env bash

source "srcs/utils.sh"

BANDIT_EDIT=${EDITOR-vim}

LVL=$(get_int $1)

[ -z "$LVL" ] && error 1 "Numeric argument required"

SOLVEPATH="bandit${LVL}/solve.sh"

mkdir -p $(dirname -- $SOLVEPATH) 2>/dev/null
if [ ! -f "$SOLVEPATH" ]; then
	echo -e "#!/usr/bin/env bash\n\n" > $SOLVEPATH
fi

$BANDIT_EDIT $SOLVEPATH
