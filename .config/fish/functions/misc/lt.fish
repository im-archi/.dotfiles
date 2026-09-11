function lt --description "Tree view using eza, optional level argument"
    if test -n "$argv[1]"
        eza -T --git --git-ignore --icons --group-directories-first --level=$argv[1]
    else
        eza -T --git --git-ignore --icons --group-directories-first
    end
end
