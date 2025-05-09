# --- Variables ---
export WEZTERM_CONFIG="/mnt/e/.config/wezterm"
export STARSHIP_CONFIG="/mnt/e/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- History ---
# Avoid duplicates in history 
setopt histignorealldups

# Synchronize history between terminals
setopt sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# --- Plugins ---
# Enable autosuggestions from command history
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting for commands
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable 'eza' plugin for a more powerful 'ls' command
source ~/.zsh/zsh-eza/zsh-eza.plugin.zsh

# Enable 'copypath' plugin to copy the full path of files or directories
source ~/.zsh/copypath/copypath.plugin.zsh

# --- Command Not Found ---
# (This handles "command not found" situations)

if [ -x /usr/lib/command-not-found ]; then
  source /etc/zsh_command_not_found
fi

# --- Completion System ---
# Load the completion system
autoload -Uz compinit
 
# Initializes the Zsh completion system
compinit

# Configure the completion system behavior
zstyle ':completion:*' auto-description 'specify: %d'  # Show descriptions for completions
zstyle ':completion:*' completer _expand _complete _correct _approximate  # Enable expanded completion, correction, and approximation
zstyle ':completion:*' format 'Completing %d'  # Set format for the completion message
zstyle ':completion:*' group-name ''  # Disable grouping for completion results
zstyle ':completion:*' menu select=2  # Enable interactive menu for selecting completions (with 2 options shown)
eval "$(dircolors -b)"  # Enable colorized output for `ls` and other commands
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # Use LS_COLORS for completion list coloring
zstyle ':completion:*' list-colors ''  # Set default list coloring (empty for auto)
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s  # Prompt user to press TAB for more options
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'  # Match files ignoring case and special characters
zstyle ':completion:*' menu select=long  # Use a longer menu for completions
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s  # Set prompt for scrolling through selections
zstyle ':completion:*' use-compctl false  # Disable compatibility with older Zsh completion system (compctl)
zstyle ':completion:*' verbose true  # Show more detailed completion information

# Configure process completions for the `kill` command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'  # Display process details for `kill` completion

# --- Initializations ---
eval "$(starship init zsh)" # Initializes the Starship prompt for Zsh

# --- Scripts ---
source ~/.zsh/scripts.zsh
