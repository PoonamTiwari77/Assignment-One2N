variable "aws_profile" {
  type        = string
  description = "AWS profile to be used to interact with AWS"
  default     = "aws-profile"
}
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default     = "one2n-terraform-state-files-bucket"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for state locking."
  type        = string
  default     = "terraform-state-lock-table"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default = {
    Project   = "One2N"
    CreatedBy = "Terraform"
  }
}
