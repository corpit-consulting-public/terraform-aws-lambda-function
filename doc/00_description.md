# tf-aws-lambda-functions-mod

Terraform module that creates Lambda Functions resources in AWS

  * This module provisions an AWS Lambda from a zip file in an S3 bucket.
  * Creates a lambda function with associated role and policies, which will log to Cloudwatch Logs

This Lambda module needs:

  * an existing s3 bucket
  * A lambda function packaged as zip

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `teraform012` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform11` branch.
