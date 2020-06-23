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


