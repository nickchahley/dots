if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi

export ZMK_APP="/home/nikoli/personal/keyboard/zmk-firmware/zmk/app"
