output "secret" {
  description = "Generated secret"
  value       = var.create_secret ? random_password.random_string[0].result : ""
  sensitive   = true
}

output "secret_arn" {
  description = "The ARN of the secret"
  value       = var.create_secret ? aws_secretsmanager_secret.secret[0].arn : ""
}

output "version_id" {
  description = "The unique identifier of the version of the secret."
  value       = var.create_secret ? aws_secretsmanager_secret_version.secret_val[0].version_id : ""
}
