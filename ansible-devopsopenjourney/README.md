# 🚀 Ansible DevOps Journey - Provisioning EC2 avec Docker, K3s & GitLab Runner

![Ansible](https://img.shields.io/badge/ansible-automated-informational?logo=ansible)
![Ubuntu](https://img.shields.io/badge/platform-ubuntu-green)
![AWS EC2](https://img.shields.io/badge/cloud-AWS%20EC2-orange)

Ce dépôt Ansible permet de configurer automatiquement une instance EC2 Ubuntu sur AWS avec l'installation de :

- [x] Docker
- [x] K3s (Kubernetes léger)
- [x] GitLab Runner auto-hébergé
- [x] Sécurisation de l'accès via UFW (Firewall)

---

## 🧱 Objectif du projet

Automatiser l'installation d'un environnement DevOps minimal pour exécuter des pipelines GitLab CI/CD, déployer des applications Kubernetes et tester des projets personnels sur AWS Free Tier.

---

## 🧰 Prérequis

- Instance EC2 Ubuntu provisionnée (via Terraform ou manuellement)
- Clé privée `.pem` pour accès SSH
- Machine locale de gestion (Debian 11 recommandée) avec :
  - Python 3
  - pip
  - Ansible

---

## 🐍 Étape 1 : Préparer la machine locale (Debian)

```bash
sudo apt update
sudo apt install -y python3 python3-pip
pip install --user ansible
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
ansible --version
```
🔐 Étape 2 : Configuration de l'accès SSH
🎯 Objectif
Permettre à Ansible de se connecter à l'instance EC2 avec la clé .pem depuis la machine locale.

🛠️ Étapes
Transfert sécurisé de la clé privée depuis le poste local (macOS) vers Debian :

```bash
scp -i ~/.ssh/aws-devops-key.pem ~/.ssh/aws-devops-key.pem ibrahim@192.168.1.168:/home/ibrahim/.ssh/
```
Droits sur la clé privée :
```bash
chmod 400 /home/ibrahim/.ssh/aws-devops-key.pem
```
Connexion manuelle pour valider :

```bash
ssh -i /home/ibrahim/.ssh/aws-devops-key.pem ubuntu@<IP_PUBLIC_EC2>
```
📦 Étape 3 : Structure du dépôt
ansible-devopsopenjourney/
├── inventory.ini
├── playbook.yml
└── roles/
    ├── docker/
    ├── k3s/
    └── gitlab-runner/
        ├── tasks/
        └── templates/
🔁 Étape 4 : Créer les rôles Ansible
```bash
cd ansible-devopsopenjourney
ansible-galaxy init roles/docker
ansible-galaxy init roles/k3s
ansible-galaxy init roles/gitlab-runner
```
🗂️ inventory.ini
[aws_ec2]
ec2 ansible_host=<IP_PUBLIC_EC2> ansible_user=ubuntu ansible_ssh_private_key_file=/home/ibrahim/.ssh/aws-devops-key.pem
▶️ Étape 5 : Exécuter le playbook
```bash
ansible-playbook -i inventory.ini playbook.yml --private-key=/home/ibrahim/.ssh/aws-devops-key.pem --ask-become-pass
```
🧩 Services installés
🐳 Docker
Installation des paquets requis

Activation du service Docker

Ajout de l'utilisateur ubuntu au groupe docker

🐙 GitLab Runner
Ajout du dépôt GitLab officiel

Installation du service gitlab-runner

Démarrage et enregistrement automatique (si token fourni via vars ou vault)

Autorisation des ports nécessaires (22, 80, 443)

☸️ K3s
Installation via script officiel

Vérification de l'état du cluster :

```bash
sudo kubectl get nodes
```
🔐 Sécurisation avec UFW
```bash
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
```
✅ Résultat attendu
À la fin de l’exécution du playbook :

Docker fonctionne : docker ps

GitLab Runner est actif : gitlab-runner status

K3s est prêt : kubectl get nodes

L’accès SSH est sécurisé

Le tout est prêt à être utilisé dans un projet GitLab CI/CD

🧠 Difficultés rencontrées
Problème	Solution
Clé .pem introuvable ou non accessible	Copier manuellement avec scp, vérifier les permissions
Permission denied (publickey)	Mauvais chemin de clé ou mauvais utilisateur Ansible
k3s.service refusé au démarrage	Lancer avec sudo ou ajouter l’utilisateur au groupe sudo

