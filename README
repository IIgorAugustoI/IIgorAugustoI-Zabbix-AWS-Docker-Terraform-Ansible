# Infraestrutura como código utilizando Terraform - Ansible - Docker - Zabbix - AWS

#### Este projeto visa facilitar a criação do ambiente de monitoramento Zabbix na AWS utilizando o EC2.

### Pré-requisitos:

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli);
- [Configuração do AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html);
- [Gerar chave de acesso SSH](https://www.ssh.com/academy/ssh/keygen).

---

### Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Terraform](https://www.terraform.io/);
- [Ansible](https://www.ansible.com/);
- [AWS EC2](https://aws.amazon.com/ec2).

---

### 🛠 Ferramentas construídas com o projeto:

- [Docker](https://www.docker.com/);
- [Grafana](https://grafana.com/);
- [PostgreSQL](https://www.postgresql.org/);
- [Zabbix](https://www.zabbix.com/).

---

#### Preparando ambiente:

Lembre-se de alterar os campos em env/Prod/main.tf. Neste arquivo, encontra-se o `ID da imagem AWS` (A ID da imagem muda de acordo com a região), a `região` que será construído a infraestrutura, o nome da `chave` ssh, o tipo da `instância` e o `nome da aplicação`.

---

#### Rodando o projeto

```bash
# Inicilizando terraform na pasta `infra` e env/Prod
$ cd infra
$ terraform init
$ cd ../env/Prod
$ terrform init

# < Diretório atual `env/Prod` >
# Verificação de configurações a serem realizadas pelo terraform
$ terraform plan

# Execução do projeto
$ terraform apply
```

---

### ATENÇÃO!

> É necessário fazer os passos do pré-requisito listado acima, principalmente o AWS CLI.

---

> Você pode gerar a Chave SSH via painel EC2 na AWS e importar na pasta do projeto.

### :cherries: Extras:

---

#### :whale: Projeto Docker Swarm | Docker Compose com Zabbix

- [Arquivos no GitHub](https://github.com/IIgorAugustoI/zabbix-docker.git)
