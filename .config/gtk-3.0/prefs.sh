#! /usr/bin/env bash

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences workspace-names \[\'1\',\ \'2\',\ \'3\',\ \'4\'\,\ \'5\'\,\ \'6\'\,\ \'7\'\,\ \'8\'\,\ \'9\'\,\ \'10\'\]
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.desktop.interface color-scheme \'prefer-dark\'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface enable-hot-corners false

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 \[\'\<Control\>1\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 \[\'\<Control\>2\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 \[\'\<Control\>3\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 \[\'\<Control\>4\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 \[\'\<Control\>5\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 \[\'\<Control\>6\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 \[\'\<Control\>7\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 \[\'\<Control\>8\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 \[\'\<Control\>9\'\]
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 \[\'\<Control\>0\'\]

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 \[\'\<Shift\>\<Control\>1\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 \[\'\<Shift\>\<Control\>2\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 \[\'\<Shift\>\<Control\>3\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 \[\'\<Shift\>\<Control\>4\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 \[\'\<Shift\>\<Control\>5\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 \[\'\<Shift\>\<Control\>6\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 \[\'\<Shift\>\<Control\>7\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 \[\'\<Shift\>\<Control\>8\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 \[\'\<Shift\>\<Control\>9\'\]
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 \[\'\<Shift\>\<Control\>0\'\]

gsettings set org.gnome.desktop.default-applications.terminal exec \'foot\'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.wm.preferences focus-mode \'mouse\'
gsettings set org.gnome.shell.app-switcher current-workspace-only true

gsettings set org.gnome.shell favorite-apps \[\'firefox-esr.desktop\',\ \'foot.desktop\',\ \'io.gitlab.news_flash.NewsFlash.desktop\',\ \'org.gnome.Nautilus.desktop\'\]
gsettings set org.gnome.shell.extensions.auto-move-windows application-list \[\'kitty.desktop:2\',\ \'firefox-esr.desktop:1\',\ \'io.gitlab.news_flash.NewsFlash.desktop:4\',\ \'foot.desktop:2\'\]
gsettings set org.gnome.shell enabled-extensions \[\'Vitals@CoreCoding.com\',\ \'auto-move-windows@gnome-shell-extensions.gcampax.github.com\',\ \'simply.workspaces@andyrichardson.dev\',\ \'workspace-indicator@gnome-shell-extensions.gcampax.github.com\',\ \'launch-new-instance@gnome-shell-extensions.gcampax.github.com\',\ \'apps-menu@gnome-shell-extensions.gcampax.github.com\',\ \'caffeine@patapon.info\',\ \'appindicatorsupport@rgcjonas.gmail.com\',\ \'gnome-clipboard@b00f.github.io\'\]
