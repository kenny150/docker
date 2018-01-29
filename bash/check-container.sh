#!/bin/bash -x

docker_home='/etc/docker/docker-config/docker'
container=$(docker ps | grep "docker-registry.local" | awk -F '/' '{print $2}' | cut -d " " -f1)
  if [[ -z "$container" ]]; then
    echo "Container Parado"
    echo "Iniciando os containers"
    $( cd "$docker_home" && /usr/local/bin/docker-compose up -d)
        if [[ $? -eq '0' ]]; then
        echo "Iniciado com sucesso"
        container_check=$(docker ps | grep "docker-registry.local" | awk -F '/' '{print $2}' | cut -d " " -f1)
        echo -e "$container_check"
        else "Não iniciado"
      fi
      else
        echo -e "Containers em execução:\n\n$container\n"
  fi
