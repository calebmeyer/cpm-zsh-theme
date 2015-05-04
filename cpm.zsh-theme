autoload -U colors && colors

local rvm='%{$FG[196]%}$(rvm-prompt i v g)%{$reset_color%}'

local python='%{$FG[081]%}python-$(python -c "import sys; print(\".\".join(map(str, sys.version_info[:3])))")%{$reset_color%}'

local pwd='%{$fg_bold[green]%}%p%{$fg[blue]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

local time="%{$fg[white]%}%{$fg[yellow]%}%T%{$fg[white]%}%{$reset_color%}"

local ruby="%{$fg[white]%}[%{$fg[magenta]%}\$(rvm-prompt i v g)%{$fg[white]%}]%{$reset_color%}"

local git_commit_hash="%{$FG[055]%}$(git log -1 --pretty=oneline | cut -c -8)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT="%{$fg[white]%}[${time}|${pwd}%{$fg[white]%}]%{$reset_color%} ${git_commit_hash}
%{$fg[red]%}$ "

RPROMPT="${rvm} ${python}"
