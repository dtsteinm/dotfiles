#source $HOME/.profile
mpd &>| /dev/null
autoplay info &>| /dev/null
supybot -d /home/dylan/supybot/DVSBot.conf 
