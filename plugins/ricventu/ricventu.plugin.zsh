export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1

# HOMEBREW
# brew install fzf bat exa

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# eval $(thefuck --alias)

alias cat='bat'
alias ls='exa --group-directories-first'
alias ll='exa -lg --group-directories-first'
alias l='exa -lg --group-directories-first'
alias la='exa -lag --group-directories-first'
alias f='fzf'
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias didrc='code ~/code/dev-in-docker /etc/hosts'

alias docker-stop-all='dsta'

export PATH="/Users/ricventu/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="/Users/ricventu/Applications/oh-my-zsh-ricventu/utils:$PATH"

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

function php81() {
    docker run --rm --interactive --tty \
        --user $(id -u):$(id -g) \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.1 php $@
}

function php81sh() {
    docker run --rm --interactive --tty \
        --user $(id -u):$(id -g) \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.1 bash $@
}

function php() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.2 php $@
}

function composer() {
     docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        composer:2 $@
}

function phpsh() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.2 bash
}

function php81buildpack() {
    docker run --rm --interactive --tty \
        --volume "/Users/ricventu/code/github/heroku-buildpack-php":/buildpack \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.1 bash
}

function phpserve() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/buildpack \
        -w /app \
        -p '8000:8000' \
        docker-apps:php-8.2 php artisan serve --host 0.0.0.0
}

function buildpack() {
    # buildpack build my/image --builder heroku/builder:20
    # buildpack build "my/image:latest" --builder 'heroku/builder:22'  --buildpack 'heroku/php' --buildpack 'heroku/nodejs'
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $PWD:/workspace -w /workspace \
        buildpacksio/pack:latest $@
}

function docker_php_get_loaded_extensions() {
    docker run --rm -it $1 php -r "print_r(implode(PHP_EOL,get_loaded_extensions()));"
}

function docker_php_get_required_extensions() {
    docker run --rm -v "$PWD":/app -w /app $1 composer show --tree | grep -o "ext-.* " | sort | uniq 
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