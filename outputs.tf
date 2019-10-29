output "secret" {
  description = "Generated secret"
  value       = random_string.random_string.result
}

output "secret_arn" {
  description = "The ARN of the secret"
  value       = aws_secretsmanager_secret.secret.arn
}

