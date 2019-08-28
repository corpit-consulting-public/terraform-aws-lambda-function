resource "aws_lambda_function" "test_lambda_1" {
  count             = "${var.has_variables ? 1 : 0}"
  function_name     = "${var.function_name}"
  layers            = ["${var.layers}"]
  role              = "${var.role}"
  handler           = "${var.handler}"
  memory_size       = "${var.memory_size}"
  description       = "${var.description}"
  timeout           = "${var.timeout}"
  s3_bucket         = "${var.s3_bucket}"
  s3_key            = "${var.s3_key}"
  s3_object_version = "${var.s3_object_version}"

    # The filebase64sha256() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
    # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 
  source_code_hash   = "${var.source_code_hash}"
  runtime            = "${var.runtime}"
  environment        {
    variables = "${var.variables}"
  }
  vpc_config         {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }
  tracing_config     {
    mode = "${var.mode}"
  }
  dead_letter_config = "${var.dead_letter_config}" 
}


resource "aws_lambda_function" "test_lambda_2" {
  count             = "${var.has_variables ? 0 : 1}"
  function_name     = "${var.function_name}"
  layers            = "${var.layers}"
  role              = "${var.role}"
  handler           = "${var.handler}"
  memory_size       = "${var.memory_size}"
  description       = "${var.description}"
  timeout           = "${var.timeout}"
  s3_bucket         = "${var.s3_bucket}"
  s3_key            = "${var.s3_key}"
  s3_object_version = "${var.s3_object_version}"

    # The filebase64sha256() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
    # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 
  source_code_hash   = "${var.source_code_hash}"
  runtime            = "${var.runtime}"
  vpc_config         {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }
  tracing_config     {
    mode = "${var.mode}"
  }
  dead_letter_config = "${var.dead_letter_config}" 
}
