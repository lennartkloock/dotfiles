if status is-interactive
    # Commands to run in interactive sessions can go here
    direnv hook fish | source
end

fish_add_path ~/.local/bin
fish_add_path ~/go/bin
fish_add_path ~/.cargo/bin
