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


function factorybook() {
    cd ~/code/factorybook/myfactorybook-api && make
    cd ~/code/factorybook/myfactorybook-website && yarn dev
}