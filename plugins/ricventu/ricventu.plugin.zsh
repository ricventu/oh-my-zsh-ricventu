
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"

function homestead() {
    ( cd ~/code/github/homestead && vagrant $* )
}

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'

alias hosts='code /etc/hosts'
alias homesteadrc='code ~/code/github/homestead/Homestead.yaml /etc/hosts'
alias homesteadssh='homestead ssh'
alias a='php artisan'
alias flow='git flow'
alias flow_feature_start='git flow feature start' 
alias flow_feature_end='git flow feature finish' 
alias flow_fix_start='git flow hotfix start' 
alias flow_fix_end='git flow hotfix finish' 
