variable "filename" {
  type        = "string"
  description = "The path to the function's deployment package within the local filesystem. if defined, the s3_-prefix options cannot be used"
  default     = ""
}

variable "s3_bucket" {
  type        = "string"
  description = "The S3 bucket location containing the function's deployment package. Conflicts with filename. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = ""
}

variable "s3_key" {
  type        = "string"
  description = "The S3 key of an object containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "s3_object_version" {
  type        = "string"
  description = "The object version containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "function_name" {
  type        = "string"
  description = "A unique name for your Lambda Function."
}

variable "dead_letter_config" {
  type        = "list"
  description = "Nested block to configure the function's dead letter queue. See details below."
  default     = []
}

variable "handler" {
  type        = "string"
  description = "The function entrypoint in your code."
}

variable "role" {
  type        = "string"
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
}

variable "description" {
  type        = "string"
  description = "Description of what your Lambda Function does."
  default     = ""
}

variable "layers" {
  type        = "list"
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  default     = []
}

variable "memory_size" {
  type        = "string"
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "runtime" {
  type        = "string"
  description = ""
}

variable "timeout" {
  type        = "string"
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3"
  default     = 300
}

variable "reserved_concurrent_executions" {
  type        = "string"
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  default     = "-1"
}

variable "publish" {
  type        = "string"
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to false." 
  default     = "false"
}

variable "vpc_config" {
  type        = "list"
  description = "Provide this to allow your function to access your VPC. Fields documented below."
  default     = []
}

variable "environment" {
  type        = "map"
  description = "The Lambda environment's configuration settings. Fields documented below"
  default     = {}
}

variable "kms_key_arn" {
  type        = "string"
  description = "The ARN for the KMS encryption key."
  default     = ""
}

variable "source_code_hash" {
  type        = "string"
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256(file.zip) (Terraform 0.11.12 and later) or base64sha256(file(file.zip)) (Terraform 0.11.11 and earlier), where file.zip is the local filename of the lambda function source archive."
  default     = ""
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the object"
  default     = {}
}

variable "tracing_config" {
  type = "map"
  default = {}
}
 
#### dead_letter_config is a child block with a single argument ####

variable "target_arn" {
  type        = "string"
  description = "The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted."
  default     = ""
}

#### tracing_config is a child block with a single argument ####

variable "mode" {
  type        = "string"
  description = "Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with sampled=1. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision."
}

#### vpc_config requires the following ####

variable "subnet_ids" {
  type        = "list"
  description = "A list of subnet IDs associated with the Lambda function."
  default     = []
}

variable "security_group_ids" {
  type        = "list"
  description = "A list of security group IDs associated with the Lambda function."
  default     = []
}

#### For environment the following attributes are supported ####

variable "variables" {
  type        = "map"
  description = "A map that defines environment variables for the Lambda function."
  default     = {}
}
