if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim nvim
    alias vi vim
    alias v nvim
    alias lg lazygit
end
export PATH="$HOME/.local/bin:$PATH"
fish_add_path ~/go/bin

starship init fish | source
