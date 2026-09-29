#!/bin/bash

set +e

systemctl --user restart pipewire pipewire-pulse &

/usr/libexec/xdg-desktop-portal >/dev/null 2>&1 &
/usr/libexec/xdg-desktop-portal-wlr >/dev/null 2>&1 &
