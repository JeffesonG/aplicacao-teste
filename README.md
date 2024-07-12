# Projeto de Aplicação Spring Boot e Vue.js

Este repositório contém a configuração de um projeto que inclui uma aplicação back-end desenvolvida em Spring Boot e uma aplicação front-end desenvolvida em Vue.js. O projeto utiliza Docker e Docker Compose para facilitar a construção e execução dos contêineres.

## Requisitos

Para executar este projeto, você precisa ter os seguintes softwares instalados:

- Node.js 16
- Java 22
- Make
- Docker
- Docker Compose

## Primeiros Passos

Antes de executar o projeto, é necessário instalar as dependências do front-end e do back-end. Para isso, utilize o comando `make install`.

### Instalação das Dependências

Execute o seguinte comando para instalar as dependências:

`$ make install`

### Execução do projeto

Execute o seguinte comando para executar o projeto:

`$ make up`

### Parar do projeto

Execute o seguinte comando para parar o projeto:

`$ make down`

# Pipeline de Construção e Publicação de Imagens Docker

Este repositório contém uma configuração de GitHub Actions para construir e publicar imagens Docker para aplicações Spring Boot (back-end) e Vue.js (front-end).

## Descrição da Pipeline

A pipeline é ativada em pushs para a branch `master` e é composta por dois jobs: `build-back` e `build-front`.

### Job: build-back

Este job cuida da construção e publicação da imagem Docker para a aplicação Spring Boot.

#### Passos:
1. **Checkout do código**:
   Utiliza a ação `actions/checkout@v2` para fazer o checkout do código fonte.

2. **Configurar JDK 22**:
   Utiliza a ação `actions/setup-java@v3` para configurar o JDK 22.

3. **Construir a aplicação**:
   Executa comandos para empacotar e construir a aplicação Spring Boot.

4. **Construir a imagem Docker**:
   Constrói a imagem Docker para a aplicação Spring Boot.

5. **Executar o contêiner Docker para testes**:
   Executa a imagem Docker construída em um contêiner para testes.

6. **Aguardar a inicialização do contêiner**:
   Espera 20 segundos para garantir que a aplicação esteja totalmente inicializada.

7. **Login no Docker Hub**:
   Utiliza a ação `docker/login-action@v2` para autenticar no Docker Hub.

8. **Construir e publicar a imagem Docker**:
   Utiliza a ação `docker/build-push-action@v2` para construir e publicar a imagem Docker no Docker Hub.


### Job: build-front

Este job cuida da construção e publicação da imagem Docker para a aplicação Vue.js.

#### Passos:
1. **Checkout do código**:
   Utiliza a ação `actions/checkout@v2` para fazer o checkout do código fonte.

2. **Configurar Node.js**:
   Utiliza a ação `actions/setup-node@v2` para configurar o Node.js.

3. **Instalar dependências e construir a aplicação Vue.js**:
   Instala as dependências e constrói a aplicação Vue.js.

4. **Construir a imagem Docker**:
   Constrói a imagem Docker para a aplicação Vue.js.

5. **Executar o contêiner Docker para testes**:
   Executa a imagem Docker construída em um contêiner para testes.

6. **Aguardar a inicialização do contêiner**:
   Espera 20 segundos para garantir que a aplicação esteja totalmente inicializada.

7. **Testar se a aplicação está rodando**:
   Utiliza `curl --fail` para verificar se a aplicação está respondendo corretamente.

8. **Login no Docker Hub**:
   Utiliza a ação `docker/login-action@v2` para autenticar no Docker Hub.

9. **Construir e publicar a imagem Docker**:
   Utiliza a ação `docker/build-push-action@v2` para construir e publicar a imagem Docker no Docker Hub.

## Configuração dos Segredos

Para que a pipeline funcione corretamente, certifique-se de configurar os seguintes segredos no repositório do GitHub:

- `DOCKER_USERNAME`: Seu nome de usuário do Docker Hub.
- `DOCKER_PASSWORD`: Sua senha do Docker Hub.