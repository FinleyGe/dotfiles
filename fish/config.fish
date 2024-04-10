if status is-interactive
    # Commands to run in interactive sessions can go here
end
# starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/finley/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set fish_greeting ""
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/anaconda/bin/conda
#     eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# end
# # <<< conda initialize <<<
#
pyenv init - | source
