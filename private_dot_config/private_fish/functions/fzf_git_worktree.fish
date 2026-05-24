function fzf_git_worktree
    set worktree (git worktree list | fzf \
        --preview "ls -la (echo {} | awk '{print \$1}')" \
        --preview-window=right:50% \
        --height=40% \
        --reverse \
        --prompt="worktree> " \
        | awk '{print $1}')
    if test -n "$worktree"
        cd $worktree
    end
end
