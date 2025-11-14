# AWS DevOps Journey

![GitHub repo size](https://img.shields.io/github/repo-size/ibrahimbakayoko/aws-devops-journey)
![GitHub last commit](https://img.shields.io/github/last-commit/ibrahimbakayoko/aws-devops-journey)
![GitHub issues](https://img.shields.io/github/issues/ibrahimbakayoko/aws-devops-journey)
![GitHub stars](https://img.shields.io/github/stars/ibrahimbakayoko/aws-devops-journey?style=social)

Ce projet open-source documente la mise en place d'une infrastructure DevOps complète sur AWS, en appliquant les bonnes pratiques **IaC**, **GitOps** et **CI/CD**.

---

<div align="center">
  <img src="./docs/devopsjourney.png" alt="AWS DevOps Journey Architecture" style="max-width:800px; height:auto; border-radius:8px;"/>
</div>

---

## 📦 Stack utilisée
- **Terraform** : Provisioning automatisé des ressources AWS (VPC, EC2, IAM, S3)  
- **Ansible** : Configuration et automatisation des serveurs  
- **Kubernetes (K3s/K3d)** : Déploiement applicatif futur  
- **GitHub Actions** : Pipelines CI/CD pour build, tests et déploiement  
- **Prometheus / Grafana** : Monitoring et observabilité  
- **Trivy** : Scans de sécurité pour images Docker  

---

## 🔗 Suivi et code
- Dépôt principal : [aws-devops-journey](https://github.com/ibrahimbakayoko/aws-devops-journey)  
- Code structuré semaine par semaine, dans branches ou sous-dossiers.  

---

## 📍 Étape actuelle
- ✅ Provisioning AWS via Terraform 

---

## 📌 Objectifs à venir
- Déploiement d’un cluster Kubernetes (K3s sur EC2)  
- Monitoring complet : Prometheus, Grafana  
- CI/CD complet via GitHub Actions  
- Standardisation des environnements dev/test/prod  

---

## 🎯 Résultats attendus
Ce projet permet de construire une **stack DevOps entièrement automatisée et reproductible**, d’industrialiser les déploiements via Terraform, Helm et CI/CD, d’améliorer la sécurité et l’observabilité, et de standardiser les environnements pour assurer des releases fiables et cohérentes.

---

## 📂 Documentation & Code
- GitHub : [aws-devops-journey](https://github.com/ibrahimbakayoko/aws-devops-journey)  
- Documentation semaine par semaine disponible dans les branches et sous-dossiers du projet.
