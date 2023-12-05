# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/antigen.zsh"
#export WORKON_HOME="$HOME/.virtualenvs"
# source /usr/local/bin/virtualenvwrapper.sh

#source "$HOME/.homesick/repos/homeshick/homeshick.sh"
#fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle git
# antigen bundle virtualenvwrapper
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle mollifier/cd-gitroot

# load this plugin
#antigen bundle superbrothers/zsh-kubectl-prompt

# antigen theme avit 
# antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme romkatv/powerlevel10k 
antigen apply
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=990000
SAVEHIST=990000
bindkey -e
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit colors; colors
compinit

#alias gpff='git pull --ff-only origin master'
#alias gprb='git pull --rebase origin master'
#alias gprbi='git pull --rebase=interactive origin master'
#alias cdu='cd-gitroot'
#alias pchk='export ORIGPWD=$(pwd); cdmain; make staticcheck && make static-tests-other && make static-tests-frontend && make vendorcheck && echo "All OK!"; cd $ORIGPWD'

export VISUAL=vim
export EDITOR="$VISUAL"
 #End of lines added by compinstall

#export PATH="$PATH:~/bin/GoLand-2018.2.1:~/bin:~/anaconda3/bin"

#source ~/vbaseenv/bin/activate
#source ~/vbaseenv/bin/aws_zsh_completer.sh

# pinata-ssh-forward
#export AWS_PROFILE=jazz-dev
#export AWS_DEFAULT_REGION=eu-west-1
#export GOOGLE_IDP_ID=C045psz27
#export GOOGLE_SP_ID=89191966110

#alias aws-development='unset AWS_PROFILE; aws-google-auth -p aws-dev; export AWS_PROFILE=aws-dev'
#source ~/.sourceme

#source ~/vbaseenv/bin/aws_zsh_completer.sh

# if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cmpoon/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cmpoon/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cmpoon/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cmpoon/bin/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Completion for kitty
#kitty + complete setup zsh | source /dev/stdin
# RPROMPT="$RPROMPT %{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%} [%D{%y-%m-%f}|%*]"

# RPROMPT="%{$fg[blue]%}[%*]%{$reset_color%} $RPROMPT"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

