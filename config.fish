if status is-interactive
    # Commands to run in interactive sessions can go here
end

# 设置 JAVA_HOME（替换为你的实际路径）
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -gx PATH $JAVA_HOME/bin $PATH

# 设置 EDITOR
set -gx EDITOR nvim

#天气
function weather
    if test (count  $argv) -eq 0
        curl -s "wttr.in?nT"
    else
        curl -s "wttr.in/$argv[1]?nT"
    end
end

# 建立tmux 新会话
function ta
    if tmux has-session 2>/dev/null
        tmux attach
    else
        tmux new-session
    end
end

# 结束 tmux 会话 
function td
    tmux detach $argv
end

function la
    command ls -la $argv
end
function ls
    command ls -l $argv
end

function grep
    command grep --color=auto $argv
end
function vi
    command nvim $argv
end
# open musicfox
function music
    musicfox $argv
end

# pacman command
function ps
    sudo pacman -S $argv
end
function pr
    sudo pacman -R $argv
end
function pyy
    sudo pacman -Syy $argv
end

# git alias
function gs
    git status $argv
end
function gl
    git lg $argv
end
function gp
    git push -u origin main $argv
end
