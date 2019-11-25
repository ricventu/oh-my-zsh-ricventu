
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"

function homestead() {
    ( cd ~/code/homestead && vagrant $* )
}

alias zshrc='code ~/.zshrc "$ZSH" "$ZSH_CUSTOM"'

alias hosts='code /etc/hosts'
alias homesteadrc='code ~/code/homestead/Homestead.yaml /etc/hosts'
alias homesteadssh='homestead ssh'
alias a='php artisan'
alias flow='git flow'
