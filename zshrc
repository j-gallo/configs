export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true" # case-sensitive completion
COMPLETION_WAITING_DOTS="true"
plugins=(brew django git mercurial node npm pep8 pip python sudo tmux zsh-autosuggestions zsh-nvm)
setopt correct # auto-correct spelling

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

fpath=(/usr/local/share/zsh-completions $fpath)

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

export CASHSTAR_HOOKS="/Users/jgallo/repo/git_hooks"

current_python() { echo "$(pyenv version-name)"; }
pyenv_virtualenv_prompt() {
    GLOBAL_NAME="$(pyenv global)"
    VENV_NAME="$(current_python)"
    COLOR="%F{blue}"  # When not using global or local, but shell
    [[ "${VENV_NAME}" == "${GLOBAL_NAME}" ]] && COLOR="%F{red}"
    # This is using bash variable substring removal syntax to get the basename
    # of the currently activated $VIRTUALENV.
    [[ "${VIRTUAL_ENV##*/}" == "${VENV_NAME}" ]] && COLOR="%F{green}"
    echo "${COLOR}${VENV_NAME}%f"
}
current_node() { echo "$(nvm current)"; }
# Single quotes are important for RPROMPT; it won't update on each command if
# you use double quotes.
export RPROMPT='($(pyenv_virtualenv_prompt))'

# The order of this PATH change matters (.zshrc is loaded before .zshenv).
export PATH="/usr/local/bin:/usr/bin:/usr/local/opt/mysql/bin:/usr/local/opt/openssl/bin:/usr/local/opt/sqlite/bin:/usr/local/sbin:${PATH}:${HOME}/bin:${HOME}/go/bin:${HOME}/.rvm/bin:${HOME}/Library/Android/sdk/platform-tools"


GPG_TTY=$(tty)
export GPG_TTY

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias ll='ls -lGF';
alias la='ls -a';
alias mydbs='mysql -u root'
alias purge-pyc='find . -name "*.pyc" -delete'
alias purge-swp='find . -name ".*.swp" -delete'
alias agless='ag --python --pager "less -R"'
alias python='python3'
alias start_psql='pg_ctl -D /usr/local/var/postgres start'
alias py="python3"
