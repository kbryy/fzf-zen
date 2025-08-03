function __fzf_zen_reverse_isearch
    set -l cmd "history --null"

    set -l result (__fzf_zen_execute "$cmd" --read0 --print0 | string trim -c \0)

    if test -n "$result"
        commandline -- $result
        commandline -f repaint
    end
end
