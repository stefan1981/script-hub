
alias vim="nvim"


# Kubernetes

# cheat-cheat
xx-cheat() {
    clear; echo "----------------------------------------------"
    curl cht.sh/$1 | less
}

# push changes in config
xx-config-push() {
  cd ~/script-hub
  git add .
  git commit -m "Changes in config $(date)"
  git push
  git status
  cd -
}

alias xx-zshrc='nvim ~/.zshrc'
alias xx-source='source ~/.zshrc'
alias xx-alias='nvim ~/script-hub/bash-aliases/aliases.sh'

xx-test() {
  echo "hallo"
}


db_name="bistack"

xx-sql-k8-maria() {
  ip=$(kubectl get service/mariadb -n bi-solution -o jsonpath='{.spec.clusterIP}')
  if [ -z "$1" ]; then mariadb -h $ip -u root -D $db_name -A -p$BI_PWD; fi
  if [ "$1" ]; then mariadb -h $ip -u root -D $db_name -p$BI_PWD -sN < $1; fi
}

xx-sql-k8-clickhouse() {
  ip=$(kubectl get service/clickhouse -n bi-solution -o jsonpath='{.spec.clusterIP}')
  if [ -z "$1" ]; then mariadb -P 9004 -h $ip -u root -D $db_name -A -p$BI_PWD; fi
  if [ "$1" ]; then mariadb -P 9004 -h $ip -u root -D $db_name -p$BI_PWD < $1; fi
}

xx-sql-docker-maria() {
  ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ppbi-mcs)
  if [ -z "$1" ]; then mariadb -h $ip -u admin -A -D $db_name -p$BI_PWD; fi
  if [ "$1" ]; then mariadb -h $ip -u admin -p$BI_PWD -D $db_name -sN < $1; fi
}

xx-sql-docker-clickhouse() {
  ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ppbi-clickhouse)
  if [ -z "$1" ]; then mariadb -P 9004 -h $ip -u admin -D $db_name -A -p$BI_PWD; fi
  if [ "$1" ]; then mariadb -P 9004 -h $ip -u admin -D $db_name -p$BI_PWD < $1; fi
}
##


alias ch="mariadb -P 9004 -h $(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ppbi-clickhouse) -u admin -D test -pStart12345+X123"

alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'
alias watch='watch -n 1 -c '
alias kshow='watch -n 1 /bin/bash ~/script-hub/k8/show-ressources-from-current-namespace.sh'
alias kresources='kubectl resource-capacity'

