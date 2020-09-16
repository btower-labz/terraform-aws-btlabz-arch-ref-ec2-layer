resource "random_password" "database" {
  length           = 16
  upper            = true
  lower            = true
  number           = true
  special          = true
  override_special = "_%@"
}

resource "aws_secretsmanager_secret" "database" {
  name                    = "/dev/database"
  description             = "Sample secret for use with instances"
  recovery_window_in_days = 0
  tags = merge(
    map(
      "Name", "database"
    ),
    var.tags
  )
}

resource "aws_secretsmanager_secret_version" "database" {
  secret_id     = aws_secretsmanager_secret.database.id
  secret_string = random_password.database.result
}

resource "aws_ssm_parameter" "api_url" {
  name        = "/dev/api-url"
  type        = "String"
  value       = "https://git.emirates.com"
  description = "Sample API URL"
  tier        = "Standard"
  overwrite   = true
  data_type   = "text"
  tags = merge(
    map(
      "Name", "api-url"
    ),
    var.tags
  )
}

resource "random_password" "api_key" {
  length           = 16
  upper            = true
  lower            = true
  number           = true
  special          = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "api_key" {
  name        = "/dev/api-key"
  type        = "SecureString"
  value       = random_password.api_key.result
  description = "Sample API key"
  tier        = "Standard"
  overwrite   = true
  data_type   = "text"
  lifecycle {
    ignore_changes = [
      value
    ]
  }
  tags = merge(
    map(
      "Name", "api-key"
    ),
    var.tags
  )
}
