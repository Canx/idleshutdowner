#!/bin/sh

idle_time=`expr $1 \* 60 \* 60`

if [ -z "$idle_time" ]; then
  exit 1
fi

get_terminal_idle_seconds() {
  expr `date +%s` - `stat --format %X /dev/pts/* | sort -n | tail -1`
}

x_server_accessible() {
  DISPLAY=:0 xprintidle > /dev/null
  return $?
}

get_x_idle_seconds() {
  expr `DISPLAY=:0 xprintidle` / 1000
}

shutdown_system() {
  shutdown +5 'idle shutdown: use "sudo shutdown -c" from a terminal to cancel shutdown'
  exit 0
}

while true; do
  terminal_idle_seconds=`get_terminal_idle_seconds`
  if [ "$terminal_idle_seconds" -gt "$idle_time" ]; then
    if x_server_accessible; then
      x_idle_seconds=`get_x_idle_seconds`
      if [ "$x_idle_seconds" -gt "$idle_time" ]; then
        logger shutting down due to idle timer
        shutdown_system
      fi
    else
      logger shutting down due to idle timer
      shutdown_system
    fi
  fi
  sleep 60
done
