function fzf_git_switch
    switch $argv[1]
        case '-p'
            git fetch
            set branch (gh pr list -s all --search "is:open is:pr sort:created-asc" --json number,title,headRefName |
                jq -r '.[] | "[#" + (.number|tostring) + "] " + .title + " " + .headRefName' |
                fzf \
                    --preview "echo {} | awk '{print \$NF}' | xargs git log --oneline --color=always -20" \
                    --preview-window=right:50% \
                    --height=40% \
                    --reverse \
                    --prompt="pr> " \
                | awk '{print $NF}')
            if test -n "$branch"
                git switch $branch
            end

        case '*'
            set branch (git branch -a --sort=-authordate |
                grep -v -e '->' -e '*' |
                perl -pe 's/^\h+//g' |
                perl -pe 's#^remotes/origin/##' |
                perl -nle 'print if !$c{$_}++' |
                fzf \
                    --preview "git log --oneline --color=always -20 {}" \
                    --preview-window=right:50% \
                    --height=40% \
                    --reverse \
                    --prompt="branch> ")
            if test -n "$branch"
                git switch $branch
            end
    end
end
