# DWM Setup Guide

## Components

1. DWM;
2. SLStatus bar;
3. rofi;
4. xlock;
5. brightnessctl;
6. tlp;
7. redshift;
8. autorandr.


## Instalation

### This repo

Ensure this repository is installed and in your .config directory

### DWM and SLStatus

First we install the repositories, setup hard links to .config files, compile tools and scripts

TODO: Create a script that automatically compiles and setup executables

```bash
    mkdir -p ~/suckless 
    cd suckless
    git clone <DWM>
    git clone <SLStatus>

    # Create hard links for config.h files in .config/[dwm, slstatus]

    # Compile DWM and SLStatus
    
    # Compile and setup script executables
```

Now we need to create a .desktop file for DWM on /usr/share/xsessions/dwm.desktop

```TOML
[Desktop Entry]
Name=DWM
Comment=Dynamic Window Manager
Exec=~/.local/bin/dwm-session
Type=Application
```


### Rofi and Xlock

```bash
    sudo dnf install rofi xlock brightnessctl redshift tlp autorandr
```

### NVIDIA Proprietary Drivers

```bash
    sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
```

If using a setup with hybrid GPU (integrated and discrete) Make sure to disable the control of the discrete one in /etc/tlp.conf
