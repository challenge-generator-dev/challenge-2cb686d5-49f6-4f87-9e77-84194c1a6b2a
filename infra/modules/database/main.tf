# Configuración de la base de datos para la API de pedidos
# Este módulo aprovisiona una instancia de Amazon RDS PostgreSQL
# SUPERFICIE DE PRÁCTICA: el candidato debe completar la configuración según los requisitos del reto

variable "identifier" {
  description = "Identificador de la base de datos"
  type        = string
}

variable "engine_version" {
  description = "Versión del motor de base de datos"
  type        = string
  default     = "15.4"
}

variable "instance_class" {
  description = "Clase de instancia de base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Almacenamiento allocated en GB"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Tipo de almacenamiento"
  type        = string
  default     = "gp3"
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega la base de datos"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets para la base de datos"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups para la base de datos"
  type        = list(string)
}

variable "database_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "username" {
  description = "Usuario maestro de la base de datos"
  type        = string
}

variable "password" {
  description = "Contraseña maestra (usar sensitive en producción)"
  type        = string
  sensitive   = true
}

variable "backup_retention_days" {
  description = "Días de retención de backups"
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Ventana de mantenimiento"
  type        = string
  default     = "mon:03:00-mon:04:00"
}

variable "deletion_protection" {
  description = "Habilitar protección contra eliminación"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Habilitar Multi-AZ"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default     = {}
}

# Subnet group para RDS
resource "aws_db_subnet_group" "this" {
  name       = var.identifier
  subnet_ids = var.subnet_ids

  tags = var.tags
}

# Security Group para RDS
resource "aws_security_group" "rds" {
  name        = "${var.identifier}-sg"
  description = "Security group para RDS ${var.identifier}"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    description     = "PostgreSQL"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = var.security_group_ids
  }

  egress {
    description = "Todo el tráfico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instancia RDS PostgreSQL
resource "aws_db_instance" "this" {
  identifier     = var.identifier
  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true
  kms_key_id            = var.kms_key_id

  db_name  = var.database_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = concat([aws_security_group.rds.id], var.security_group_ids)

  backup_retention_period = var.backup_retention_days
  backup_window           = "03:00-04:00"
  maintenance_window      = var.maintenance_window

  deletion_protection = var.deletion_protection
  multi_az            = var.multi_az

  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.identifier}-final-snapshot"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  performance_insights_enabled = true
  performance_insights_kms_key_id = var.kms_key_id

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# Parameter group para PostgreSQL
resource "aws_db_parameter_group" "this" {
  name   = "${var.identifier}-params"
  family = "postgres15"

  parameter {
    name  = "max_connections"
    value = "100"
  }

  parameter {
    name  = "shared_buffers"
    value = "{DBInstanceClassMemory/32768}"
  }

  parameter {
    name  = "effective_cache_size"
    value = "{DBInstanceClassMemory/16384}"
  }

  tags = var.tags
}

# Option group para PostgreSQL
resource "aws_db_option_group" "this" {
  name                     = "${var.identifier}-options"
  engine_name              = "postgres"
  major_engine_version    = "15"
  option_group_description = "Option group for ${var.identifier}"

  option {
    option_name = "TDE"
  }

  tags = var.tags
}

output "db_instance_id" {
  description = "ID de la instancia de base de datos"
  value       = aws_db_instance.this.id
}

output "db_instance_endpoint" {
  description = "Endpoint de la instancia de base de datos"
  value       = aws_db_instance.this.endpoint
  sensitive   = true
}

output "db_instance_address" {
  description = "Dirección de la instancia de base de datos"
  value       = aws_db_instance.this.address
}

output "db_instance_port" {
  description = "Puerto de la instancia de base de datos"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Nombre de la base de datos"
  value       = var.database_name
}