echo "Welcome Ram!"
source ~/.env
source ~/.aliases
source ~/.efc

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind 'set completion-ignore-case on'
bind 'set visible-stats on'
bind 'set page-completions off'

# added by travis gem
[ -f /Users/efc/.travis/travis.sh ] && source /Users/efc/.travis/travis.sh
source <(kubectl completion bash)
