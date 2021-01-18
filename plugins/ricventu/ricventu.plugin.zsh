
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export COMPOSER_MEMORY_LIMIT=-1

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"

#   export LDFLAGS="-L/usr/local/opt/php@7.3/lib"
#   export CPPFLAGS="-I/usr/local/opt/php@7.3/include"


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
    ( cd ~/code/dev-in-docker && ./docker-compose.sh $* )
}
function didphp() {
    did run --rm -v $(pwd):/workdir/ -w /workdir/ php7.3 php $*
}
function didssh() {
    did exec php7.3 bash
}
alias didrc='code ~/code/dev-in-docker /etc/hosts'
