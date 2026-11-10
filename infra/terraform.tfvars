# Archivo de valores para Terraform
# Configuración global que se aplica a todos los entornos
# Los valores aquí pueden ser sobrescritos por archivos específicos de entorno

# ============================================
# Configuración del proyecto
# ============================================

project_name    = "pedidos-app"
environment     = "dev"
aws_region      = "us-east-1"

# ============================================
# Configuración de red
# ============================================

vpc_cidr_block           = "10.0.0.0/16"
available_azs           = ["us-east-1a", "us-east-1b", "us-east-1c"]
enable_nat_gateway      = true
enable_vpn_gateway      = false

# ============================================
# Configuración de base de datos
# ============================================

db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_engine_version    = "15.7"
db_multi_az          = false
db_backup_retention  = 7
db_skip_final_snapshot = true

# ============================================
# Configuración de API Gateway
# ============================================

api_gateway_stage_name     = "prod"
api_gateway_log_level      = "INFO"
api_gateway_cache_enabled  = false
api_gateway_throttle_rate  = 1000
api_gateway_throttle_burst = 2000

# ============================================
# Configuración de Balanceador de Carga
# ============================================

lb_type               = "application"
lb_scheme            = "internet-facing"
lb_ip_address_type   = "ipv4"
lb_enable_deletion_protection = false

# ============================================
# Configuración de seguridad
# ============================================

enable_waf              = false
enable_guardduty       = false
enable_cloudtrail      = true
enable_security_hub    = false

# Tags que se aplicarán a todos los recursos
common_tags = {
  Project     = "pedidos-app"
  ManagedBy   = "Terraform"
  Environment = "dev"
  CostCenter  = "Engineering"
  Compliance  = "SOC2"
}

# ============================================
# Configuración de logging y monitoreo
# ============================================

enable_cloudwatch_logs       = true
log_retention_days          = 30
enable_cloudwatch_alarms    = true
enable_detailed_monitoring  = false

# ============================================
# Configuración de escalado
# ============================================

autoscaling_min_capacity = 1
autoscaling_max_capacity = 4
autoscaling_target_cpu   = 70

# ============================================
# Configuración de almacenamiento S3
# ==========================================

s3_bucket_name        = "pedidos-app-assets"
s3_enable_versioning = true
s3_enable_encryption  = true
s3_lifecycle_days     = 90