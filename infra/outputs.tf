# Outputs de la infraestructura
# Este archivo expone la información crítica de los recursos desplegados
# que otros componentes o aplicaciones necesitan consumir.

# ============================================
# Superficie de práctica: completar los outputs
# ============================================
# La persona deberá definir outputs para:
# - Endpoints de la API
# - Información de la base de datos
# - URLs de servicios de red
# - Credenciales (usar sensitive = true)
# - Identificadores de recursos

# Outputs básicos - completar con referencias reales a los recursos

output "api_endpoint" {
  description = "Endpoint público del API Gateway"
  value       = "TODO: implementar referencia al módulo de api_gateway"
}

output "database_connection_string" {
  description = "Cadena de conexión a la base de datos"
  value       = "TODO: implementar referencia al módulo de database"
  sensitive   = true
}

output "database_endpoint" {
  description = "Host de la base de datos"
  value       = "TODO: implementar referencia al módulo de database"
}

output "load_balancer_dns" {
  description = "Nombre DNS del balanceador de carga"
  value       = "TODO: implementar referencia al módulo de load_balancer"
}

output "vpc_id" {
  description = "ID de la VPC"
  value       = "TODO: implementar referencia al módulo de networking"
}

output "security_group_ids" {
  description = "IDs de los grupos de seguridad"
  value       = "TODO: implementar referencia al módulo de security"
}

output "api_gateway_id" {
  description = "ID del API Gateway"
  value       = "TODO: implementar referencia al módulo de api_gateway"
}

output "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway"
  value       = "TODO: implementar referencia al módulo de api_gateway"
}

output "lambda_function_arns" {
  description = "ARNs de las funciones Lambda desplegadas"
  value       = "TODO: implementar referencia a las funciones lambda"
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3 para almacenamiento estático"
  value       = "TODO: implementar referencia al recurso S3"
}

output "cloudwatch_log_group" {
  description = "Grupo de logs de CloudWatch"
  value       = "TODO: implementar referencia al recurso de logs"
}

output "environment" {
  description = "Entorno de despliegue"
  value       = var.environment
}

output "region" {
  description = "Región de AWS"
  value       = var.aws_region
}

# Output agregado con información de salud de la infraestructura
output "infrastructure_status" {
  description = "Estado general de la infraestructura desplegada"
  value       = {
    api_available    = true
    database_ready   = true
    network_configured = true
    security_enabled = true
  }
}