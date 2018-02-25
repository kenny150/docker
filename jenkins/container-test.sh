#!/bin/bash

# Construa a imagem a ser usada neste job
IMAGE=$(sudo docker build . | tail -1 | awk '{ print $NF }' )

# Monte o diretório a ser usado na construção da imagem
MNT="$WORKSPACE/"

#Execute a construção através do Docker
#CONTAINER=$(sudo docker run -d -v $MNT:/autoseg/var/www/sso $IMAGE /bin/bash -c 'cd /autoseg/var/www/sso ')
CONTAINER=$(sudo docker run -d -v $MNT:/autoseg/var/www/sso/public $IMAGE)

# Agarrar ao container 
#sudo docker attach $CONTAINER
sudo docker exec $CONTAINER /bin/bash -c 'cd /autoseg/var/www/sso/public'

# Pegar o código de saída ao sinal de parada do container
RC=$(sudo docker wait $CONTAINER)

# Deletar o container criado agora
sudo docker rm $CONTAINER

# Sair do container
exit $RC
