function ghq-cd
    set repo (ghq list | fzf \
        --preview "ls -la (ghq root)/{}" \
        --preview-window=right:40% \
        --height=40% \
        --reverse \
        --prompt="repo> ")
    if test -n "$repo"
        cd (ghq root)/$repo
    end
end
