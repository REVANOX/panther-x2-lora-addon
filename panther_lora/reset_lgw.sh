#!/bin/bash
# Panther X2: SX1302 reset = GPIO120 (gpiochip3 line 24), power enable = GPIO129 (gpiochip4 line 1)
PWR_CHIP=gpiochip4; PWR_LINE=1
RST_CHIP=gpiochip3; RST_LINE=24
PIDF=/tmp/lora_pwr.pid

stop_power() {
  if [ -f "$PIDF" ]; then kill "$(cat "$PIDF")" 2>/dev/null; rm -f "$PIDF"; fi
}

case "$1" in
  start)
    stop_power
    gpioset --mode=signal $PWR_CHIP $PWR_LINE=1 >/dev/null 2>&1 &
    echo $! > "$PIDF"
    sleep 0.3
    gpioset $RST_CHIP $RST_LINE=1; sleep 0.1
    gpioset $RST_CHIP $RST_LINE=0; sleep 0.1
    ;;
  stop)
    gpioset $RST_CHIP $RST_LINE=1
    stop_power
    ;;
  *)
    echo "Usage: $0 {start|stop}" >&2
    exit 1
    ;;
esac
exit 0
