# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/modules/security/main.tf` — El topic pide autenticacion/seguridad: este archivo es el ejercicio.
- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/load_balancer/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/networking/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `client` expone http (api: http://localhost:8080):
  - `POST /orders`
  - `GET /orders/{id}`
  - `GET /orders`
  - `PUT /orders/{id}`
  - `DELETE /orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `client/lib/core/network/dio_client.dart` — `OrderRequest.toJson`: Se invoca `toJson` sobre `OrderRequest`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `client/lib/data/datasources/order_remote_data_source.dart` — `DioClient.post`: Se invoca `post` sobre `DioClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `client/lib/data/datasources/order_remote_data_source.dart` — `OrderRequest.toJson`: Se invoca `toJson` sobre `OrderRequest`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `client/lib/data/datasources/order_remote_data_source.dart` — `DioClient.get`: Se invoca `get` sobre `DioClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `client/lib/data/datasources/order_remote_data_source.dart` — `DioClient.put`: Se invoca `put` sobre `DioClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `client/lib/data/datasources/order_remote_data_source.dart` — `DioClient.delete`: Se invoca `delete` sobre `DioClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261109193147506), Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de API de Pedidos con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Establecer el entorno de Terraform y definir los recursos básicos. — entregable (NO resolver): Archivos de Terraform configurados con recursos básicos.
- Fase 2: Definición de Recursos Avanzados — objetivo: Añadir recursos avanzados y configuraciones específicas para la API. — entregable (NO resolver): Archivos de Terraform actualizados con recursos avanzados y configuraciones específicas.
- Fase 3: Despliegue y Validación — objetivo: Desplegar la infraestructura y validar su funcionamiento. — entregable (NO resolver): Infraestructura desplegada y validada, con pruebas de carga y seguridad realizadas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/versions.tf ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/main.tf ===
# Configuración principal de recursos de infraestructura
# para el backend de la API de Pedidos

# Módulo de networking - VPC y subnets
module "networking" {
  source = "./modules/networking"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  tags = var.common_tags
}

# Módulo de base de datos
module "database" {
  source = "./modules/database"

  environment           = var.environment
  db_instance_class     = var.db_instance_class
  db_allocated_storage  = var.db_allocated_storage
  db_engine_version     = var.db_engine_version
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password

  vpc_id             = module.networking.vpc_id
  subnet_ids         = module.networking.private_subnet_ids
  security_group_id  = module.security.db_security_group_id

  tags = var.common_tags
}

# Módulo de load balancer
module "load_balancer" {
  source = "./modules/load_balancer"

  environment = var.environment
  vpc_id      = module.networking.vpc_id
  subnet_ids  = module.networking.public_subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = var.common_tags
}

# Módulo de API Gateway
module "api_gateway" {
  source = "./modules/api_gateway"

  environment        = var.environment
  api_name           = var.api_name
  api_stage          = var.api_stage
  lambda_function_arn = var.lambda_function_arn

  vpc_id          = module.networking.vpc_id
  subnet_ids      = module.networking.private_subnet_ids
  security_group_id = module.security.api_security_group_id

  tags = var.common_tags
}

# Módulo de seguridad
module "security" {
  source = "./modules/security"

  environment = var.environment
  vpc_id      = module.networking.vpc_id

  allowed_cidr_blocks = var.allowed_cidr_blocks
  enable_waf          = var.enable_waf

  tags = var.common_tags
}

# Recursos adicionales de la infraestructura
resource "aws_kms_key" "main" {
  description             = "KMS key para cifrado de recursos sensibles"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = merge(var.common_tags, {
    Name = "pedidos-api-kms-key"
  })
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.project_name}-${var.environment}-logs-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = 90
    }
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-logs"
  })
}

resource "aws_s3_bucket" "uploads" {
  bucket = "${var.project_name}-${var.environment}-uploads-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE"]
    allowed_origins = var.allowed_cors_origins
    max_age         = 3000
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-uploads"
  })
}

resource "aws_cloudwatch_log_group" "api_logs" {
  name              = "/aws/${var.project_name}/${var.environment}/api"
  retention_in_days = var.log_retention_days

  kms_key_id = aws_kms_key.main.arn

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-api-logs"
  })
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "${var.project_name}-${var.environment}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "This metric monitors EC2 CPU utilization"
  alarm_actions       = [aws_sns_topic.alerts.arn]

  tags = var.common_tags
}

resource "aws_cloudwatch_metric_alarm" "db_connections" {
  alarm_name          = "${var.project_name}-${var.environment}-db-connections"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = var.db_connections_threshold
  alarm_description   = "This metric monitors RDS connection count"
  alarm_actions       = [aws_sns_topic.alerts.arn]

  tags = var.common_tags
}

resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-${var.environment}-alerts"

  kms_master_key_id = aws_kms_key.main.arn

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-alerts"
  })
}

resource "aws_sns_topic_subscription" "alerts_email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

data "aws_caller_identity" "current" {}

// === ARCHIVO: infra/outputs.tf ===
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

// === ARCHIVO: infra/terraform.tfvars ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/modules/api_gateway/main.tf ===
# Configuración del API Gateway para la API de pedidos
# Este módulo aprovisiona un API Gateway de AWS para exponer los endpoints de la API
# SUPERFICIE DE PRÁCTICA: el candidato debe completar la configuración según los requisitos del reto

variable "api_gateway_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage de despliegue"
  type        = string
  default     = "prod"
}

variable "lambda_function_arn" {
  description = "ARN de la función Lambda que maneja las peticiones"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega el API Gateway"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets donde se despliega el API Gateway"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups para el API Gateway"
  type        = list(string)
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default     = {}
}

# API Gateway REST API
resource "aws_api_gateway_rest_api" "this" {
  name        = var.api_gateway_name
  description = "API Gateway para el servicio de pedidos"
  tags        = var.tags

  endpoint_configuration {
    types = ["REGIONAL"]
    vpc_endpoint_ids = []
  }
}

# Recurso base /orders
resource "aws_api_gateway_resource" "orders" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "orders"
}

# Método GET para listar pedidos
resource "aws_api_gateway_method" "orders_get" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "GET"
  authorization = "NONE"

  integration {
    type                = "AWS_PROXY"
    uri                 = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"
    integration_method  = "POST"
    passthrough_behavior = "WHEN_NO_MATCH"
  }
}

# Método POST para crear pedidos
resource "aws_api_gateway_method" "orders_post" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "POST"
  authorization = "NONE"

  integration {
    type                = "AWS_PROXY"
    uri                 = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"
    integration_method  = "POST"
    passthrough_behavior = "WHEN_NO_MATCH"
  }
}

# Deployment del API Gateway
resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  depends_on = [
    aws_api_gateway_method.orders_get,
    aws_api_gateway_method.orders_post
  ]

  lifecycle {
    create_before_destroy = true
  }
}

# Stage del API Gateway
resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = var.stage_name

  access_log_settings {
    destination_arn = aws_api_gateway_account.this.cloudwatch_role_arn
    format          = "$context.requestId: $context.endpoint $context.httpMethod $context.status $context.responseLatency $context.requestTime"
  }

  tags = var.tags
}

# Permiso para invocar Lambda
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

output "api_gateway_id" {
  description = "ID del API Gateway"
  value       = aws_api_gateway_rest_api.this.id
}

output "api_gateway_arn" {
  description = "ARN del API Gateway"
  value       = aws_api_gateway_rest_api.this.arn
}

output "api_gateway_endpoint" {
  description = "Endpoint del API Gateway"
  value       = aws_api_gateway_stage.this.invoke_url
}

// === ARCHIVO: infra/modules/load_balancer/main.tf ===
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

// === ARCHIVO: infra/modules/database/main.tf ===
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

// === ARCHIVO: infra/modules/networking/main.tf ===
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

// === ARCHIVO: infra/modules/security/main.tf ===
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

// === ARCHIVO: client/pubspec.yaml ===
name: order_app
description: A Flutter application for managing orders.
version: 1.0.0+1

environment:
  sdk: ">=3.6.0 <4.0.0"
  flutter: ">=3.27.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
  riverpod: ^2.4.9
  freezed_annotation: ^2.4.1
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.8
  freezed: ^2.4.5
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

// === ARCHIVO: client/lib/main.dart ===
package order_app;

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:order_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: OrderApp()));
}

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
    );
  }
}

// === ARCHIVO: client/lib/domain/models/order_request.dart ===
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request.freezed.dart';
part 'order_request.g.dart';

@freezed
class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    required String productId,
    required int quantity,
    String? notes,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);
}

// === ARCHIVO: client/lib/domain/models/order_response.dart ===
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required String id,
    required String productId,
    required int quantity,
    String? notes,
    required String status,
    required DateTime createdAt,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}

// === ARCHIVO: client/lib/core/network/dio_client.dart ===
package order_app.core.network;

import 'package:dio/dio.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';
import 'package:order_app/core/constants.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Constants.apiBaseUrl,
            connectTimeout: Constants.connectionTimeout,
            receiveTimeout: Constants.receiveTimeout,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dio.post(
        Constants.ordersEndpoint,
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OrderResponse> getOrder(String id) async {
    try {
      final response = await _dio.get('${Constants.ordersEndpoint}/$id');
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<OrderResponse>> listOrders() async {
    try {
      final response = await _dio.get(Constants.ordersEndpoint);
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => OrderResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    try {
      final response = await _dio.put(
        '${Constants.ordersEndpoint}/$id',
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _dio.delete('${Constants.ordersEndpoint}/$id');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(Constants.timeoutErrorMessage);
      case DioExceptionType.connectionError:
        return NetworkException(Constants.networkErrorMessage);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] as String? ??
            'Error occurred';
        switch (statusCode) {
          case 400:
            return BadRequestException(message);
          case 401:
            return UnauthorizedException(Constants.unauthorizedErrorMessage);
          case 403:
            return ForbiddenException('Access forbidden');
          case 404:
            return NotFoundException(Constants.notFoundErrorMessage);
          case 500:
          case 502:
          case 503:
            return InternalServerErrorException(
                Constants.internalServerErrorMessage);
          default:
            return HttpException(message);
        }
      case DioExceptionType.cancel:
        return RequestCancelledException(Constants.requestCancelledErrorMessage);
      default:
        return HttpException(error.message ?? 'Unknown error occurred');
    }
  }
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);

  @override
  String toString() => 'TimeoutException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);

  @override
  String toString() => 'ForbiddenException: $message';
}

class InternalServerErrorException implements Exception {
  final String message;
  InternalServerErrorException(this.message);

  @override
  String toString() => 'InternalServerErrorException: $message';
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() => 'HttpException: $message';
}

class RequestCancelledException implements Exception {
  final String message;
  RequestCancelledException(this.message);

  @override
  String toString() => 'RequestCancelledException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

// === ARCHIVO: client/lib/domain/entities/order.dart ===
part of 'order.freezed.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// Entidad que representa una orden en el dominio.
/// Contiene todos los atributos necesarios para gestionar órdenes.
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String customerId,
    required List<OrderItem> items,
    required DateTime createdAt,
    required OrderStatus status,
    DateTime? updatedAt,
    String? notes,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

/// Representa un item dentro de una orden.
@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required int quantity,
    required double price,
    String? description,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

/// Estados posibles de una orden.
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import 'package:order_app/domain/entities/order.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';

/// Interfaz del repositorio de órdenes.
/// Define los contratos que deben implementarse para gestionar órdenes.
abstract class OrderRepository {
  /// Crea una nueva orden.
  /// [orderRequest]: Datos de la orden a crear.
  /// Retorna [OrderResponse] con los detalles de la orden creada.
  /// Lanza excepciones en caso de error de red o validación.
  Future<OrderResponse> createOrder(OrderRequest orderRequest);

  /// Obtiene los detalles de una orden por su ID.
  /// [id]: Identificador de la orden.
  /// Retorna [OrderResponse] con los detalles de la orden.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<OrderResponse> getOrder(String id);

  /// Lista todas las órdenes.
  /// Retorna una lista de [OrderResponse].
  /// Lanza excepciones en caso de error de red.
  Future<List<OrderResponse>> listOrders();

  /// Actualiza una orden existente.
  /// [id]: Identificador de la orden.
  /// [orderRequest]: Datos actualizados de la orden.
  /// Retorna [OrderResponse] con los detalles actualizados.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest);

  /// Elimina una orden por su ID.
  /// [id]: Identificador de la orden.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<void> deleteOrder(String id);
}

// === ARCHIVO: client/lib/core/constants.dart ===
/// Constantes globales de la aplicación.
class Constants {
  /// URL base de la API del backend.
  static const String apiBaseUrl = 'http://localhost:8080';

  /// Endpoints de la API.
  static const String ordersEndpoint = '/orders';

  /// Tiempos de espera para las peticiones HTTP.
  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Mensajes de error comunes.
  static const String networkErrorMessage = 'Error de red. Verifica tu conexión.';
  static const String timeoutErrorMessage = 'Tiempo de espera agotado.';
  static const String unauthorizedErrorMessage = 'No autorizado. Verifica tus credenciales.';
  static const String notFoundErrorMessage = 'Recurso no encontrado.';
  static const String badRequestErrorMessage = 'Solicitud incorrecta.';
  static const String internalServerErrorMessage = 'Error interno del servidor.';
  static const String requestCancelledErrorMessage = 'Solicitud cancelada.';
}

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

    <application
        android:label="order_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/datasources/order_remote_data_source.dart ===
import 'package:dio/dio.dart';
import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../domain/models/order_request.dart';
import '../../domain/models/order_response.dart';

class OrderRemoteDataSource {
  final DioClient _dioClient;

  OrderRemoteDataSource({required DioClient dioClient}) : _dioClient = dioClient;

  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dioClient.post(
        Constants.ordersEndpoint,
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<OrderResponse> getOrder(String id) async {
    try {
      final response = await _dioClient.get('${Constants.ordersEndpoint}/$id');
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<List<OrderResponse>> listOrders() async {
    try {
      final response = await _dioClient.get(Constants.ordersEndpoint);
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => OrderResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    try {
      final response = await _dioClient.put(
        '${Constants.ordersEndpoint}/$id',
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _dioClient.delete('${Constants.ordersEndpoint}/$id');
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = error.response?.data?['message'] as String? ?? 
        error.message ?? 
        'Unknown error occurred';

    switch (statusCode) {
      case 400:
        throw BadRequestException(message);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 500:
        throw InternalServerErrorException(message);
      default:
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          throw TimeoutException(message);
        } else if (error.type == DioExceptionType.cancel) {
          throw RequestCancelledException(message);
        } else if (error.type == DioExceptionType.connectionError) {
          throw NetworkException(message);
        }
        throw HttpException(message);
    }
  }
}

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../domain/models/order_request.dart';
import '../../domain/models/order_response.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl({required DioClient dioClient})
      : _remoteDataSource = OrderRemoteDataSource(dioClient: dioClient);

  @override
  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    return await _remoteDataSource.createOrder(orderRequest);
  }

  @override
  Future<OrderResponse> getOrder(String id) async {
    return await _remoteDataSource.getOrder(id);
  }

  @override
  Future<List<OrderResponse>> listOrders() async {
    return await _remoteDataSource.listOrders();
  }

  @override
  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    return await _remoteDataSource.updateOrder(id, orderRequest);
  }

  @override
  Future<void> deleteOrder(String id) async {
    await _remoteDataSource.deleteOrder(id);
  }
}

// === ARCHIVO: client/lib/presentation/screens/order_screen.dart ===
package order_app.presentation.screens;

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';
import 'package:order_app/presentation/viewmodels/order_viewmodel.dart';
import 'package:order_app/core/constants.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(orderViewModelProvider);
    final orders = viewModel.orders;
    final isLoading = viewModel.isLoading;
    final errorMessage = viewModel.errorMessage;
    final selectedOrder = viewModel.selectedOrder;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Pedidos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => viewModel.loadOrders(),
            tooltip: 'Actualizar pedidos',
          ),
        ],
      ),
      body: Column(
        children: [
          if (errorMessage != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade100,
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => viewModel.clearError(),
                  ),
                ],
              ),
            ),
          Expanded(
            child: isLoading && orders.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : orders.isEmpty
                    ? _buildEmptyState(context, viewModel)
                    : _buildOrdersList(context, ref, orders, selectedOrder),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateOrderDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Pedido'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, OrderViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'No hay pedidos aún',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primer pedido para comenzar',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => viewModel.loadOrders(),
            icon: const Icon(Icons.refresh),
            label: const Text('Cargar Pedidos'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(
    BuildContext context,
    WidgetRef ref,
    List<OrderResponse> orders,
    OrderResponse? selectedOrder,
  ) {
    final viewModel = ref.read(orderViewModelProvider);
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final isSelected = selectedOrder?.id == order.id;
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: isSelected ? 4 : 1,
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          child: InkWell(
            onTap: () => viewModel.selectOrder(order.id),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pedido #${order.id}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      _buildStatusChip(context, order.status),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cliente: ${order.customerName}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total: \$${order.total.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.visibility, size: 18),
                        label: const Text('Ver'),
                        onPressed: () => viewModel.selectOrder(order.id),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Editar'),
                        onPressed: () =>
                            _showEditOrderDialog(context, ref, order),
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.delete, size: 18, color: Colors.red.shade400),
                        label: Text('Eliminar', style: TextStyle(color: Colors.red.shade400)),
                        onPressed: () =>
                            _showDeleteConfirmation(context, ref, order.id),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    Color backgroundColor;
    Color textColor;
    switch (status.toLowerCase()) {
      case 'pending':
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
      case 'processing':
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade800;
        break;
      case 'completed':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'cancelled':
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        backgroundColor = Colors.grey.shade100;
        textColor = Colors.grey.shade800;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        _formatStatus(status),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  String _formatStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Pendiente';
      case 'processing':
        return 'Procesando';
      case 'completed':
        return 'Completado';
      case 'cancelled':
        return 'Cancelado';
      default:
        return status;
    }
  }

  void _showCreateOrderDialog(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(orderViewModelProvider);
    final customerNameController = TextEditingController();
    final totalController = TextEditingController();
    String selectedStatus = 'pending';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Crear Nuevo Pedido'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: customerNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Cliente',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: totalController,
                  decoration: const InputDecoration(
                    labelText: 'Total',
                    border: OutlineInputBorder(),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'pending', child: Text('Pendiente')),
                    DropdownMenuItem(value: 'processing', child: Text('Procesando')),
                    DropdownMenuItem(value: 'completed', child: Text('Completado')),
                    DropdownMenuItem(value: 'cancelled', child: Text('Cancelado')),
                  ],
                  onChanged: (value) {
                    setState(() => selectedStatus = value ?? 'pending');
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                try {
                  final request = OrderRequest(
                    customerName: customerNameController.text,
                    items: '[]',
                    total: double.tryParse(totalController.text) ?? 0.0,
                    status: selectedStatus,
                  );
                  viewModel.createOrder(request);
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error al crear pedido: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditOrderDialog(BuildContext context, WidgetRef ref, OrderResponse order) {
    final viewModel = ref.read(orderViewModelProvider);
    final customerNameController = TextEditingController(text: order.customerName);
    final totalController = TextEditingController(text: order.total.toString());
    String selectedStatus = order.status;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Editar Pedido #${order.id}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: customerNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Cliente',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: totalController,
                  decoration: const InputDecoration(
                    labelText: 'Total',
                    border: OutlineInputBorder(),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'pending', child: Text('Pendiente')),
                    DropdownMenuItem(value: 'processing', child: Text('Procesando')),
                    DropdownMenuItem(value: 'completed', child: Text('Completado')),
                    DropdownMenuItem(value: 'cancelled', child: Text('Cancelado')),
                  ],
                  onChanged: (value) {
                    setState(() => selectedStatus = value ?? 'pending');
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                try {
                  final request = OrderRequest(
                    customerName: customerNameController.text,
                    items: '[]',
                    total: double.tryParse(totalController.text) ?? 0.0,
                    status: selectedStatus,
                  );
                  viewModel.updateOrder(order.id, request);
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error al actualizar pedido: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String orderId) {
    final viewModel = ref.read(orderViewModelProvider);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el pedido #$orderId? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              viewModel.deleteOrder(orderId);
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

// === ARCHIVO: client/lib/presentation/viewmodels/order_viewmodel.dart ===
package order_app.presentation.viewmodels;

import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/core/constants.dart';
import 'package:order_app/core/network/dio_client.dart';

class OrderViewModel extends ValueNotifier<OrderViewModelState> {
  final OrderRepository _repository;
  
  OrderViewModel(this._repository) : super(const OrderViewModelState()) {
    loadOrders();
  }

  List<OrderResponse> get orders => state.orders;
  bool get isLoading => state.isLoading;
  String? get errorMessage => state.errorMessage;
  OrderResponse? get selectedOrder => state.selectedOrder;

  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await _repository.listOrders();
      state = state.copyWith(
        orders: result,
        isLoading: false,
        errorMessage: null,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout cargando pedidos: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido cargando pedidos: $e');
    }
  }

  Future<void> createOrder(OrderRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final createdOrder = await _repository.createOrder(request);
      final updatedOrders = [...state.orders, createdOrder];
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout creando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido creando pedido: $e');
    }
  }

  Future<void> updateOrder(String id, OrderRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final updatedOrder = await _repository.updateOrder(id, request);
      final updatedOrders = state.orders.map((order) {
        return order.id == id ? updatedOrder : order;
      }).toList();
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
        selectedOrder: state.selectedOrder?.id == id ? updatedOrder : state.selectedOrder,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout actualizando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido actualizando pedido: $e');
    }
  }

  Future<void> deleteOrder(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _repository.deleteOrder(id);
      final updatedOrders = state.orders.where((order) => order.id != id).toList();
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
        selectedOrder: state.selectedOrder?.id == id ? null : state.selectedOrder,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout eliminando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido eliminando pedido: $e');
    }
  }

  void selectOrder(String id) {
    final order = state.orders.firstWhere(
      (o) => o.id == id,
      orElse: () => state.orders.first,
    );
    state = state.copyWith(selectedOrder: order);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void clearSelection() {
    state = state.copyWith(selectedOrder: null);
  }
}

class OrderViewModelState {
  final List<OrderResponse> orders;
  final bool isLoading;
  final String? errorMessage;
  final OrderResponse? selectedOrder;

  const OrderViewModelState({
    this.orders = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedOrder,
  });

  OrderViewModelState copyWith({
    List<OrderResponse>? orders,
    bool? isLoading,
    String? errorMessage,
    OrderResponse? selectedOrder,
  }) {
    return OrderViewModelState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedOrder: selectedOrder ?? this.selectedOrder,
    );
  }
}

final orderViewModelProvider = StateNotifierProvider<OrderViewModel, OrderViewModelState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderViewModel(repository);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('El provider de OrderRepository debe ser sobreescrito en el módulo de inyección');
});
```
