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
        curl -s "wttr.in?n"
    else
        curl -s "wttr.in/$argv[1]?n"
    end
end

# nohub
function nh
    nohup $argv >/dev/null &
end

# cheat 用于解释命令作用
function ch
    curl cheat.sh/$argv[1]
end

#open amule
function amule
    nohup amule /dev/null 2>&1 &
end

#open cmus
function cmusic
    cmus $argv
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
function pyu
    sudo pacman -Syu $argv
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

set -Ux DASHSCOPE_API_KEY sk-bdb826eaa13a4c78aab613f3785e80f6

alias t task
alias x tmux
alias sc "nh scrcpy"
alias sticks 'nh xpad'
alias obsidian "nh obsidian"
