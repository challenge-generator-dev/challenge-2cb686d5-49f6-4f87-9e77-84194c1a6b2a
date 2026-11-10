# Despliegue de API de Pedidos con Terraform

La aplicación móvil de pedidos requiere una infraestructura robusta y escalable para su backend. Tu tarea es aprovisionar la infraestructura necesaria utilizando Terraform para asegurar que la API esté disponible y pueda manejar el tráfico esperado. Los recursos incluyen servidores, bases de datos y servicios de red. Debes asegurar que la configuración sea idónea para el rendimiento y la seguridad requeridos por la aplicación.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Establecer el entorno de Terraform y definir los recursos básicos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica los recursos necesarios para la API de pedidos.
- Configura el entorno de Terraform para gestionar estos recursos.
- Define los recursos básicos en los archivos de Terraform.

**Entregable:** Archivos de Terraform configurados con recursos básicos.

<details>
<summary>Pistas de conocimiento</summary>

- Recuerda revisar la documentación de Terraform para los proveedores y recursos disponibles.
- Considera las mejores prácticas para la gestión de estados en Terraform.

</details>

### Fase 2: Definición de Recursos Avanzados

**Objetivo:** Añadir recursos avanzados y configuraciones específicas para la API.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Añade recursos avanzados como balanceadores de carga y servicios de caché.
- Configura las políticas de seguridad y acceso para los recursos.
- Define las variables y outputs necesarios para la API.

**Entregable:** Archivos de Terraform actualizados con recursos avanzados y configuraciones específicas.

<details>
<summary>Pistas de conocimiento</summary>

- Investiga sobre los diferentes tipos de balanceadores de carga y elige el más adecuado.
- Revisa las mejores prácticas para la configuración de seguridad en Terraform.

</details>

### Fase 3: Despliegue y Validación

**Objetivo:** Desplegar la infraestructura y validar su funcionamiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecuta los comandos de Terraform para desplegar la infraestructura.
- Verifica que todos los recursos se han creado correctamente.
- Realiza pruebas de carga y seguridad para asegurar el funcionamiento de la API.

**Entregable:** Infraestructura desplegada y validada, con pruebas de carga y seguridad realizadas.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza herramientas de prueba de carga como Apache JMeter para verificar el rendimiento.
- Revisa los logs y métricas para identificar posibles problemas de seguridad.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este contexto?
- **paraQueSirve**: ¿Para qué sirve la configuración de recursos avanzados en Terraform?
- **comoSeUsa**: ¿Cómo se usa Terraform para desplegar la infraestructura?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar recursos en Terraform?
- **queDecisionesImplica**: ¿Qué decisiones implica el despliegue y la validación de la infraestructura?

## Criterios de Evaluacion

- Configuración inicial de Terraform con recursos básicos.
- Adición de recursos avanzados y configuraciones específicas.
- Despliegue y validación de la infraestructura con pruebas de carga y seguridad.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
