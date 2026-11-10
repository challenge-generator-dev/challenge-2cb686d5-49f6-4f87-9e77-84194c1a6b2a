# Módulo de Security - Superficie de práctica
# El estudiante debe implementar las políticas de seguridad completas

# Variable de entrada para el nombre del entorno
variable "environment" {
  description = "Nombre del entorno (dev, staging, prod)"
  type        = string
}

# Variable para el ID de la VPC
variable "vpc_id" {
  description = "ID de la VPC donde se crearán los recursos de seguridad"
  type        = string
}

# Variable para el ID del security group de la API
variable "api_security_group_id" {
  description = "ID del security group de la API"
  type        = string
}

# Variable para habilitar cifrado
variable "enable_encryption" {
  description = "Habilitar cifrado de datos en reposo"
  type        = bool
  default     = true
}

# Variable para las regiones permitidas
variable "allowed_regions" {
  description = "Lista de regiones permitidas para recursos"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

# TODO: Implementar IAM Role para la API
# resource "aws_iam_role" "api_role" {
#   name = "${var.environment}-api-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
#   tags = {
#     Environment = var.environment
#   }
# }

# TODO: Implementar política de acceso a S3
# resource "aws_iam_policy" "s3_access" {
#   name        = "${var.environment}-s3-access-policy"
#   description = "Política de acceso a S3 para la API"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:DeleteObject"
#         ]
#         Resource = "arn:aws:s3:::${var.environment}-api-bucket/*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:ListBucket"
#         ]
#         Resource = "arn:aws:s3:::${var.environment}-api-bucket"
#       }
#     ]
#   })
# }

# TODO: Implementar política de acceso a DynamoDB
# resource "aws_iam_policy" "dynamodb_access" {
#   name        = "${var.environment}-dynamodb-access-policy"
#   description = "Política de acceso a DynamoDB para la API"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "dynamodb:GetItem",
#           "dynamodb:PutItem",
#           "dynamodb:UpdateItem",
#           "dynamodb:DeleteItem",
#           "dynamodb:Query",
#           "dynamodb:Scan"
#         ]
#         Resource = "arn:aws:dynamodb:*:*:table/${var.environment}-*"
#       }
#     ]
#   })
# }

# TODO: Adjuntar políticas al rol de la API
# resource "aws_iam_role_policy_attachment" "api_s3" {
#   role       = aws_iam_role.api_role.name
#   policy_arn = aws_iam_policy.s3_access.arn
# }

# resource "aws_iam_role_policy_attachment" "api_dynamodb" {
#   role       = aws_iam_role.api_role.name
#   policy_arn = aws_iam_policy.dynamodb_access.arn
# }

# TODO: Implementar KMS Key para cifrado
# resource "aws_kms_key" "main" {
#   description             = "KMS Key para cifrado de ${var.environment}"
#   deletion_window_in_days = 10
#   enable_key_rotation     = true
#   tags = {
#     Name        = "${var.environment}-kms-key"
#     Environment = var.environment
#   }
# }

# TODO: Implementar alias de KMS
# resource "aws_kms_alias" "main" {
#   name          = "alias/${var.environment}-api-key"
#   target_key_id = aws_kms_key.main.key_id
# }

# TODO: Implementar Security Group para acceso restringido
# resource "aws_security_group" "restricted" {
#   name        = "${var.environment}-restricted-sg"
#   description = "Security group con acceso restringido"
#   vpc_id      = var.vpc_id
#   ingress {
#     description     = "Acceso desde VPC"
#     from_port       = 443
#     to_port         = 443
#     protocol        = "tcp"
#     cidr_blocks     = ["10.0.0.0/16"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name        = "${var.environment}-restricted-sg"
#     Environment = var.environment
#   }
# }

# TODO: Implementar política de CloudTrail
# resource "aws_cloudtrail" "main" {
#   name           = "${var.environment}-cloudtrail"
#   s3_bucket_name = aws_s3_bucket.cloudtrail.id
#   is_multi_region_trail = true
#   enable_logging = true
#   tags = {
#     Environment = var.environment
#   }
# }

# Output con el ARN del rol de la API
output "api_role_arn" {
  description = "ARN del rol de IAM para la API"
  # value       = aws_iam_role.api_role.arn
  value       = ""
}

# Output con el ARN de la política de S3
output "s3_policy_arn" {
  description = "ARN de la política de acceso a S3"
  # value       = aws_iam_policy.s3_access.arn
  value       = ""
}

# Output con el ARN de la política de DynamoDB
output "dynamodb_policy_arn" {
  description = "ARN de la política de acceso a DynamoDB"
  # value       = aws_iam_policy.dynamodb_access.arn
  value       = ""
}

# Output con el ID de la KMS Key
output "kms_key_id" {
  description = "ID de la KMS Key"
  # value       = aws_kms_key.main.key_id
  value       = ""
}

# Output con el ID del security group restringido
output "restricted_security_group_id" {
  description = "ID del security group restringido"
  # value       = aws_security_group.restricted.id
  value       = ""
}