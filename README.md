
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
## Usage

```hcl

####################################################################################
#######Lambda function with environment variables#######

module "lambda-function" {
  source             = "./modules/tf-aws-lambda-function"
  version            = "v2.1.0"
  function_name      = var.function_name
  role               = var.role
  memory_size        = var.memory_size
  handler            = var.handler
  description        = var.description
  source_code_hash   = var.source_code_hash
  runtime            = var.runtime
  timeout            = var.timeout
  mode               = var.mode
  s3_object_version  = var.s3_object_version
  s3_bucket          = var.s3_bucket
  s3_key             = var.s3_key
  environment        = {
    variables   = {
      key = value
    }
  }
}



```

* Lambdas modules can be created with or without variables and with or without layer or with the two variables together or separately



## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
