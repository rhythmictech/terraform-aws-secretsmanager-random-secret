locals {
  name_prefix = var.name == "" ? var.name_prefix : var.name
}

resource "aws_cloudwatch_log_metric_filter" "secret_access" {
  count          = var.enable_secret_access_notification ? 1 : 0
  name           = "${var.name_prefix}secret-access"
  log_group_name = var.cloudtrail_log_group
  pattern        = "{ $.eventName = \"GetSecretValue\" && $.requestParameters.secretId = \"${aws_secretsmanager_secret.secret.arn}\" }"

  metric_transformation {
    default_value = 0
    name          = "${local.name_prefix}SecretAccessed"
    namespace     = var.secret_access_metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_cloudtrail_calls" {
  count               = var.enable_secret_access_notification ? 1 : 0
  alarm_actions       = [var.secret_access_notification_arn]
  alarm_name          = "${local.name_prefix}secret-access"
  alarm_description   = "Monitor usage of secret: ${aws_secretsmanager_secret.secret.id}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${local.name_prefix}SecretAccessed"
  namespace           = var.secret_access_metric_namespace
  period              = 60
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}
