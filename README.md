
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
#######Lambda function with environment variables disabled and without Layers#######

module "lambda-function-1" {
  source             = "./modules/tf-aws-lambda-function"
  function_name      = "${var.function_name}"
  role               = "${var.role}"
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

module "lambda-function-2" {
  source             = "./modules/tf-aws-lambda-function"
  function_name      = "${var.function_name}"
  role               = "${var.role}"
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



## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dead\_letter\_config | Nested block to configure the function's dead letter queue. See details below. | list | `<list>` | no |
| description | Description of what your Lambda Function does. | string | `""` | no |
| environment | The Lambda environment's configuration settings. Fields documented below | map | `<map>` | no |
| filename | The path to the function's deployment package within the local filesystem. if defined, the s3_-prefix options cannot be used | string | `""` | no |
| function\_name | A unique name for your Lambda Function. | string | n/a | yes |
| handler | The function entrypoint in your code. | string | n/a | yes |
| has\_variables | true or false | string | `"false"` | no |
| kms\_key\_arn | The ARN for the KMS encryption key. | string | `""` | no |
| layers | List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. | list | `<list>` | no |
| memory\_size | Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. | string | `"128"` | no |
| mode | Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with sampled=1. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision. | string | n/a | yes |
| publish | Whether to publish creation/change as new Lambda Function Version. Defaults to false. | string | `"false"` | no |
| reserved\_concurrent\_executions | The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. | string | `"-1"` | no |
| role | IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details. | string | n/a | yes |
| runtime |  | string | n/a | yes |
| s3\_bucket | The S3 bucket location containing the function's deployment package. Conflicts with filename. This bucket must reside in the same AWS region where you are creating the Lambda function. | string | `""` | no |
| s3\_key | The S3 key of an object containing the function's deployment package. Conflicts with filename. | string | `""` | no |
| s3\_object\_version | The object version containing the function's deployment package. Conflicts with filename. | string | `""` | no |
| security\_group\_ids | A list of security group IDs associated with the Lambda function. | list | `<list>` | no |
| source\_code\_hash | Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256(file.zip) (Terraform 0.11.12 and later) or base64sha256(file(file.zip)) (Terraform 0.11.11 and earlier), where file.zip is the local filename of the lambda function source archive. | string | `""` | no |
| subnet\_ids | A list of subnet IDs associated with the Lambda function. | list | `<list>` | no |
| tags | A mapping of tags to assign to the object | map | `<map>` | no |
| target\_arn | The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted. | string | `""` | no |
| timeout | The amount of time your Lambda Function has to run in seconds. Defaults to 3 | string | `"300"` | no |
| tracing\_config |  | map | `<map>` | no |
| variables | A map that defines environment variables for the Lambda function. | map | `<map>` | no |
| vpc\_config | Provide this to allow your function to access your VPC. Fields documented below. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) identifying your Lambda Function. |
| function\_name | The Amazon Resource Name (function name) identifying your Lambda Function. |
| id | The Amazon Resource Name (ID) identifying your Lambda Function. |
| s3\_object\_version |  |
| version | Latest published version of your Lambda Function. |

