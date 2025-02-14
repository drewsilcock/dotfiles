if test -e /usr/libexec/java_home
  set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8 2> /dev/null)
end

if test -d "$HOME/.cargo"
  source "$HOME/.cargo/env.fish"
end

if test -d "$HOME/Library/Python/3.8"
  fish_add_path "$HOME/Library/Python/3.8/bin"
end

if test -d "$HOME/.local/bin"
  fish_add_path "$HOME/.local/bin"
end

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

  if type -q starship
    starship init fish | source
  end

  if type -q atuin
    atuin init fish --disable-up-arrow | source
  end

  if type -q minikube
    minikube -p minikube docker-env | source
  end

  if type -q fnm
    fnm env --use-on-cd --shell fish | source
  end
end

alias vim='nvim'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gds='git diff --staged'
alias ls='eza --git -F --icons'
alias la='eza --git -F --icons -la'
alias fzf='fzf --layout=reverse --height=40% --border'
alias wacom-restart='launchctl unload /Library/LaunchAgents/com.wacom.* && launchctl load /Library/LaunchAgents/com.wacom.*'
alias ktl=kubectl
alias k=kubectl
alias src='type -q deactivate && deactivate; source ./.venv/bin/activate.fish'
alias adog='git log --graph --oneline --decorate --all'
alias sync-podman-clock='podman machine ssh "sudo chronyc -m \'burst 4/4\' makestep; date -u"'

if type -q bat
  alias preview="fd -E 'go' -E .git --type f | fzf --preview 'bat --plain --color=always {}'"
end

if type -q fd
  set -gx FZF_DEFAULT_COMMAND "fd --type f --exclude .git"
end

#if test -e /usr/libexec/java_home
#  set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8)
#end

if test -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
  fish_add_path "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
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

function envsource
  for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] (string trim --chars=\'\" $item[2])
    echo "Exported key $item[1]"
  end
end

true
