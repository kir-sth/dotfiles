getmd() {
  local url="${1:?usage: getmd <url> [output_file]}"
  local out="$2"
  local account_id api_token payload res md

  rbw unlocked &>/dev/null || rbw unlock || return 1
  account_id=$(rbw get "api-cloudflare-browser-rendering" --field=username) || return 1
  api_token=$(rbw get "api-cloudflare-browser-rendering") || return 1

  payload=$(jaq -n --arg url "$url" '{url: $url}')

  res=$(
    curl \
      --silent \
      --show-error \
      --fail \
      --max-time 30 \
      --request POST \
      "https://api.cloudflare.com/client/v4/accounts/${account_id}/browser-rendering/markdown" \
      -H "Authorization: Bearer ${api_token}" \
      -H "Content-Type: application/json" \
      -d "$payload"
  ) || return 1

  md=$(jaq -re 'if .success then .result else error end' <<<"$res") || return 1

  if [[ -n "$out" ]]; then
    printf '%s\n' "$md" >"$out" || return 1
    return
  fi

  printf '%s\n' "$md"
}
