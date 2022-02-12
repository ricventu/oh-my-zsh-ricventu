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

# heroku autocomplete:script zsh

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias a='php artisan'

function composer() {
    docker run --rm --interactive --tty \
        --volume "$PWD":/app \
        composer $@
}

function did() {
    ( cd ~/code/dev-in-docker && ./did $* )
}

function didphp() {
    did run --rm -v "$PWD":/workdir/ -w /workdir/ php7.3 php $@
}
function didssh() {
    did ssh
}
alias didrc='code ~/code/dev-in-docker /etc/hosts'

function strooka() {
    ( cd ~/code/strooka/master/strooka-docker && ./strooka $@ )
}

function mfb() {
    ( cd ~/code/myfactorybook/myfactorybook-docker && ./mfb $* )
}
