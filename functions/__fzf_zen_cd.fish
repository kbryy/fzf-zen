function __fzf_zen_cd
    set -l cmd "find . -type d -name '.git' -prune -o -type d -print 2>/dev/null | sed 's|^\./||'"
    set -l preview_cmd "tree -C -L 2 -I 'node_modules' {}"

    set -l result (__fzf_zen_execute "$cmd" --preview="'$preview_cmd'" --preview-window=$FZF_ZEN_PREVIEW_WINDOW)

    if test -n "$result"
        cd $result
        commandline -f repaint
    end
end
