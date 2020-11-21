
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1


export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

function homestead() {
    ( cd ~/code/homestead && vagrant $* )
}
alias homesteadrc='code ~/code/homestead/Homestead.yaml /etc/hosts'
alias homesteadssh='homestead ssh'

# heroku autocomplete:script zsh


alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'
alias a='php artisan'
alias flow='git flow'
alias flow_feature_start='git flow feature start' 
alias flow_feature_end='git flow feature finish' 
alias flow_fix_start='git flow hotfix start' 
alias flow_fix_end='git flow hotfix finish' 

alias lara='code ~/code/laradock'
function did() {
    ( cd ~/code/dev-in-docker-php && docker-compose $* )
}
alias didrc='code ~/code/dev-in-docker-php'
