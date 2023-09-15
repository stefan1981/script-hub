


# Kubernetes
alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'
alias xx-watch='watch -n 1 -c '
alias kshow='watch -n 1 /bin/bash ~/script-hub/k8/show-ressources-from-current-namespace.sh'


# cheat-cheat
xx-cheat() {
    clear; echo "----------------------------------------------"
    curl cht.sh/$1 | less
}

# push changes in config
xx-alias-push() {
  cd ~/script-hub
  git add .
  read -p "Commit message [Changes in Config $(date)]: " commit_msg
  commit_msg=${commit_msg:-Changes in config $(date)}
  git commit -m "$commit_msg"
  git push
  git status
}

alias xx-zshrc='nvim ~/.zshrc'
alias xx-source='source ~/.zshrc'
alias xx-alias='nvim ~/script-hub/bash-aliases/aliases.sh'


