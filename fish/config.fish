if status is-interactive
    # Commands to run in interactive sessions can go here
    direnv hook fish | source
end

fish_add_path /home/lennart/.local/bin
