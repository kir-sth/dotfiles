_setup() {
  export YOUR_API_KEY=$(rbw get "api-example")
  export YOUR_API_ID=$(rbw get "api-example" --field=username)
}
