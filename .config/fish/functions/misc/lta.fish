function lta --description "Tree view using eza with -a flag, optional level argument"
    if test -n "$argv[1]"
        eza -Tla --git --git-ignore --icons --group-directories-first --level=$argv[1]
    else
        eza -Tla --git --git-ignore --icons --group-directories-first
    end
end
