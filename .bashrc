#toilet -f mono12 -F metal Hi Ram!
echo "Welcome Ram"
#archey -c
source ~/.env
source ~/.aliases
source ~/.functions
export PATH=/usr/local/bin:$PATH
export SECRET_DIR=~/siva
alias abra="cd $SECRET_DIR"
alias dsiva="rm ~/siva"
alias changedir="cd"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ramraju1/.sdkman"
[[ -s "/Users/ramraju1/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ramraju1/.sdkman/bin/sdkman-init.sh"

#DatAnchor
sid='influxd -config /usr/local/etc/influxdb.conf'
INFLUXDB_CONFIG_PATH=/etc/influxdb/influxdb.conf
alias stadb='adb reverse tcp:8081 tcp:8081'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/ram/.travis/travis.sh ] && source /Users/ram/.travis/travis.sh
