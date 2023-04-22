export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1

# HOMEBREW
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias a='sail artisan'
alias didrc='code ~/code/dev-in-docker /etc/hosts'

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
        docker-apps:php-8.2 composer $@
}

function phpsh() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        docker-apps:php-8.2 bash
}

function phpserve() {
    docker run --rm --interactive --tty \
        --volume "$(pwd)":/app \
        -w /app \
        -p '8000:8000' \
        docker-apps:php-8.2 php artisan serve --host 0.0.0.0
}

function gitprune-local() {
    git branch --merged | grep -v  "master\|main\|develop" | sed 's/origin\///' | xargs git branch -d
}
function gitprune-remote() {
    git branch -r --merged | grep -v  "master\|main\|develop" | sed 's/origin\///' | xargs -n 1 git push -d origin
}

function factorybook() {
    # cd ~/code/factorybook/myfactorybook-api && make
    cd ~/code/factorybook/myfactorybook-website && yarn dev
}