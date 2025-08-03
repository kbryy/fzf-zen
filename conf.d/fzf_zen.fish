# fzf-zen: Zen-like centered FZF popup plugin for Fish shell

# argv[1]:
# | popup_size
# | preview_window
# | colors
# | common_options
# | popup_options
# @return string
function __fzf_zen_get_default_config
    switch $argv[1]
        case popup_size
            echo "70%,75%"
        case preview_window
            echo "right:60%"
        case colors
            echo "border:cyan," \
                "fg:white," \
                "fg+:bright-green," \
                "hl:magenta," \
                "hl+:bright-blue," \
                "bg+:black," \
                "pointer:red," \
                "prompt:bright-cyan," \
                "info:yellow," \
                "header:bright-green"
        case common_options
            echo --ansi \
                "--color=$FZF_ZEN_COLORS" \
                "--border=rounded" \
                "--marker ▏" \
                "--pointer ▌" \
                "--prompt ▌" \
                "--layout=reverse"
        case popup_options
            echo "fzf-tmux -p $FZF_ZEN_POPUP_SIZE -x C -y C"
    end
end

function __fzf_zen_configure
    set -q FZF_ZEN_POPUP_SIZE; or set -g FZF_ZEN_POPUP_SIZE (__fzf_zen_get_default_config popup_size)
    set -q FZF_ZEN_PREVIEW_WINDOW; or set -g FZF_ZEN_PREVIEW_WINDOW (__fzf_zen_get_default_config preview_window)
    set -q FZF_ZEN_COLORS; or set -g FZF_ZEN_COLORS (__fzf_zen_get_default_config colors)
end

# argv: command_names
# @return string
function __fzf_zen_get_missing
    set -l missing_deps
    for cmd in $argv
        not type -q $cmd; and set -a missing_deps $cmd
    end
    if test (count $missing_deps) -gt 0
        echo $missing_deps
    end
end

# argv: missing_command_names
# @return boolean
function __fzf_zen_show_missing_error
    echo "fzf-zen: Missing required dependencies: $argv"
    echo "Please install them before using this plugin."
    return 1
end

# argv[1]: boolean (ghq available)
function __fzf_zen_setup_bindings
    bind \co __fzf_zen_find_file
    bind \cr __fzf_zen_reverse_isearch
    bind \ct __fzf_zen_cd

    test $argv[1] -eq 0; and bind \cg __fzf_zen_ghq_search

    # Vi mode support
    switch $fish_key_bindings
        case fish_vi_key_bindings fish_hybrid_key_bindings
            for mode in insert default visual
                bind -M $mode \co __fzf_zen_find_file
                bind -M $mode \cr __fzf_zen_reverse_isearch
                bind -M $mode \ct __fzf_zen_cd

                test $argv[1] -eq 0; and bind -M $mode \cg __fzf_zen_ghq_search
            end
    end
end

function __fzf_zen_initialize
    # 1. Configure settings
    __fzf_zen_configure

    # 2. Check required dependencies
    set -l missing (__fzf_zen_get_missing fzf fzf-tmux rg bat tree)
    if test (count $missing) -gt 0
        __fzf_zen_show_missing_error $missing
        return 1
    end

    # 3. Check optional dependencies and setup bindings
    set -l ghq_missing (__fzf_zen_get_missing ghq)
    set -l ghq_available (test (count $ghq_missing) -eq 0; echo $status)
    __fzf_zen_setup_bindings $ghq_available
end

# Initialize fzf-zen
__fzf_zen_initialize
