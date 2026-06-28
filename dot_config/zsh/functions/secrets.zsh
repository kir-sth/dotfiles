brew() {
  if rbw unlocked &>/dev/null; then
    GITHUB_TOKEN=$(rbw get "api-github") command brew "$@"
  else
    command brew "$@"
  fi
}

mise() {
  if rbw unlocked &>/dev/null; then
    GITHUB_TOKEN=$(rbw get "api-github") command mise "$@"
  else
    command mise "$@"
  fi
}

crush() {
  rbw unlocked &>/dev/null || rbw unlock || return 1
  HYPER_API_KEY=$(rbw get "api-hyper") \
  OPENROUTER_API_KEY=$(rbw get "api-openrouter") \
  ZAI_API_KEY=$(rbw get "api-zai") \
  command crush "$@"
}
