## Usage

```hcl

####################################################################################
#######Lambda function with environment variables disabled and without Layers#######

module "lambda-function-MFACustomMessage" {
  source             = "./modules/tf-aws-lambda-function"
  function_name      = "${var.function_name}"
  role               = "arn:aws:iam::724568583458:role/AppSyncDynamoReader"
  memory_size        = "${var.memory_size}"
  handler            = "${var.handler}"
  description        = "${var.description}"
  source_code_hash   = "${var.source_code_hash}"
  runtime            = "${var.runtime}"
  timeout            = "${var.timeout}"
  mode               = "${var.mode}"
  s3_object_version  = "${var.s3_object_version}"
  s3_bucket          = "${var.s3_bucket}"
  s3_key             = "${var.s3_key}"
  has_variables      = "false"
}


##################################################################################
#######Lambdas functions with environment variables enabled and with Layers#######

module "lambda-function-uploadImageLocation" {
  source             = "./modules/tf-aws-lambda-function"
  function_name      = "${var.function_name}"
  role               = "arn:aws:iam::724568583458:role/LambdaS3FullAccess"
  memory_size        = "${var.memory_size}"
  handler            = "${var.handler}"
  source_code_hash   = "${var.source_code_hash}"
  runtime            = "${var.runtime}"
  timeout            = "${var.timeout}"
  mode               = "${var.mode}"
  s3_object_version  = "${var.s3_object_version}"
  s3_bucket          = "${var.s3_bucket}"
  s3_key             = "${var.s3_key}"
  has_variables      = "true"
  variables          = "${var.variables}"
  layers             = ["${var.layers}"]
}


#################################################################################################
###The "has_variables" variable Enables environment variables to be enabled. default = "false"###

```

* Lambdas modules can be created with or without variables and with or without layer or with the two variables together or separately


