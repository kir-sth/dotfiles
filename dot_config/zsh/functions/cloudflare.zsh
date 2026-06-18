getmd() {
  local url="$1"
  local out="$2"
  local payload res md

  [[ -n "$url" ]] || return 1
  [[ -n "${CLOUDFLARE_ACCOUNT_ID:-}" ]] || return 1
  [[ -n "${CLOUDFLARE_API_TOKEN:-}" ]] || return 1

  payload=$(jaq -n --arg url "$url" '{url: $url}')

  res=$(
    curl \
      --silent \
      --show-error \
      --fail \
      --max-time 30 \
      --request POST \
      "https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/browser-rendering/markdown" \
      -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
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
