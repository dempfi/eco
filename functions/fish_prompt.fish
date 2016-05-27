function fish_prompt
    set -l status_copy $status
    set -l status_color white
    set -l cwd (echo "$PWD" | sed -E "
        s|.+/(.+)/(.+)|\1/\2|
        s|$HOME||
        s|$USER/||
    ")
    set -l cwd_dir (dirname $cwd)
    set -l cwd_base (basename $cwd)

    if test "$cwd_dir" = . -o "$cwd_dir" = /
        set -e cwd_dir
    else
        set cwd_dir (set_color white)"$cwd_dir "(set_color normal)
    end

    set -l branch_name
    set -l branch_color black -b white

    if set branch_name (git_branch_name)
        set -l git_remote_status
        set -l git_status

        if git_is_staged
            if git_is_dirty
                set git_status "± "
            else
                set git_status "+ "
            end
        else if git_is_dirty
            set git_status "╍ "
        end

        if git_is_detached_head
            set branch_color black -b f00
        end

        set -l git_right_status (
            command git rev-list --left-right --count 'HEAD...@{upstream}' ^ /dev/null | awk '
                $1 > 0 { printf "∧" }
                $2 > 0 { printf "∨" }
        ')

        if git_is_stashed
            set git_right_status "⟀$git_right_status"
        end

        set branch_name "$git_status"(set_color $branch_color)" $branch_name$git_remote_status "(
            set_color normal)

        if test ! -z "$git_right_status"
            set branch_name "$branch_name $git_right_status"
        end
    end

    if test "$status_copy" -ne 0
        set status_color f00
    end

    printf "$cwd_dir"

    if test ! -z "$branch_name"
        printf "$branch_name "
    end

    if test ! -z "$cwd_base"
        printf (set_color white)"$cwd_base "(set_color normal)
    end

    printf (set_color $status_color)"→ "(set_color normal)
end
