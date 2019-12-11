# Make sure zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug && \
        source ~/.zplug/init.zsh && \
        zplug update
else
    source ~/.zplug/init.zsh
fi

## begin zplug ##
zplug "zplug/zplug"

# Theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# For node
zplug "tj/n", use:"bin/n", as:command

# oh-my-zsh features
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh

# scripts
zplug "trapd00r/ls--", as:command, use:"ls++", if:"type perl > /dev/null", hook-build:"cp ~/.zplug/repos/trapd00r/ls--/ls++.conf ~/.ls++.conf"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "so-fancy/diff-so-fancy", as:command, use:"third_party/build_fatpack/diff-so-fancy"
zplug "denilsonsa/prettyping", as:command, use:"prettyping"

if [[ "$OSTYPE" == "linux-gnu" ]]
then
  # These from GitHub releases only have Linux releases.
  if ! command -v bat >/dev/null 2>&1
  then
    zplug "sharkdp/bat", \
      as:command, \
      from:gh-r, \
      use:"*x86_64*linux-gnu*", \
      rename-to:bat
  fi

  if ! command -v tldr >/dev/null 2>&1
  then
    zplug "dbrgn/tealdeer", \
      as:command, \
      from:gh-r, \
      use:"*x86_64*", \
      rename-to:tldr
  fi

  if ! command -v exa >/dev/null 2>&1
  then
    zplug "ogham/exa", \
      as:command, \
      from:gh-r, \
      use:"*linux*", \
      rename-to:exa
  fi
else
fi


# Install plugins that are not installed
if ! zplug check --verbose; then
     zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
## end zplug ##

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg          # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  # elixir      # Elixir section
  # xcode       # Xcode section
  swift         # Swift section
  golang        # Go section
  # php         # PHP section
  rust          # Rust section
  # haskell     # Haskell Stack section
  # julia       # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet      # .NET section
  # ember       # Ember.js section
  kubecontext   # Kubectl context section
  # terraform   # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

if hash gls 2> /dev/null
then
  alias ls="gls --color=auto"
else
  alias ls="ls --color=auto"
fi

LS_COLORS='\
no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:\
doneex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:\
*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:\
*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:\
*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:\
*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:\
*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:\
*.go=32:*.sql=32:*.csv=32:*.sv=32:*.svh=32:*.v=32:*.vh=32:*.vhd=32:*.bmp=33:*.cgm=33:*.dl=33:\
*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:\
*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:\
*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:\
*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:\
*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:\
*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:\
*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:\
*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.odt=31:*.dot=31:*.dotx=31:*.ott=31:*.xls=31:\
*.xlsx=31:*.ods=31:*.ots=31:*.ppt=31:*.pptx=31:*.odp=31:*.otp=31:*.fla=31:*.psd=31:*.7z=1;35:\
*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:\
*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:\
*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:\
*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:\
*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:\
*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:\
*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:\
*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:\
*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:\
*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:\
';
# Misc zsh config
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Highlighting rules
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=240

# dircolors
if [[ -a $HOME/.dircolors ]]; then
    eval $(dircolors -b $HOME/.dircolors)
fi

# most instead of less
if type most >/dev/null 2>&1; then
    export MANPAGER="most -s"
fi

# Go
if type go >/dev/null 2>&1; then
    export GOPATH=~/go
    export PATH=$PATH:$GOPATH/bin
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

fpath+=~/.zfunc

test -e "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && \
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
test -e "$HOME/.profile" && source "$HOME/.profile"
source "$HOME/.aliases"

# Function to display external IP address
ext-ip() { curl http://ipecho.net/plain; echo }

# Autosuggest is ctrl+space
bindkey '^ ' autosuggest-accept

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
elif [[ "$OSTYPE" == "darwin"* ]]
then
  export EDITOR='mvim'
else
  export EDITOR="gvim"
fi

# To use a different version of Java, simply change the "1.8" to whichever version you want.
test -e "/usr/libexec/java_home" && export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi

# Bash completion for IBM Cloud API
test -e /usr/local/ibmcloud/autocomplete/zsh_autocomplete && \
  source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

if [[ "$OSTYPE" == "darwin"* ]]
then
  # Use MacVim for terminal vim
  alias vim="mvim -v"

  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
