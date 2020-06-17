output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value = aws_lambda_function.lambda_function.arn
}

output "id" {
  description = "The Amazon Resource Name (ID) identifying your Lambda Function."
  value = aws_lambda_function.lambda_function.id
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value = aws_lambda_function.lambda_function.version
}

output "function_name" {
  description = "The Amazon Resource Name (function name) identifying your Lambda Function."
  value = aws_lambda_function.lambda_function.function_name
}

output "s3_object_version" {
  value = aws_lambda_function.lambda_function.s3_object_version
}

