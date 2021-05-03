# ============================================================= #
# This script will configure a custom prompt for you. It allows #
# you to toggle on and off the user, host, and directory. You   #
# can also toggle between displaying each of these in the left  #
# or right prompts and set their own color.                     #
#                                                               #
# Options:                                                      #
#   -u:color   ~ Display the user on the left.                  #
#   -ur:color  ~ Display the user on the right.                 #
#   -h:color   ~ Display the hostname on the left.              #
#   -hr:color  ~ Display the hostname on the right.             #
#   -d:color   ~ Display the directory on the left.             #
#   -dr:color  ~ Display the directory on the right.            #
#   -db:color  ~ Display the directory and branch on the left.  #
#   -br:color  ~ Display the directory and branch on the right. #
#                                                               #
# Examples:                                                     #
#  1. (blue host on left, cyan dir and git on right):           #
#    % source ~/.prompt.zsh -h:blue -dbr:cyan                   #
#  2. (on the left magenta user, blue host, green dir):         #
#    % source ~/.prompt.zsh -u:magenta -h:blue -d:green         #
#                                                               #
# ============================================================= #

PROMPT_USER_COLOR='white'
PROMPT_HOST_COLOR='white'
PROMPT_DIR_COLOR='white'

SHOW_USER=""
SHOW_HOST=""
SHOW_DIR=""

OPTIONS=("-u" "-ur" "-h" "-hr" "-d" "-dr" "-db" "-dbr")

# Set config from arguments
for arg in "$@"
do
	a1=$(echo $arg | cut -d':' -f1)
	a2=$(echo $arg | cut -d':' -f2)
	if [[ $(printf '%s\n' "${OPTIONS[@]}" | grep -e '^'"$a1"'$') != "" ]]; then
		type="${a1:1:1}"
		# Toggle Prompt Elements
		if [[ "$type" = "u" ]]; then SHOW_USER="$a1" fi
		if [[ "$type" = "h" ]]; then SHOW_HOST="$a1" fi
		if [[ "$type" = "d" ]]; then SHOW_DIR="$a1" fi
		if [[ "$a1" != "$a2" ]]; then
			# Set Colors
			if [[ "$type" = "u" ]]; then PROMPT_USER_COLOR="$a2" fi
			if [[ "$type" = "h" ]]; then PROMPT_HOST_COLOR="$a2" fi
			if [[ "$type" = "d" ]]; then PROMPT_DIR_COLOR="$a2" fi
		fi
	fi
done

git_prompt() {
	gitmux -cfg ~/.gitmux.conf $pwd 2> /dev/null \
		| format-branch || echo "" 2> /dev/null
}

dir_prompt() {
	if [[
			"$SHOW_DIR" == "-d" && "$1" != "r" ||
			"$SHOW_DIR" == "-dr" && "$1" == "r"
	]]; then
		echo " %F{$PROMPT_DIR_COLOR}%1~%f"
	fi
	if [[
			"$SHOW_DIR" == "-db" && "$1" != "r" ||
			"$SHOW_DIR" == "-dbr" && "$1" == "r"
	]]; then
		echo " %F{$PROMPT_DIR_COLOR}%1~$(git_prompt)%f"
	fi
}

host_prompt() {
	if [[
			"$SHOW_HOST" == "-h" && "$1" != "r" ||
			"$SHOW_HOST" == "-hr" && "$1" == "r"
	]]; then
		echo " %F{$PROMPT_HOST_COLOR}%M%f"
	fi
}

user_prompt() {
	if [[
			"$SHOW_USER" == "-u" && "$1" != "r" ||
			"$SHOW_USER" == "-ur" && "$1" == "r"
	]]; then
		echo " %F{$PROMPT_USER_COLOR}%n%f"
	fi
}

setopt prompt_subst
export PROMPT='$(user_prompt)$(host_prompt)$(dir_prompt) %# '
export RPROMPT=' $(user_prompt "r")$(host_prompt r)$(dir_prompt r)'
