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
alias fzf='fzf --layout=reverse --height=40% --border'
alias wacom-restart='launchctl unload /Library/LaunchAgents/com.wacom.* && launchctl load /Library/LaunchAgents/com.wacom.*'
alias ktl=kubectl

if type -q bat
  alias preview="fd -E 'go' -E .git --type f | fzf --preview 'bat --plain --color=always {}'"
end

if type -q fd
  set -gx FZF_DEFAULT_COMMAND "fd --type f --exclude .git"
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

if test -d "$HOME/Bin"
  set PATH "$HOME/Bin" $PATH
end

if test -d "$HOME/.local/bin"
  set PATH "$HOME/.local/bin" $PATH
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

true
