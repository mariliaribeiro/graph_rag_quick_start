# graph_rag_quick_start
A ideia desse repositório é seguir um tutoriais de GraphRAG para aprendizado



# Dependências
## Instalar Docker

Instalação do docker https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

### Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

### Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Instalar Mongosh
https://www.mongodb.com/pt-br/docs/mongodb-shell/install/

## Instalar mongo pelo docker
https://www.mongodb.com/pt-br/docs/manual/tutorial/install-mongodb-community-with-docker/

docker pull mongodb/mongodb-community-server:latest

sudo docker-compose up -d
sudo docker ps

