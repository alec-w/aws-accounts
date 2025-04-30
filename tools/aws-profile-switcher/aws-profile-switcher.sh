#!/bin/bash

# Based upon
# https://github.com/ahmetb/kubectx/blob/master/kubens
# and
# https://github.com/johnnyopao/awsp/blob/master/run.sh
# (wanting a shell only solution)

set -eou pipefail
IFS=$'\n\t'

SELF_CMD="$0"

exit_err() {
   echo >&2 "${1}"
   exit 1
}

current_profile() {
  echo "${AWS_PROFILE:-default}"
}

choose_profile_interactive() {
  # directly calling kubens via fzf might fail with a cryptic error like
  # "$FZF_DEFAULT_COMMAND failed", so try to see if we can list profiles
  # locally first
  if [[ -z "$(list_profiles)" ]]; then
    echo >&2 "error: could not list profiles (is your aws config located at ~/.aws/config?)"
    exit 1
  fi

  local choice
  choice="$(FORCE_COLOUR=1 FZF_DEFAULT_COMMAND="${SELF_CMD}" fzf --ansi --no-preview || true)"
  if [[ -z "${choice}" ]]; then
    echo 2>&1 "error: you did not choose any of the options"
    exit 1
  else
    set_profile "${choice}"
  fi
}

set_profile() {
  printf %s "${1}" > "$HOME/.awsp"
}

list_profiles() {
  local yellow darkbg normal
  yellow=$(tput setaf 3 || true)
  darkbg=$(tput setab 0 || true)
  normal=$(tput sgr0 || true)

  local current_fg current_bg
  current_fg=${yellow}
  current_bg=${darkbg}

  local profiles
  profiles=$(cat ~/.aws/config | grep -o '\[profile [^]]\+' | awk '{ print $2 }' || exit_err "error getting profile list")

  local current
  current="$(current_profile)"

  for profile in $profiles; do
    if [[ -n "${FORCE_COLOUR:-}" || -t 1 && -z "${NO_COLOR:-}" ]]; then
      # coloured output mode
      if [[ "${profile}" = "${current}" ]]; then
        echo "${current_bg}${current_fg}${profile}${normal}"
      else
        echo "${profile}"
      fi
    else
      echo "${profile}"
    fi
  done
  export MY_TEST_VAR=hello
}

main() {
  if [[ "$#" -eq 0 ]]; then
    if [[ -t 1 && "$(type fzf &>/dev/null; echo $?)" -eq 0 ]]; then
      choose_profile_interactive
    else
      list_profiles
    fi
  fi
}

main "$@"