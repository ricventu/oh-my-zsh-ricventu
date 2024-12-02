export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1

# HOMEBREW
# brew install fzf bat eza zoxide

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# eval $(thefuck --alias)

alias cat='bat'
alias f='fzf'
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias docker-stop-all='dsta'

export PATH="/Users/ricventu/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="/Users/ricventu/Applications/oh-my-zsh-ricventu/utils:$PATH"

function laravelsail() {
    docker run --rm --interactive --tty \
        --volume composer-cache:/root/.composer \
        --volume "$(pwd)":/app \
        -w /app \
        laravelsail/php83-composer:latest $@
}

function php() {
    laravelsail php $@
}

function laravel() {
    laravelsail laravel $@
}

function composer() {
    laravelsail composer $@
}

function phpbash() {
    laravelsail bash $@
}

function cargo() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        rust:latest cargo $@
}
function cargosh() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        rust:latest bash $@
}

function python() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        python:3.10.11-bullseye python $@
}


function docker_php_get_loaded_extensions() {
    docker run --rm -it $1 php -r "print_r(implode(PHP_EOL,get_loaded_extensions()));"
}

function docker_php_get_required_extensions() {
    docker run --rm -v "$PWD":/app -w /app $1 composer show --tree | grep -o "\-ext-.* " | cut -d- -f2- | sort | uniq 
}

function docker_php_get_required_extensions_not_installed() {
    IMAGE=$1
    LOADED=$(docker_php_get_loaded_extensions $IMAGE)
    REQUIRED=$(docker_php_get_required_extensions $IMAGE)

    MISSING=()
    while read -r line; do
    if ! grep -q -i "${line:4}" <<< "$LOADED"; then
        MISSING+=("$line")
    fi
    done <<< "$REQUIRED"
    printf '%s\n' "${MISSING[@]}"
}
