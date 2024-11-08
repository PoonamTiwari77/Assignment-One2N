module "lambda" {
  source     = "./modules/lambda"
  stack_name = var.stack_name
}

module "apigateway" {
  source                     = "./modules/apigateway"
  stack_name                 = var.stack_name
  lambda_function_invoke_arn = module.lambda.lambda_function_invoke_arn
  lambda_function_name       = module.lambda.lambda_function_name

  depends_on = [module.lambda]
}
