function __fzf_zen_find_file
    set -l cmd "rg --files --hidden --glob '!.git'"
    set -l preview_cmd "bat --style=numbers --color=always --line-range :500 {}"

    set -l result (__fzf_zen_execute "$cmd" --preview="'$preview_cmd'" --multi --preview-window=$FZF_ZEN_PREVIEW_WINDOW)

    if test -n "$result"
        commandline -i (string escape $result)
        commandline -f repaint
    end
end
