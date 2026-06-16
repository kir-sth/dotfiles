setup() {
  [[ ! -o interactive || ! -t 0 ]] && return 1
  rbw unlocked &>/dev/null || rbw unlock || return 1
  export YOUR_API_KEY=$(rbw get "api-example")
  export YOUR_API_ID=$(rbw get "api-example" --field=username)
}
