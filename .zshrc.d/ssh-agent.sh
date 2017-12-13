# ssh-agent

if which envoy &>/dev/null; then
  envoy -t ssh-agent
  source <(envoy -p)
elif which keychain &>/dev/null; then
  eval $(keychain --quick --quiet id_rsa)
fi
