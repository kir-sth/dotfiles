bumblebee::sync() {
  local dir="$XDG_CACHE_HOME/bumblebee"
  local api="https://api.github.com/repos/perplexityai/bumblebee/contents/threat_intel"
  local tmp name url

  tmp=$(mktemp -d) || return 1

  while read -r name url; do
    curl -fsSL "$url" -o "$tmp/$name" || { rm -rf "$tmp"; return 1 }
  done < <(curl -fsSL "$api" | jaq -er '.[] | select(.name | endswith(".json")) | "\(.name) \(.download_url)"') \
    || { rm -rf "$tmp"; return 1 }

  rm -rf "$dir"
  mv "$tmp" "$dir"
}

bumblebee::scan() {
  bumblebee scan --profile deep \
    --root "$HOME" \
    --exposure-catalog "$XDG_CACHE_HOME/bumblebee" \
    --max-duration 10m \
    --findings-only
}
