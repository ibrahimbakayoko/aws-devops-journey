# 🌍 DevOps Open Journey - Infrastructure AWS avec Terraform

Bienvenue dans mon projet **#DevOpsOpenJourney** : une aventure DevOps en public (Build In Public) pour automatiser, déployer et monitorer des applications sur AWS avec les outils de l’écosystème DevOps.

Ce dépôt contient le code Terraform permettant de provisionner une **infrastructure cloud de base** sur AWS.

---

## 📦 Infrastructure déployée

- ✅ VPC privé
- ✅ Sous-réseau public
- ✅ Internet Gateway + Table de routage
- ✅ Instance EC2 (Ubuntu 22.04 LTS)
- ✅ Groupe de sécurité restrictif (SSH uniquement depuis ton IP)
- ✅ Bucket S3 avec nom unique
- ✅ Outputs utiles (IP publique EC2, nom du bucket)

---

## 🧱 Architecture simplifiée

Internet ──> IGW ──> Subnet Public ──> EC2 Ubuntu
↘ SG (SSH depuis IP)
↘ S3 Bucket (via Terraform)

yaml
Copier
Modifier

---

## ⚙️ Prérequis

- Compte AWS actif
- AWS CLI configuré (`aws configure`)
- Terraform ≥ 1.3
- Clé SSH existante dans AWS EC2 (dans `AWS > EC2 > Key Pairs`)

---

## 🚀 Déploiement

1. **Cloner le dépôt**
```bash
git clone https://github.com/ton-utilisateur/ton-repo-terraform.git
cd ton-repo-terraform
```
Créer votre fichier terraform.tfvars à partir du modèle :

```bash
cp terraform.tfvars.example terraform.
```
Exemple de contenu :
project_name = "devops-open-journey"
key_name     = "ma-cle-ssh-aws"
Initialiser Terraform

```bash
terraform init
```
Vérifier le plan

```bash
terraform plan
```
Déployer l’infrastructure

```bash
terraform apply
```
Récupérer l’IP publique de l’instance EC2

```bash
terraform output instance_public_ip
```
🛑 Nettoyer l’infra
```bash
terraform destroy
```
✅ Bonnes pratiques appliquées
Variables externalisées (.tfvars)

Pas de secrets dans le code

Modules réutilisables en préparation

.gitignore configuré

Fichier terraform.tfvars.example fourni

Documentation progressive dans ce dépôt

