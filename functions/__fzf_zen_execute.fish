function __fzf_zen_execute
    set -l input_cmd $argv[1]
    set -l fzf_options $argv[2..-1]
    set -l popup_cmd (__fzf_zen_get_default_config popup_options)
    set -l common_opts (__fzf_zen_get_default_config common_options)

    if test -n "$input_cmd"
        eval $input_cmd | eval $popup_cmd $common_opts $fzf_options
    else
        eval $popup_cmd $common_opts $fzf_options
    end
end
