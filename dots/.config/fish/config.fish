function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Use zoxide
    zoxide init fish | source
    
    # Aliases
    abbr cd "z"
    abbr clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    abbr celar "printf '\033[2J\033[3J\033[1;1H'"
    abbr claer "printf '\033[2J\033[3J\033[1;1H'"
    abbr q 'qs -c ii'
    abbr ssh 'kitten ssh'

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

    # Directory navigation shortcuts
    abbr .. 'cd ..'
    abbr ... 'cd ../..'
    abbr .3 'cd ../../..'
    abbr .4 'cd ../../../..'
    abbr .5 'cd ../../../../..'

    # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
    abbr mkdir 'mkdir -p'

    abbr rm 'trash'

    # Sync files from USB to PC
    function downsync
        set project_path Work
        set local_path /home/asel/Documents
        set usb_path /run/media/asel/Osi_s\ USB
    
        # Check for -p or --project flag
        if test (count $argv) -gt 0
            if test $argv[1] = "-p" -o $argv[1] = "--project"
                set project_path "Work/Projects/SA02381A_Traduttore_GVA_LSD"
            end
        end
    
        # Check if USB is mounted
        if not mountpoint -q $usb_path
            echo "❌ USB drive not mounted. Aborting."
            return 1
        end
    
        # Check if folder exists on USB
        if not test -d "$usb_path/$project_path"
            echo "⚠️  Project folder '$usb_path/$project_path' not found on USB."
            return 1
        end
    
        # Confirmation prompt
        read -P "Syncing files from USB → PC ($project_path). Confirm? [y/N] " confirm
        if test $confirm = "y" -o $confirm = "Y" -o $confirm = "yes" -o $confirm = "YES"
            sudo rsync -av --update --progress "$usb_path/$project_path/" "$local_path/$project_path/"
    	sudo chown -R asel:asel "$local_path/$project_path/"
        else
            echo "Cancelled."
        end
    end
        
    # Sync files from PC to USB
    function upsync
        set project_path Work
        set local_path /home/asel/Documents
        set usb_path /run/media/asel/Osi_s\ USB
    
        # Check for -p or --project flag
        if test (count $argv) -gt 0
            if test $argv[1] = "-p" -o $argv[1] = "--project"
                set project_path "Work/Projects/SA02381A_Traduttore_GVA_LSD"
            end
        end
    
        # Check if USB is mounted
        if not mountpoint -q $usb_path
            echo "❌ USB drive not mounted. Aborting."
            return 1
        end
    
        # Check if local folder exists
        if not test -d "$local_path/$project_path"
            echo "⚠️  Local folder '$local_path/$project_path' not found."
            return 1
        end
    
        # Confirmation prompt
        read -P "Syncing files from PC → USB ($project_path). Confirm? [y/N] " confirm
        if test $confirm = "y" -o $confirm = "Y" -o $confirm = "yes" -o $confirm = "YES"
            sudo rsync -av --update --progress "$local_path/$project_path/" "/$usb_path/$project_path/"
        else
            echo "Cancelled."
        end
    end

    # function fish_prompt
    #   set_color cyan; echo (pwd)
    #   set_color green; echo '> '
    # end

    # source ~/.config/fish/auto-Hypr.fish

    set -x BUN_INSTALL "$HOME/.bun"
    set -x PATH "$BUN_INSTALL/bin:$PATH"
    set -x GTK_THEME "Adwaita"
    set -x NDDSHOME "/home/asel/rti_connext_dds-7.3.1/"
    set -x PATH "$NDDSHOME/bin/:$PATH"
    set -x DOCKER_BUILDKIT 1
    set -x COMPOSE_DOCKER_CLI_BUILD 1
    set -x MICRO_TRUECOLOR 1
end
