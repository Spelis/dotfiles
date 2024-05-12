#!/bin/bash
#   

lasttheme=$(cat $HOME/.config/theme/cur)

if [[ $lasttheme == "dark" ]]; then
    theme="light"
    icon=" "
    echo $theme > $HOME/.config/theme/cur
    echo $icon > $HOME/.config/theme/icon
else
    theme="dark"
    icon=" "
    echo $theme > $HOME/.config/theme/cur
    echo $icon > $HOME/.config/theme/icon
fi

bash $HOME/.config/hypr/pywal.sh $(cat $HOME/.config/theme/bg)
