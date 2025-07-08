output "instance_public_ip" {
  description = "Adresse IP publique de l'instance EC2"
  value       = aws_instance.devops_instance.public_ip
}

output "bucket_name" {
  description = "Nom du bucket S3 créé"
  value       = aws_s3_bucket.project_bucket.bucket
}
