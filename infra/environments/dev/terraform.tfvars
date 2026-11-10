# Configuración específica para el entorno de desarrollo
# Estos valores sobrescriben los valores globales en terraform.tfvars

# ============================================
# Configuración de desarrollo
# ============================================

environment = "dev"
aws_region  = "us-east-1"

# En dev usamos recursos más pequeños para降低成本
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_multi_az          = false

# Configuración de red optimizada para desarrollo
vpc_cidr_block = "10.0.0.0/16"
available_azs = ["us-east-1a", "us-east-1b"]

# API Gateway en modo desarrollo (sin cache, menos throttle)
api_gateway_stage_name     = "dev"
api_gateway_cache_enabled  = false
api_gateway_throttle_rate  = 100
api_gateway_throttle_burst = 200

# Balanceador de carga sin protección de eliminación
lb_enable_deletion_protection = false

# Escalado reducido para desarrollo
autoscaling_min_capacity = 1
autoscaling_max_capacity = 2

# Configuración de logging mínima para dev
enable_cloudwatch_logs  = true
log_retention_days      = 7
enable_detailed_monitoring = false

# Tags específicos del entorno
common_tags = {
  Project     = "pedidos-app"
  ManagedBy   = "Terraform"
  Environment = "dev"
  CostCenter  = "Engineering"
  Compliance  = "NONE"
  Tier        = "development"
}

# ============================================
# Configuración de características especiales para dev
# ============================================

# Habilitar acceso desde cualquier IP en desarrollo (restrictivo en prod)
allowed_cidr_blocks = ["0.0.0.0/0"]

# Configuración de base de datos para desarrollo rápido
db_backup_retention  = 1
db_skip_final_snapshot = true
db_name              = "pedidos_dev"

# Configuración de S3 para desarrollo
s3_bucket_name        = "pedidos-app-dev-assets"
s3_enable_versioning = false

# Habilitar features de debugging solo en dev
enable_api_gateway_DETAILED_METRICS = false
enable_lambda_xray                 = false

# Timeout extendido para operaciones de desarrollo
lambda_timeout     = 30
lambda_memory_size = 256