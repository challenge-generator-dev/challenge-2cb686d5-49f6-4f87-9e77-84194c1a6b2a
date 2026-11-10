# Configuración de providers para Terraform
# Este archivo declara los proveedores necesarios para aprovisionar la infraestructura
# de la aplicación móvil de pedidos, incluyendo AWS, Google Cloud y Azure.

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Provider de AWS
provider "aws" {
  region = var.aws_region
  # Configuración opcional para perfiles de AWS CLI
  # profile = "default"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}

# Provider de Google Cloud
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Provider de Azure
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

# Configuración de backend para almacenamiento remoto del estado de Terraform
# Ejemplo con S3 (AWS) para almacenar el estado de Terraform
terraform {
  backend "s3" {
    bucket         = "tf-state-backend-mobile-app"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock-mobile-app"
  }
}

# Validación de variables requeridas para los providers
variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "gcp_project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
}

variable "gcp_region" {
  description = "Región de Google Cloud"
  type        = string
  default     = "us-central1"
}

variable "azure_subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado de recursos"
  type        = string
  default     = "mobile-order-api"
}