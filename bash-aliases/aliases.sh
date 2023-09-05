


# Kubernetes
alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'
alias watch='watch -n 1 -c '
alias kshow='watch -n 1 /bin/bash ~/script-hub/k8/show-ressources-from-current-namespace.sh'
