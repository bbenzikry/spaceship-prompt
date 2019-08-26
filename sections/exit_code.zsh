#
# Exit code
#
# Show exit code of last executed command

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_EXIT_CODE_SHOW="${SPACESHIP_EXIT_CODE_SHOW=false}"
SPACESHIP_EXIT_CODE_PREFIX="${SPACESHIP_EXIT_CODE_PREFIX=""}"
SPACESHIP_EXIT_CODE_SUFFIX="${SPACESHIP_EXIT_CODE_SUFFIX=" "}"
SPACESHIP_EXIT_CODE_SYMBOL="${SPACESHIP_EXIT_CODE_SYMBOL="✘"}"
SPACESHIP_EXIT_CODE_OK_SYMBOL="${SPACESHIP_EXIT_CODE_OK_SYMBOL="✔"}"

SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_exit_code() {
  # [[ $SPACESHIP_EXIT_CODE_SHOW == false || $RETVAL == 0 ]] && return
  [[ $SPACESHIP_EXIT_CODE_SHOW == false ]] && return
  local EXIT_CODE="$RETVAL"
  local EXIT_CODE_SNIPPET=""
  if [[ "$EXIT_CODE" == 0 ]] 
  then
    EXIT_CODE_SNIPPET="${SPACESHIP_EXIT_CODE_OK_SYMBOL}"
    SPACESHIP_EXIT_CODE_COLOR="green"
  else
    EXIT_CODE_SNIPPET="${SPACESHIP_EXIT_CODE_SYMBOL}${EXIT_CODE}" \
  fi
  spaceship::section \
    "$SPACESHIP_EXIT_CODE_COLOR" \
    "$SPACESHIP_EXIT_CODE_PREFIX" \
    "$EXIT_CODE_SNIPPET" \
    "$SPACESHIP_EXIT_CODE_SUFFIX"
}