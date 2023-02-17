# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{red}%b%f'

# Additional formats for vcs_info
# %s - current version control system (i.e. git or svn)
# %r - name of root directory of repository
# %S - current path relative to the repository root directory
# %b - branch information (i.e. main)
# %m - stash information
# %u - unstaged changes in the repository
# %c - staged changes in the repository
# %a - action string

# Prompt setup
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f%F{cyan}@%f%F{cyan}%m%f %F{magenta}%~%f %F{magenta}%#%f '
RPROMPT=\$vcs_info_msg_0_

# Set pyenv shims to initialize
alias brew='env PATH="${PATH//$(pyenv root)/shims:/}" brew'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Export
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
source /Users/wlfd/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
