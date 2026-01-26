#!/usr/bin/env fish

set fish_config "$HOME/.config/fish/config.fish"
set nvim_config "$HOME/.config/nvim"
set tmux_config "$HOME/.tmux.conf"
set yazi_config "$HOME/.config/yazi"
set alacritty_config "$HOME/.config/alacritty"

if test "$argv[1]" = push
    ln -sf (realpath config.fish) "$fish_config"

    ln -sf (realpath nvim) "$nvim_config"

    ln -sf (realpath .tmux.conf) "$tmux_config"

    ln -sf (realpath yazi) "$yazi_config"

    ln -sf (realpath alacritty) "$alacritty_config"
end

if test "$argv[1]" = sync
    if test -w /run/media/adam/Elements
        rsync -av --delete ~/Documents/ /run/media/adam/Elements/Docuements/
        rsync -av --delete ~/projects/ /run/media/adam/Elements/Projects/
    else
        echo "sync target Elements is not accessible"
    end
end
