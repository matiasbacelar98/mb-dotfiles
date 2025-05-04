# Function to reload .zshrc
function reload() {
  source ~/.zshrc
  echo "The .zshrc file has been reloaded"
}

# Search in command history
function histgrep() {
  history | grep "$1"
}

# Search for files by name
function f() {
  find . -iname "*$1*"
}

# Test network
function pingtest(){
  ping -c 4 1.1.1.1 && echo "✅ Network OK" || echo "❌ Network Issue"
}
