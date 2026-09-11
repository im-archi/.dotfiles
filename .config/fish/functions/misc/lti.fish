function lti --description "Tree view using eza with -a flag and interactive output, optional level argument"
    if test -n "$argv[1]"
        eza -Tla --color=always --git --git-ignore --icons --group-directories-first --level=$argv[1] | bat -p --paging=always
    else
        eza -Tla --color=always --git --git-ignore --icons --group-directories-first | bat -p --paging=always
    end
end
