variable "stack_name" {
  type    = string
  default = "One2N"
}

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

variable "one2N_domain" {
  type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = { CreatedBy = "Terraform" }
}
