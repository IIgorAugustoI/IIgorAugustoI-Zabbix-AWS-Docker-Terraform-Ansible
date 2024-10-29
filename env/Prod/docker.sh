#!/bin/bash
cd /home/ubuntu
sudo apt update
sudo apt install python3-pip -y
sudo python3 -m pip install ansible --break-system-packages  
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
tee -a playbook.yml > /dev/null <<EOF
---
- hosts: localhost
  tasks:
    - name: Install Docker
      ansible.builtin.apt:
        pkg:
          - docker-ce
          - docker-ce-cli
          - containerd.io
          - docker-buildx-plugin
          - docker-compose-plugin
        update_cache: yes
      become: true
    - name: Create a directory if it does not exist
      ansible.builtin.file:
        path: /home/ubuntu/app
        state: directory
    - name: Baixando os arquivos do projeto
      ansible.builtin.git:
        repo: https://github.com/IIgorAugustoI/zabbix-docker.git
        dest: /home/ubuntu/app
        version: main
        force: true
    - name: Adicionando arquivos de senhas
      ansible.builtin.shell: |
        echo "zabbix" > /home/ubuntu/app/keys/name_db.txt
        echo "zabbix" > /home/ubuntu/app/keys/passwd_db.txt
        echo "zabbix" > /home/ubuntu/app/keys/user_db.txt
        echo "zabbix" > /home/ubuntu/app/keys/user_gf.txt
        echo "zabbix" > /home/ubuntu/app/keys/passwd_gf.txt
      become: true
    - name: execute docker
      ansible.builtin.shell: | 
        cd /home/ubuntu/app
        docker compose up -d
      become: true
EOF
ansible-playbook playbook.yml 