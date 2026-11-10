# Módulo de Infraestructura para API de Pedidos

Este directorio contiene la configuración de Terraform para aprovisionar la infraestructura necesaria
que soporta el backend de la aplicación móvil de pedidos. El diseño sigue principios de IaC
(Infrastructure as Code) para garantizar reproducibilidad, versionado y seguridad en los despliegues.

## Estructura del Módulo

```
infra/
├── versions.tf          # Definición de versiones de Terraform y proveedores requeridos
├── main.tf              # Recursos principales y composición de módulos
├── providers.tf         # Configuración de proveedorescloud (generado en lote paralelo)
├── variables.tf         # Definición de variables de entrada (generado en lote paralelo)
├── outputs.tf           # Salidas exponen información de recursos creados (generado en lote paralelo)
├── terraform.tfvars     # Valores de variables para el entorno dev (generado en lote paralelo)
└── environments/
    └── dev/
        └── terraform.tfvars  # Configuración específica del entorno de desarrollo
```

## Recursos Definidos

Este módulo aprovisiona los siguientes componentes de infraestructura:

- **Networking**: VPCs, subnets, route tables, Internet Gateway, NAT Gateway para comunica ción privada
- **Security Groups**: Reglas de firewall para API, base de datos y servicios internos
- **API Gateway**: Punto de entrada para las APIs REST del backend con integración a lambdas o ECS
- **Load Balancer**: Balanceador de carga Application/Network para distribuir tráfico entre instancias
- **Database**: Instancia de base de datos PostgreSQL o MySQL con configuración de alta disponibilidad
- **Compute**: Auto Scaling Group con instancias EC2 o tareas ECS Fargate para ejecutar la API
- **Cache**: Redis/Memcached para caché de sesiones y datos frecuentemente accedidos
- **CDN**: CloudFront para distribución de contenido estático y API acceleration

## Uso del Módulo

Para utilizar este módulo en un entorno existente, incluya las siguientes referencias en su
configuración de Terraform:

```hcl
module "pedidos_api" {
  source = "./infra"

  environment           = "production"
  vpc_cidr              = "10.0.0.0/16"
  api_instance_type    = "t3.medium"
  db_instance_class    = "db.t3.medium"
  db_allocated_storage = 100

  tags = {
    Project     = "pedidos-app"
    ManagedBy   = "terraform"
    Environment = "production"
  }
}
```

## Validación Local

Antes de aplicar cualquier cambio, ejecute las siguientes validaciones:

1. **Formato y estilo**: `terraform fmt -recursive` para formatear todos los archivos
2. **Validación de sintaxis**: `terraform validate` para verificar que la configuración es válida
3. **Planificación**: `terraform plan -out=tfplan` para previsualizar los cambios sin aplicarlos
4. **State**: `terraform show` para inspeccionar el estado actual de la infraestructura

## Seguridad Implementada

La configuración incluye las siguientes prácticas de seguridad:

- Cifrado en reposo para bases de datos y buckets de almacenamiento
- Cifrado en tránsito mediante TLS/SSL para todas las comunicaciones
- Least Privilege en IAM roles y políticas de acceso
- Logging y monitoreo centralizado con CloudWatch Logs
- Security Groups con reglas restrictivas (deny-all por defecto)
- Secrets management integrado con AWS Secrets Manager
- VPC con subnets públicas y privadas aisladas

## Consideraciones de Rendimiento

El diseño contempla los siguientes aspectos de rendimiento:

- Auto Scaling Group con métricas personalizadas para escalar según demanda
- Multi-AZ deployment para alta disponibilidad y tolerancia a fallos
- Connection pooling en la capa de base de datos
- CDN frente a recursos estáticos para reducir latencia
- Cacheo en múltiples capas (Redis, CloudFront, API Gateway)
- Balanceo de carga con health checks configurados

## Comando de Verificación

Para verificar que la configuración es correcta y el proyecto compila:

```bash
cd infra
terraform init
terraform validate
terraform plan
```

Si todos los comandos ejecutan sin errores, la configuración está lista para ser aplicada
con `terraform apply`. El output mostrará el plan detallado de recursos que se crearán.

## Dependencias Externas

Este módulo depende de los siguientes proveedores:

- `hashicorp/aws` versión 5.57.0 para recursos de Amazon Web Services
- `hashicorp/google` versión ~> 5.0 para Google Cloud Platform
- `hashicorp/azurerm` versión ~> 3.0 para Microsoft Azure

La versión de Terraform requerida es 1.9.0 o superior.