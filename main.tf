resource "aws_lambda_function" "test_lambda" {
  function_name = "${var.function_name}"
  role          = "${var.role}"
  handler       = "${var.handler}"
  memory_size   = "${var.memory_size}"
  description   = "${var.description}"
  timeout       = "${var.timeout}"
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"

    # The filebase64sha256() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
    # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 
  source_code_hash   = "${var.source_code_hash}"
  runtime            = "${var.runtime}"
  environment        {
    variables = "${var.variables}"
  }
  vpc_config         = "${var.vpc_config}"
  tracing_config     {
    mode = "${var.mode}"
  }
  dead_letter_config = "${var.dead_letter_config}" 
}
