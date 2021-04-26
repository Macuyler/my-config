if [[ "$1" != "" ]]; then
	HOST_COLOR="$1"
else
	HOST_COLOR='white'
fi
git_prompt() {
	gitmux -cfg ~/.gitmux.conf $pwd | format-branch
}
setopt prompt_subst
export RPROMPT='%F{cyan}%1~$(git_prompt)%f '
export PROMPT=" %F{$HOST_COLOR}%M%f %# "
