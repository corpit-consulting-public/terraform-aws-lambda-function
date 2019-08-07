output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value = "${element(coalescelist(aws_lambda_function.test_lambda_1.*.arn, aws_lambda_function.test_lambda_2.*.arn),0)}"
}

output "id" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value = "${element(coalescelist(aws_lambda_function.test_lambda_1.*.id, aws_lambda_function.test_lambda_2.*.id),0)}"
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value = "${element(coalescelist(aws_lambda_function.test_lambda_1.*.version, aws_lambda_function.test_lambda_2.*.version),0)}"
}

output "function_name" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value = "${element(coalescelist(aws_lambda_function.test_lambda_1.*.function_name, aws_lambda_function.test_lambda_2.*.function_name),0)}"
}
