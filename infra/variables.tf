# Definición de variables para parametrizar la configuración de la infraestructura
# Este archivo contiene las variables que se utilizarán en los módulos y recursos
# de Terraform para el despliegue del backend de la app móvil.

# Variables generales
variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El entorno debe ser uno de: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado de recursos"
  type        = string
  default     = "mobile-order-api"
}

# Variables para AWS
variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC en AWS"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDR blocks para las subredes públicas en AWS"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDR blocks para las subredes privadas en AWS"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para los servidores de la API"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Nombre de la base de datos RDS"
  type        = string
  default     = "orderdb"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos RDS"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos RDS"
  type        = string
  sensitive   = true
}

# Variables para Google Cloud
variable "gcp_region" {
  description = "Región de Google Cloud"
  type        = string
  default     = "us-central1"
}

variable "gcp_project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
}

variable "gcp_machine_type" {
  description = "Tipo de máquina para instancias de Compute Engine"
  type        = string
  default     = "e2-micro"
}

# Variables para Azure
variable "azure_region" {
  description = "Región de Azure"
  type        = string
  default     = "eastus"
}

variable "azure_subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "azure_vm_size" {
  description = "Tamaño de la máquina virtual en Azure"
  type        = string
  default     = "Standard_B1s"
}

variable "azure_db_sku" {
  description = "SKU para la base de datos Azure SQL"
  type        = string
  default     = "Basic"
}

# Variables para seguridad
variable "allowed_ips" {
  description = "Lista de IPs permitidas para acceder a la API"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "api_key" {
  description = "Clave API para autenticación en la API Gateway"
  type        = string
  sensitive   = true
  default     = "default-api-key"
}

# Variables para escalabilidad
variable "min_capacity" {
  description = "Capacidad mínima para autoescalado"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Capacidad máxima para autoescalado"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada para autoescalado"
  type        = number
  default     = 2
}