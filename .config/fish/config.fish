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

abbr pamcan pacman
abbr clear "printf '\033[2J\033[3J\033[1;1H'"
abbr q 'qs -c ii'

# # Helpful aliases
abbr c "printf '\033[2J\033[3J\033[1;1H'"                                  # clear terminal
abbr l 'eza -lh --icons=auto'                                              # long list
abbr ls 'eza -1 --icons=auto'                                              # short list
abbr ll 'eza -lha --icons=auto --sort=name --group-directories-first'      # long list all
abbr ld 'eza -lhD --icons=auto'                                            # long list dirs
abbr lt 'eza --icons=auto --tree'                                          # list folder as tree
abbr in 'paru -S'                                                          # install package
abbr un 'paru -Rns'                                                        # uninstall package
abbr up 'paru -Syu && flatpak update'                                      # update system/package/aur/flatpak
abbr pl 'paru -Qs'                                                         # list installed package
abbr pa 'paru -Ss'                                                         # list available package
abbr pc 'paru -Sc'                                                         # remove unused cache
abbr po 'paru -Qtdq | xargs -r -o paru -Rns && flatpak uninstall --unused' # remove unused packages
abbr vc 'code'                                                             # gui code editor

# # Directory navigation shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
    

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

# source ~/.config/fish/auto-Hypr.fish

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
