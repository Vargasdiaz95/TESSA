# Arquitectura TESSA

## Visión

TESSA (Tecnossystem Smart Setup Assistant) es una plataforma diseñada para automatizar y estandarizar los procesos de alistamiento, configuración, personalización e inventario de equipos Windows.

TESSA representa la evolución de AIMT (Asistente de Instalación y Mejoras Tecnossystem), adoptando una arquitectura modular, reutilizable y escalable que permite soportar múltiples perfiles organizacionales a partir de una única base de código.

---

## Objetivos

- Estandarizar procesos de alistamiento de equipos.
- Reducir tareas manuales repetitivas.
- Centralizar configuraciones corporativas.
- Facilitar la administración y mantenimiento de scripts.
- Permitir la reutilización de módulos entre diferentes organizaciones.
- Garantizar la trazabilidad y evolución del proyecto mediante control de versiones.

---

## Principios de Diseño

### Modularidad

Cada funcionalidad debe estar implementada como un módulo independiente.

### Reutilización

La lógica de negocio debe ser reutilizable entre diferentes perfiles.

### Escalabilidad

La arquitectura debe permitir la incorporación de nuevos módulos y perfiles sin afectar componentes existentes.

### Mantenibilidad

La estructura del proyecto debe facilitar el soporte y evolución del código.

### Separación de Responsabilidades

La lógica, configuración y recursos deben mantenerse desacoplados.

---

## Estructura General

```text
TESSA
│
├── Core
│   ├── Init
│   ├── Hosts
│   ├── Users
│   ├── Drivers-Lenovo
│   ├── Personalizacion
│   ├── Inventario
│   └── Utilidades
│
├── Perfiles
│   └── SIC
│       ├── Configuracion
│       ├── Aplicaciones
│       ├── Controladores
│       ├── FondosPantalla
│       └── Inventario
│
├── Recursos
│   ├── Componentes
│   ├── Binarios
│   └── Plantillas
│
├── Logs
│
├── Documentacion
│   ├── Arquitectura
│   ├── Modulos
│   ├── Manuales
│   └── Versiones
│
└── Pruebas
```

---

## Core

El directorio Core contiene los módulos funcionales reutilizables de la plataforma.

### Init

Responsable de preparar y validar el entorno de ejecución.

Funciones previstas:

- Inicialización de variables.
- Validación de prerequisitos.
- Preparación de recursos.
- Control del flujo principal.

---

### Hosts

Gestiona las modificaciones del archivo Hosts requeridas por cada perfil.

Funciones previstas:

- Implementación de entradas corporativas.
- Actualización de configuraciones existentes.
- Validación de cambios realizados.

---

### Users

Administra configuraciones asociadas a usuarios locales del sistema operativo.

Funciones previstas:

- Creación de usuarios.
- Configuración de perfiles.
- Aplicación de ajustes corporativos.

---

### Drivers-Lenovo

Gestiona la instalación y actualización de controladores Lenovo soportados por la plataforma.

Funciones previstas:

- Identificación de modelo.
- Instalación de paquetes de controladores.
- Validación de instalación.

---

### Personalizacion

Aplica configuraciones visuales y corporativas definidas por cada perfil.

Funciones previstas:

- Fondo de pantalla.
- Pantalla de bloqueo.
- Imagen corporativa.
- Configuraciones visuales adicionales.

---

### Inventario

Gestiona la recopilación de información técnica de los equipos.

Funciones previstas:

- Información de hardware.
- Información de software.
- Identificación del dispositivo.
- Exportación de resultados.

---

### Utilidades

Contendrá funciones compartidas utilizadas por múltiples módulos.

---

## Perfiles

Los perfiles contienen toda la información específica de una organización.

La lógica debe residir en Core.

Los perfiles únicamente contendrán:

- Configuración.
- Recursos visuales.
- Aplicaciones.
- Inventarios.
- Controladores específicos.

---

## Perfil Inicial

### SIC

Primer perfil soportado por TESSA.

Actualmente contiene la configuración corporativa utilizada durante los procesos de alistamiento e implementación.

---

## Recursos

Almacena recursos compartidos utilizados por uno o más módulos.

Ejemplos:

- .NET Framework 3.5
- Instaladores auxiliares
- Herramientas de soporte
- Plantillas

---

## Logs

Centraliza los registros generados por la ejecución de TESSA.

Objetivos:

- Trazabilidad.
- Diagnóstico.
- Soporte.
- Auditoría.

---

## Evolución del Proyecto

### AIMT (Versión 1.x)

Implementación inicial basada en scripts específicos para una única organización.

### TESSA (Versión 2.x)

Arquitectura modular diseñada para soportar múltiples perfiles organizacionales mediante una única plataforma reutilizable.

La migración se realizará conservando la funcionalidad operativa existente mientras se desacoplan progresivamente los componentes hacia la estructura definida en este documento.