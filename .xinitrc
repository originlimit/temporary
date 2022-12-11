#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export WINIT_X11_SCALE_FACTOR=1;
xset r rate 233 43; 
xinput set-prop 'MOSART Semi. 2.4G Office Mouse' 'libinput Accel Speed' -0.7;
setxkbmap -option caps:escape -option altwin:swap_alt_win;
xsetroot -cursor_name left_ptr;

intern=LVDS1
extern=HDMI1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    #xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --auto
    xrandr --output "$intern" --off --output "$extern" --auto
fi

#exec startlxde
exec xmonad
#lwp 1920 1080 3 /usr/share/lwp/wallpapers/test
#feh --bg-fill ~/Pictures/wallpapers/waterfall.jpg
#picom --experimental-backends --config ~/.config/picom/picom.conf
