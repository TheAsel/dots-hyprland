function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

alias pamcan pacman
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'

# # Helpful aliases
alias c="printf '\033[2J\033[3J\033[1;1H'"                                # clear terminal
alias l='eza -lh --icons=auto'                                            # long list
alias ls='eza -1 --icons=auto'                                            # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'    # long list all
alias ld='eza -lhD --icons=auto'                                          # long list dirs
alias lt='eza --icons=auto --tree'                                        # list folder as tree
alias in='yay -S'                                                         # install package
alias un='yay -Rns'                                                       # uninstall package
alias up='yay -Syu && flatpak update'                                     # update system/package/aur/flatpak
alias pl='yay -Qs'                                                        # list installed package
alias pa='yay -Ss'                                                        # list available package
alias pc='yay -Sc'                                                        # remove unused cache
alias po='yay -Qtdq | xargs -r -o yay -Rns && flatpak uninstall --unused' # remove unused packages
alias vc='code'                                                           # gui code editor

# # Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
    

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

# source ~/.config/fish/auto-Hypr.fish

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
