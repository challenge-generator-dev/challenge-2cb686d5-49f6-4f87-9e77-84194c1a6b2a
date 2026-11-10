# Configuración del API Gateway para la API de pedidos
# Este módulo aprovisiona un API Gateway de AWS para exponer los endpoints de la API
# SUPERFICIE DE PRÁCTICA: el candidato debe completar la configuración según los requisitos del reto

variable "api_gateway_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage de despliegue"
  type        = string
  default     = "prod"
}

variable "lambda_function_arn" {
  description = "ARN de la función Lambda que maneja las peticiones"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega el API Gateway"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets donde se despliega el API Gateway"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups para el API Gateway"
  type        = list(string)
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default     = {}
}

# API Gateway REST API
resource "aws_api_gateway_rest_api" "this" {
  name        = var.api_gateway_name
  description = "API Gateway para el servicio de pedidos"
  tags        = var.tags

  endpoint_configuration {
    types = ["REGIONAL"]
    vpc_endpoint_ids = []
  }
}

# Recurso base /orders
resource "aws_api_gateway_resource" "orders" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "orders"
}

# Método GET para listar pedidos
resource "aws_api_gateway_method" "orders_get" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "GET"
  authorization = "NONE"

  integration {
    type                = "AWS_PROXY"
    uri                 = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"
    integration_method  = "POST"
    passthrough_behavior = "WHEN_NO_MATCH"
  }
}

# Método POST para crear pedidos
resource "aws_api_gateway_method" "orders_post" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "POST"
  authorization = "NONE"

  integration {
    type                = "AWS_PROXY"
    uri                 = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"
    integration_method  = "POST"
    passthrough_behavior = "WHEN_NO_MATCH"
  }
}

# Deployment del API Gateway
resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  depends_on = [
    aws_api_gateway_method.orders_get,
    aws_api_gateway_method.orders_post
  ]

  lifecycle {
    create_before_destroy = true
  }
}

# Stage del API Gateway
resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = var.stage_name

  access_log_settings {
    destination_arn = aws_api_gateway_account.this.cloudwatch_role_arn
    format          = "$context.requestId: $context.endpoint $context.httpMethod $context.status $context.responseLatency $context.requestTime"
  }

  tags = var.tags
}

# Permiso para invocar Lambda
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

output "api_gateway_id" {
  description = "ID del API Gateway"
  value       = aws_api_gateway_rest_api.this.id
}

output "api_gateway_arn" {
  description = "ARN del API Gateway"
  value       = aws_api_gateway_rest_api.this.arn
}

output "api_gateway_endpoint" {
  description = "Endpoint del API Gateway"
  value       = aws_api_gateway_stage.this.invoke_url
}