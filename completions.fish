set -l commands dir init tasks times add addproject addtime hide rm rmproject rmtime edit assign unassign mv

set -l tododir (todo dir)

# Disable filename completion
complete -c todo -f

# Offer subcommands
complete -c todo -n "not __fish_seen_subcommand_from $commands" -a "$commands"

# Offer project list

complete -c todo -n "__fish_seen_subcommand_from add" \
  -a "(find $tododir/tasks -type d -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
complete -c todo -n "__fish_seen_subcommand_from rmproject" \
  -a "(find $tododir/tasks -type d -execdir realpath --relative-to="$tododir/tasks" '{}' +)"

# Offer time list
complete -c todo -n "__fish_seen_subcommand_from rmtime" \
  -a "(find $tododir/times -type d -execdir realpath --relative-to="$tododir/times" '{}' +)"

# Offer task list
complete -c todo -n "__fish_seen_subcommand_from edit" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
complete -c todo -n "__fish_seen_subcommand_from hide" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
complete -c todo -n "__fish_seen_subcommand_from rm" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
complete -c todo -n "__fish_seen_subcommand_from unassign" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"

# TODO: Complete second argument?
complete -c todo -n "__fish_seen_subcommand_from assign" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
complete -c todo -n "__fish_seen_subcommand_from mv" \
  -a "(find $tododir/tasks -type f -execdir realpath --relative-to="$tododir/tasks" '{}' +)"
