resource "aws_apigatewayv2_api" "one2N" {
  name          = "${var.stack_name}-apigateway"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "one2N" {
  api_id      = aws_apigatewayv2_api.one2N.id
  name        = "$default"
  auto_deploy = true
  #This displays the logs in cloudwatch
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.default.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
      }
    )
  }
}

resource "aws_cloudwatch_log_group" "default" {
  name              = "/apigateway/${var.stack_name}-default"
  retention_in_days = 7
}

resource "aws_apigatewayv2_integration" "one2N" {
  api_id             = aws_apigatewayv2_api.one2N.id
  integration_type   = "AWS_PROXY"
  connection_type    = "INTERNET"
  description        = "Integration for Lambda to list S3 bucket contents"
  integration_method = "POST"
  integration_uri    = var.lambda_function_invoke_arn
}

# Define the Route for the API
resource "aws_apigatewayv2_route" "one2N" {
  api_id    = aws_apigatewayv2_api.one2N.id
  route_key = "GET /list-bucket-content/{bucket}/{path+}"

  target = "integrations/${aws_apigatewayv2_integration.one2N.id}"
}


# Permission to invoke lambda function
resource "aws_lambda_permission" "one2N" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.one2N.execution_arn}/*/*/*"
}
