resource "aws_lambda_function" "lambda_function" {
  function_name                  = var.function_name
  layers                         = var.layers
  role                           = var.role
  handler                        = var.handler
  memory_size                    = var.memory_size
  description                    = var.description
  timeout                        = var.timeout
  s3_bucket                      = var.s3_bucket
  s3_key                         = var.s3_key
  s3_object_version              = var.s3_object_version
  reserved_concurrent_executions = var.reserved_concurrent_executions

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"

  source_code_hash = var.source_code_hash
  runtime          = var.runtime

### Env Lambas
  dynamic "environment" {
      for_each = var.environment == null ? [] : [var.environment]
      content {
        variables = environment.value.variables
      }
    }

####vpc Config

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
  tracing_config {
    mode = var.mode
  }
  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      target_arn = dead_letter_config.value.target_arn
    }
  }

  lifecycle {
    ignore_changes = [last_modified]
  }
}

