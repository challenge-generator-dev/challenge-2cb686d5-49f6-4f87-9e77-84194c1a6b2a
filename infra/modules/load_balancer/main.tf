# Configuración del balanceador de carga para distribuir el tráfico de la API
# Este módulo aprovisiona un Application Load Balancer para distribuir tráfico HTTP/HTTPS
# SUPERFICIE DE PRÁCTICA: el candidato debe completar la configuración según los requisitos del reto

variable "name" {
  description = "Nombre del balanceador de carga"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega el balanceador"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets para el balanceador"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups asociados al balanceador"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Habilitar protección contra eliminación"
  type        = bool
  default     = true
}

variable "idle_timeout" {
  description = "Tiempo de espera inactivo en segundos"
  type        = number
  default     = 60
}

variable "target_group_config" {
  description = "Configuración del target group"
  type = object({
    port                = number
    protocol            = string
    target_type         = string
    health_check_path   = string
    health_check_interval = number
    healthy_threshold   = number
    unhealthy_threshold = number
  })
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default     = {}
}

# Security Group para el Load Balancer
resource "aws_security_group" "lb" {
  name        = "${var.name}-sg"
  description = "Security group para el Load Balancer"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Todo el tráfico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Application Load Balancer
resource "aws_lb" "this" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = concat(var.security_groups, [aws_security_group.lb.id])
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection
  idle_timeout               = var.idle_timeout

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# Target Group para los servicios backend
resource "aws_lb_target_group" "this" {
  name     = var.name
  port     = var.target_group_config.port
  protocol = var.target_group_config.protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = var.target_group_config.healthy_threshold
    unhealthy_threshold = var.target_group_config.unhealthy_threshold
    timeout             = 5
    interval            = var.target_group_config.health_check_interval
    path                = var.target_group_config.health_check_path
    matcher             = "200"
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# Listener HTTP
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# Listener HTTPS (requiere certificado ACM)
resource "aws_lb_listener" "https" {
  count             = var.acm_certificate_arn != null ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

output "lb_arn" {
  description = "ARN del Load Balancer"
  value       = aws_lb.this.arn
}

output "lb_dns_name" {
  description = "Nombre DNS del Load Balancer"
  value       = aws_lb.this.dns_name
}

output "lb_zone_id" {
  description = "Zone ID del Load Balancer"
  value       = aws_lb.this.zone_id
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = aws_lb_target_group.this.arn
}