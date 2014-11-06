#Upstart Service For Nodejs in /etc/init
description 'Agora upstart script'
author 'me'

env NAME=Agora
env LOG_FILE=/var/log/agora-production.log
env USER={{ agora_user }}
env NODE_BIN=/usr/bin/nodejs
env PORT=443
env DIRECTORY={{ agora_home }}/backend
env APP=app.js

start on runlevel [23]
stop on shutdown
# Respawn in case of a crash, with default parameters
respawn

script
  cd $DIRECTORY
  su $USER
  # Make sure logfile exists and can be written by the user we drop privileges to
  touch $LOG_FILE
  chown $USER:$USER $LOG_FILE
  # recommended approach in case of su/sudo usage so that service does not fork
  exec sudo -u $USER $NODE_BIN $DIRECTORY/$APP >> $LOG_FILE 2>&1
end script

post-start script
  echo "app $NAME $NODE_ENV post-start event" >> $LOG_FILE
end script