output "secret" {
  description = "Generated secret"
  value       = var.create_secret ? random_password.random_string[0].result : ""
}

output "secret_arn" {
  description = "The ARN of the secret"
  value       = var.create_secret ? aws_secretsmanager_secret.secret[0].arn : ""
}
