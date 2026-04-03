function goto
    switch $argv[1]
        case work
            set -l base ~/Documents/Works/OSBR
            if test (count $argv) -ge 2
                cd $base/$argv[2]
            else
                cd $base
            end
        case personal
            set -l base ~/Documents/Personal
            if test (count $argv) -ge 2
                cd $base/$argv[2]
            else
                cd $base
            end
        case '*'
            echo "Usage: goto [work|personal] [subdirectory]"
    end
end
