# Módulo de Networking - Superficie de práctica
# El estudiante debe implementar la configuración de red completa

# Variable de entrada para el nombre del entorno
variable "environment" {
  description = "Nombre del entorno (dev, staging, prod)"
  type        = string
}

# Variable de entrada para el CIDR de la VPC
variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Variable de entrada para las availability zones
variable "availability_zones" {
  description = "Lista de availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Variable para las subnets públicas
variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# Variable para las subnets privadas
variable "private_subnet_cidrs" {
  description = "Lista de CIDRs para subnets privadas"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

# TODO: Implementar recurso de VPC
# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   tags = {
#     Name        = "${var.environment}-vpc"
#     Environment = var.environment
#   }
# }

# TODO: Implementar subnets públicas
# resource "aws_subnet" "public" {
#   count             = length(var.public_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.public_subnet_cidrs[count.index]
#   availability_zone = var.availability_zones[count.index]
#   map_public_ip_on_launch = true
#   tags = {
#     Name        = "${var.environment}-public-subnet-${count.index + 1}"
#     Environment = var.environment
#     Type        = "public"
#   }
# }

# TODO: Implementar subnets privadas
# resource "aws_subnet" "private" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnet_cidrs[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = {
#     Name        = "${var.environment}-private-subnet-${count.index + 1}"
#     Environment = var.environment
#     Type        = "private"
#   }
# }

# TODO: Implementar Internet Gateway
# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name        = "${var.environment}-igw"
#     Environment = var.environment
#   }
# }

# TODO: Implementar tablas de ruta públicas
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main.id
#   }
#   tags = {
#     Name        = "${var.environment}-public-rt"
#     Environment = var.environment
#   }
# }

# TODO: Implementar asociación de route table a subnets públicas
# resource "aws_route_table_association" "public" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = aws_subnet.public[count.index].id
#   route_table_id = aws_route_table.public.id
# }

# TODO: Implementar NAT Gateway para subnets privadas
# resource "aws_nat_gateway" "main" {
#   count         = var.enable_nat_gateway ? 1 : 0
#   allocation_id = aws_eip.nat[count.index].id
#   subnet_id     = aws_subnet.public[0].id
#   tags = {
#     Name        = "${var.environment}-nat-gw"
#     Environment = var.environment
#   }
#   depends_on = [aws_internet_gateway.main]
# }

# TODO: Implementar Security Group para la API
# resource "aws_security_group" "api" {
#   name        = "${var.environment}-api-sg"
#   description = "Security group para la API"
#   vpc_id      = aws_vpc.main.id
#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name        = "${var.environment}-api-sg"
#     Environment = var.environment
#   }
# }

# Output con el ID de la VPC
output "vpc_id" {
  description = "ID de la VPC creada"
  # value       = aws_vpc.main.id
  value       = ""
}

# Output con los IDs de las subnets públicas
output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  # value       = aws_subnet.public[*].id
  value       = []
}

# Output con los IDs de las subnets privadas
output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  # value       = aws_subnet.private[*].id
  value       = []
}

# Output con el ID del security group de la API
output "api_security_group_id" {
  description = "ID del security group de la API"
  # value       = aws_security_group.api.id
  value       = ""
}