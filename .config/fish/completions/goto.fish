# First argument: work or personal
complete -c goto -f -n "test (count (commandline -opc)) -eq 1" -a "work personal"

# Second argument: subdirectories based on first argument
complete -c goto -f -n "test (count (commandline -opc)) -eq 2; and test (commandline -opc)[2] = work" -a "(ls ~/Documents/Works/OSBR/ 2>/dev/null)"
complete -c goto -f -n "test (count (commandline -opc)) -eq 2; and test (commandline -opc)[2] = personal" -a "(ls ~/Documents/Personal/ 2>/dev/null)"
