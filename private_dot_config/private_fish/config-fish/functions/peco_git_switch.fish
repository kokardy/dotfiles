function peco_git_switch
  switch $argv[1]
    case '-p'
      echo "pull req mode"
      git fetch
      gh pr list -s all --search "is:open is:pr sort:created-asc" --json number,title,headRefName |
        jq -r '.[] | "[#" + (.number|tostring) + "] " + .title + " " + .headRefName' |
        peco |
        awk '{print $NF}' |
        xargs git switch

    case '*'
      git branch -a --sort=-authordate |
        grep -v -e '->' -e '*' |
        perl -pe 's/^\h+//g' |
        perl -pe 's#^remotes/origin/##' |
        perl -nle 'print if !$c{$_}++' |
        peco |
        xargs git switch
  end
end
