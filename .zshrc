# Make sure zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug && \
        source ~/.zplug/init.zsh && \
        zplug update --verbose
else
    source ~/.zplug/init.zsh
fi

## begin zplug ##
zplug "zplug/zplug"

# Theme
eval "$(starship init zsh)"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# For node
#zplug "tj/n", use:"bin/n", as:command

# oh-my-zsh features
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh

# scripts
#zplug "trapd00r/ls--", as:command, use:"ls++", if:"type perl > /dev/null", hook-build:"cp ~/.zplug/repos/trapd00r/ls--/ls++.conf ~/.ls++.conf"
#zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
#zplug "so-fancy/diff-so-fancy", as:command, use:"third_party/build_fatpack/diff-so-fancy"
#zplug "denilsonsa/prettyping", as:command, use:"prettyping"

# Recommended installs:
#
# https://github.com/dandavison/delta

#if [[ "$OSTYPE" == "linux-gnu" ]]
#then
#  # These from GitHub releases only have Linux releases.
#  if ! command -v bat >/dev/null 2>&1
#  then
#    zplug "sharkdp/bat", \
#      as:command, \
#      from:gh-r, \
#      use:"*x86_64*linux-gnu*", \
#      rename-to:bat
#  fi
#
#  if ! command -v fd >/dev/null 2>&1
#  then
#    zplug "sharkdp/fd", \
#      as:command, \
#      from:gh-r, \
#      use:"*x86_64*linux-gnu*", \
#      rename-to:fd
#  fi
#
#  if ! command -v hexyl >/dev/null 2>&1
#  then
#    zplug "sharkdp/hexyl", \
#      as:command, \
#      from:gh-r, \
#      use:"*x86_64*linux-gnu*", \
#      rename-to:hexyl
#  fi
#
#  if ! command -v tldr >/dev/null 2>&1
#  then
#    zplug "dbrgn/tealdeer", \
#      as:command, \
#      from:gh-r, \
#      use:"*x86_64*", \
#      rename-to:tldr
#  fi
#
#  if ! command -v exa >/dev/null 2>&1
#  then
#    zplug "ogham/exa", \
#      as:command, \
#      from:gh-r, \
#      use:"*linux*", \
#      rename-to:exa
#  fi
#else
#fi


# Install plugins that are not installed
if ! zplug check --verbose; then
     zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
## end zplug ##

# Misc zsh config
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Highlighting rules
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=240


if type fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND="fd --type f --exclude .git"
fi

# Go
if type go >/dev/null 2>&1; then
    export GOPATH=~/go
    export PATH="$PATH:$GOPATH/bin"
fi

# Node
if type n >/dev/null 2>&1; then
    export N_PREFIX=$HOME/.local
    export PATH=$N_PREFIX/bin:$PATH
fi

# Cargo
if type cargo >/dev/null 2>&1; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH="${HOME}/.local/bin:/opt/homebrew/bin:${PATH}"

# Machine specific
if [ -f ~/.zsh_machine ]; then
    . ~/.zsh_machine
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Start of customisations

# If you are using multiple shells with zsh, the history will be inconsistent
# unless this option is set in each shell.
setopt share_history

fpath+=~/.zfunc

test -e "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && \
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
test -e "$HOME/.profile" && source "$HOME/.profile"
source "$HOME/.aliases"

# Function to display external IP address
ext-ip() { curl http://ipecho.net/plain; echo }

# Autosuggest is ctrl+space
#bindkey '^ ' autosuggest-accept

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#elif [[ "$OSTYPE" == "darwin"* ]]
#then
#  export EDITOR='vim'
#else
#  export EDITOR="gvim"
#fi

# To use a different version of Java, simply change the "1.8" to whichever version you want.
#test -e "/usr/libexec/java_home" && export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi

# Bash completion for IBM Cloud API
#test -e /usr/local/ibmcloud/autocomplete/zsh_autocomplete && \
#  source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

if [[ "$OSTYPE" == "darwin"* ]]
then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Wasmer
#export WASMER_DIR="$HOME/.wasmer"
#[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
