if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo "
       ><(((°>
      Welcome to Fish Shell!
    " | lolcat
end


# Homebrew Path
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# clash配置
set -gx http_proxy http://172.30.32.1:7897
set -gx https_proxy http://172.30.32.1:7899
set -gx all_proxy socks5://172.30.32.1:7898
# go
set -gx PATH $HOME/go/bin $PATH
set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/go
# bun
set -gx PATH $GOROOT/bin $GOPATH/bin $PATH
set -Ux BUN_INSTALL_PROXY http://172.30.32.1:7897
#fzf
set -gx PATH $HOME/.fzf/bin $PATH
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
#java
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64
set -gx PATH $JAVA_HOME/bin $PATH
#maven
set -Ux MAVEN_HOME /usr/share/maven
set -Ux PATH $MAVEN_HOME/bin $PATH
#mason
set -gx PATH $HOME/.local/share/nvim/mason/bin $PATH
#neovim
set -Ux PATH /usr/bin /usr/local/bin $PATH # 确保 fish 可执行路径在 PATH
# npm global bin
set -U fish_user_paths /home/jackson/.local/share/fnm/node-versions/v24.12.0/installation/bin/ $fish_user_paths

alias vim nvim
alias ss "source ~/.config/fish/config.fish"
alias oo "cd ~/Code"
alias cc "vim ~/.config/fish/config.fish"
alias of "open -a finder ."
alias cn "cd ~/Note"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fnm env --use-on-cd | source
starship init fish | source

# Editor
set -gx EDITOR nvim
