# Setup AWS Terraform S3 and dynamoDB backend

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.73.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform_state_lock_table](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/dynamodb_table) | resource |
| [aws_kms_alias.data_s3_key_alias](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.data_s3_key](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/kms_key) | resource |
| [aws_s3_bucket.data_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile to be used to interact with AWS | `string` | `"aws-profile"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of the DynamoDB table used for state locking. | `string` | `"terraform-state-lock-table"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | The name of the S3 bucket. | `string` | `"one2n-terraform-state-files-bucket"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources. | `map(string)` | <pre>{<br/>  "CreatedBy": "Terraform",<br/>  "Project": "One2N"<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
