export::cloudflare() {
  export CLOUDFLARE_ACCOUNT_ID=$(rbw get "api-cloudflare-browser-rendering" --field=username)
  export CLOUDFLARE_API_TOKEN=$(rbw get "api-cloudflare-browser-rendering")
}

export::github() {
  export GITHUB_TOKEN=$(rbw get "api-github")
}

export::zai() {
  export ZAI_API_KEY=$(rbw get "api-zai")
}
