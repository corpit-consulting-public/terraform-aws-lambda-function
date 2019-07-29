output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value = "${element(coalescelist(aws_lambda_function.test_lambda_1.*.id, aws_lambda_function.test_lambda_2.*.id),0)}"
}
