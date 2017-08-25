export EDITOR=vim
source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle debian
antigen bundle command-not-found
antigen bundle python
antigen bundle github
antigen bundle git-extras
antigen bundle docker
antigen bundle tmux
antigen bundle node
antigen bundle npm
antigen bundle systemd
antigen bundle gulp
antigen bundle bower

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme juanghurtado
antigen apply

ssh-add -l |grep 'SHA256:KKhiTnGcJbRirZAltgrvv1zu/cnwuOEmgA5r7Nl1qaA' >/dev/null
if [[ $? != 0 && -f ~/.ssh/pchaussalet.pem ]]; then
    ssh-add ~/.ssh/pchaussalet.pem
fi

if which tmux >/dev/null 2>&1; then
	if [[ -z "$TMUX" ]] ;then
		ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
		if [[ -z "$ID" ]] ;then # if not available create a new one
			tmux new-session
		else
			tmux attach-session -t "$ID" # if available attach to it
		fi
	fi
fi

alias mail_read='tmux source-file ~/mail_read.tmux'
eval "$(chef shell-init zsh)"

# OPAM configuration
. /home/pchaussalet/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
