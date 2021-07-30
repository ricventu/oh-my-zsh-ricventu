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

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# heroku autocomplete:script zsh


alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias a='php artisan'


# ALIAS
function did() {
    ( cd ~/code/dev-in-docker && ./docker-compose.sh $* )
}
function didphp() {
    did run --rm -v $(pwd):/workdir/ -w /workdir/ php7.3 php $*
}
function didssh() {
    did exec php7.3 bash
}
alias didrc='code ~/code/dev-in-docker /etc/hosts'

alias didlogms='tail -f ~/code/dev-in-docker/log/mysql/mysql.log'

function strooka() {
    ( cd ~/code/strooka/master/strooka-docker && ./strooka $* )
}
alias strookalog='tail -f ~/code/strooka/master/strooka-docker/volumes/logs/mysql/general.log'
