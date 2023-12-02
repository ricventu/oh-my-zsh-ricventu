export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1

# HOMEBREW
# brew install ncdu fzf bat exa

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

alias cat='bat'
alias ls='exa --group-directories-first'
alias ll='exa -l --group-directories-first'
alias l='exa -l --group-directories-first'
alias la='exa -la --group-directories-first'
alias f='fzf'
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias didrc='code ~/code/dev-in-docker /etc/hosts'

alias docker-stop-all='dsta'

export PATH="/Users/ricventu/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

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

function git-merged() {
    git branch --merged | grep -v  "master\|main\|develop" | sed 's/origin\///' 
}
function git-merged-prune() {
    git branch --merged | grep -v  "master\|main\|develop" | sed 's/origin\///' | xargs git branch -d
}
function git-remote-merged() {
    git branch -r --merged | grep -v  "master\|main\|develop" | sed 's/origin\///'
}
function git-remote-merged-prune() {
    git branch -r --merged | grep -v  "master\|main\|develop" | sed 's/origin\///' | xargs -n 1 git push -d origin
}

function buildpack() {
    # buildpack build my/image --builder heroku/builder:20
    # buildpack build "my/image:latest" --builder 'heroku/builder:22'  --buildpack 'heroku/php' --buildpack 'heroku/nodejs'
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $PWD:/workspace -w /workspace \
        buildpacksio/pack:latest $@
}

function factorybook() {
    cd ~/code/factorybook/myfactorybook-website && yarn dev
}
