autoload -U colors && colors

git_commit_hash() {
  if [ -d .git ]; then
    git log -1 --pretty=oneline | cut -c -8
  fi
}

function ruby_version() {
  if which rvm-prompt &> /dev/null; then
    rvm-prompt i v g
  else
    if which rbenv &> /dev/null; then
      rbenv version | sed -e "s/ (set.*$//"
    fi
  fi
}

# Thanks open source!
_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

local ruby='%{$FG[196]%}$(ruby_version)%{$reset_color%}'

local python='%{$FG[081]%}python-$(python -c "import sys; print(\".\".join(map(str, sys.version_info[:3])))")%{$reset_color%}'

local pwd='%{$fg[blue]%}$(_fishy_collapsed_wd) %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

local time="%{$fg[white]%}%{$fg[yellow]%}%T%{$fg[white]%}%{$reset_color%}"

local commit_hash="%{$FG[055]%}$(git_commit_hash)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT="%{$fg[white]%}[${time}|${pwd}%{$fg[white]%}]%{$reset_color%} ${commit_hash}
%{$fg[red]%}$ "

RPROMPT="${ruby} ${python}"
