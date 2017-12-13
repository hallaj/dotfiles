# enable tmux

if which tmux &>/dev/null; then
  # skip this for tilix
  if [ $TILIX_ID ]; then
    return
  fi

  if [ -z "$TMUX" ]; then
    tmux new-session
  fi
fi
