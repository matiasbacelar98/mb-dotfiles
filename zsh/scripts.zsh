# Function to reload .zshrc
function reload() {
  source ~/.zshrc
  echo "The .zshrc file has been reloaded"
}

# Search in command history
histgrep() {
  history | grep "$1"
}

# Search for files by name
f() {
  find . -iname "*$1*"
}

# Test network
pingtest(){
  ping -c 4 1.1.1.1 && echo "✅ Network OK" || echo "❌ Network Issue"
}
