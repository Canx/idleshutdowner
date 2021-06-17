#!/bin/sh

idle_time=`expr $1`

if [ -z "$idle_time" ]; then
  exit 1
fi

x_xprintidle_ok() {
  xprintidle > /dev/null
  return $?
}

get_x_idle_seconds() {
  expr `xprintidle` / 1000
}

shutdown_system() {
  shutdown +5 'idle shutdown: use "sudo shutdown -c" from a terminal to cancel shutdown'
  exit 0
}

while true; do
  x_idle_seconds=`get_x_idle_seconds`
  if [[ x_xprintidle_ok ]] ; then
    x_idle_seconds=`get_x_idle_seconds`
    logger "X Idle seconds: $x_idle_seconds"
    if [ "$x_idle_seconds" -gt "$idle_time" ]; then
      logger shutting down due to idle timer
      #shutdown_system
    fi
  fi
  sleep 60
done
