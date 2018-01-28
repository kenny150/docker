#!/bin/bash -x

exec_command=$(cd /root/docker ; docker-compose up -d)
container=$(docker ps | grep "docker-registry.local" | awk -F '/' '{print $2}' | cut -d " " -f1)
  if [[ -z "$container" ]]; then
    echo "Container Parado"
    echo "Iniciando os containers"
    $exec_command
      else
        echo -e "Containers em execução:\n\n$container\n"
  fi

