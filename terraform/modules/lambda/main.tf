module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4.10"

  function_name = "${var.stack_name}-s3-list-bucket-content"
  description   = "Lambda list s3 buckets content"

  runtime                = "python3.8"
  handler                = "index.lambda_handler"
  timeout                = 100
  memory_size            = 128
  attach_policy          = true
  create_package         = false
  local_existing_package = "${path.module}/index.zip"
  create_role            = false
  lambda_role            = aws_iam_role.lambda_execution_role.arn
}
