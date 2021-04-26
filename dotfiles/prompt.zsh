# Set Host Color
if [[ "$1" != "" ]]; then
	PROMPT_HOST_COLOR="$1"
else
	PROMPT_HOST_COLOR='white'
fi
# Set Directory Color
if [[ "$2" != "" ]]; then
	PROMPT_DIR_COLOR="$2"
else
	PROMPT_DIR_COLOR='white'
fi
# Get the branch of the current dir
git_prompt() {
	gitmux -cfg ~/.gitmux.conf $pwd | format-branch
}
setopt prompt_subst
export RPROMPT='%F{'"$PROMPT_DIR_COLOR"'}%1~$(git_prompt)%f '
export PROMPT=" %F{$PROMPT_HOST_COLOR}%M%f %# "
