# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # custom_apple
  # custom_vim
  # custom_node
  # custom_ruby
  # custom_javascript
  ssh
  user
  ip
  custom_wifi_signal
  dir
  vcs
  newline
  status
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# Add the custom Vim icon prompt segment
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_CUSTOM_VIM="echo -n $'\uE7C5'"
POWERLEVEL9K_CUSTOM_VIM_FOREGROUND="green"
POWERLEVEL9K_CUSTOM_VIM_BACKGROUND="gray"

# Add the custom Apple icon prompt segment
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_CUSTOM_APPLE="echo -n $'\uE711'"
POWERLEVEL9K_CUSTOM_APPLE_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_APPLE_BACKGROUND="black"

# Add the custom Javascript icon prompt segment
POWERLEVEL9K_CUSTOM_JAVASCRIPT="echo -n $'\ue781'"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_BACKGROUND="yellow"

# Add the custom Ruby icon prompt segment
POWERLEVEL9K_CUSTOM_RUBY="echo -n $'\ue791'"
POWERLEVEL9K_CUSTOM_RUBY_FOREGROUND="red"
POWERLEVEL9K_CUSTOM_RUBY_BACKGROUND="black"

# Add the custom NodeJs icon prompt segment
POWERLEVEL9K_CUSTOM_NODE="echo -n $'\uf898'"
POWERLEVEL9K_CUSTOM_NODE_FOREGROUND="green"
POWERLEVEL9K_CUSTOM_NODE_BACKGROUND="black"

# MacOS only
# Add the custom WIFI icon prompt segment
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"
zsh_wifi_signal(){
  if [[ `uname` == 'Darwin' ]]; then
    local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
    local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

    if [ "$airport" = "Off" ]; then
      local color='%F{yellow}'
      echo -n "%{$color%}Wifi Off"
    else
      local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
      local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
      local color='%F{yellow}'

      [[ $speed -gt 100 ]] && color='%F{green}'
      [[ $speed -lt 50 ]] && color='%F{red}'

      echo -n "%{$color%}$ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font
    fi
  else
    echo -n ''
  fi

}
# MacOS only
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx ruby node ansible docker)

source $ZSH/oh-my-zsh.sh
if [[ -f $HOME/.aliases ]]; then
  source $HOME/.aliases
fi
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias vm="vim"
if type nvim > /dev/null 2>&1; then
  alias vm="nvim"
  alias vim="nvim"
fi
alias ll="ls -lGa"
alias sl="sl | lolcat"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
