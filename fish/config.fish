if test -e "/home/linuxbrew/.linuxbrew/bin/brew"
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
else if test -e "/opt/homebrew/bin/brew"
  eval (/opt/homebrew/bin/brew shellenv)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q pyenv
      pyenv init --path | source
    end
end

starship init fish | source

alias vim='nvim'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias ls='exa --git -F --icons'
alias la='exa --git -F --icons -la'
alias fzf='fzf --layout=reverse --height=40% --border'
alias wacom-restart='launchctl unload /Library/LaunchAgents/com.wacom.* && launchctl load /Library/LaunchAgents/com.wacom.*'
alias ktl=kubectl

if type -q bat
  alias preview="fd -E 'go' -E .git --type f | fzf --preview 'bat --plain --color=always {}'"
end

if type -q fd
  set -gx FZF_DEFAULT_COMMAND "fd --type f --exclude .git"
end

if type -q minikube
  minikube -p minikube docker-env | source
end

if test -e /usr/libexec/java_home
  set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8)
end

if test -d "$HOME/.cargo"
  set PATH "$HOME/.cargo/bin" $PATH
end

if test -d "$HOME/Library/Python/3.8"
  set PATH "$HOME/Library/Python/3.8/bin" $PATH
end

if test -d "$HOME/.local/bin"
  set PATH "$HOME/.local/bin" $PATH
end

if set -q GOPATH
  set -l go_bin "$GOPATH/bin"
else
  set -l go_bin "$HOME/go/bin"
end

if test -d "$go_bin"
  fish_add_path "$go_bin"
end

if test -d "/opt/homebrew/opt/openssl@3"
  fish_add_path "/opt/homebrew/opt/openssl@1.1/bin"
  set -gx LDFLAGS "$LDFLAGS -L/opt/homebrew/opt/openssl@1.1/lib"
  set -gx CPPFLAGS "$CPPFLAGS -I/opt/homebrew/opt/openssl@1.1/include"
  set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
end

if test -d "/opt/homebrew/opt/libpq"
  fish_add_path "/opt/homebrew/opt/libpq/bin"
  set -gx LDFLAGS "-L/opt/homebrew/opt/libpq/lib $LDFLAGS"
  set -gx CPPFLAGS "-I/opt/homebrew/opt/libpq/include $CPPFLAGS"
  set -gx PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/opt/homebrew/opt/libpq/lib/pkgconfig"
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

true
