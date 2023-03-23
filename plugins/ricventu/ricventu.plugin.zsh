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

function composer() {
    docker run --rm --interactive --tty \
            --volume "$PWD":/app \
            --user $(id -u):$(id -g) \
            composer composer $@
}

function php() {
    docker run --rm --interactive --tty \
        --user $(id -u):$(id -g) \
        --volume "$(pwd)":/app \
        -w /app \
        php:8.2-cli-alpine php $@
}

function phpserve() {
    docker run --rm --interactive --tty \
        --user $(id -u):$(id -g) \
        --volume "$(pwd)":/app \
        -w /app \
        -p '81:8000' \
        php:8.2-cli-alpine php artisan serve --host 0.0.0.0
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