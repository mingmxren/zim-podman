(( ${+commands[podman]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[podman]:-"$(${commands[asdf]} which podman 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_podman
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'podman'. Regenerated completions."
  fi
} ${0:h}
