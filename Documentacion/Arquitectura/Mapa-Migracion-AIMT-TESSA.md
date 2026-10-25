# Mapa de Migración AIMT → TESSA

## Propósito

Este documento define la estrategia de evolución desde AIMT (Asistente de Instalación y Mejoras Tecnossystem) hacia TESSA (Tecnossystem Smart Setup Assistant).

Su objetivo es preservar la funcionalidad existente mientras se transforma la solución en una plataforma modular, reutilizable y escalable.

---

# Estado Actual

## AIMT v1.x

Arquitectura actual:

```text
C:\AIMT
│
├── Apps
├── Componentes
├── Controladores
├── Dev
├── Logs
└── Wallpapers
```

Módulos identificados:

```text
Init.ps1
Hosts.ps1
Users.ps1
Users.bat
Personalizacion.ps1
Drivers-Lenovo.ps1
```

---

# Estado Objetivo

## TESSA v2.x

Arquitectura objetivo:

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
│
├── Logs
│
├── Documentacion
│
└── Pruebas
```

---

# Principios de Migración

## 1. Preservar Operación

Durante la migración ningún proceso actualmente funcional deberá perder capacidades o comportamientos previstos.

---

## 2. Mantener Nombres Funcionales

Los módulos conservarán sus nombres históricos:

```text
Init
Hosts
Users
Drivers-Lenovo
Personalizacion
```

Esto facilita la trazabilidad entre AIMT y TESSA.

---

## 3. Separar Lógica y Configuración

La lógica permanecerá dentro de Core.

La configuración se trasladará a Perfiles.

---

## 4. Eliminar Dependencias de AIMT

TESSA no conservará dependencias directas a:

```text
C:\AIMT
```

Todas las rutas deberán generarse dinámicamente.

---

# Inventario de Módulos

## Init

Estado:

Documentado

Responsabilidades:

- Instalación de aplicaciones.
- Configuración inicial del sistema.
- Renombrado del equipo.
- Instalación de componentes.

Migración:

```text
Dev\Init.ps1
↓
Core\Init
```

Estado:

Pendiente de refactorización.

---

## Hosts

Estado:

Documentado

Responsabilidades:

- Modificación del archivo Hosts.
- Implementación de restricciones corporativas.
- Actualización de caché DNS.

Migración:

```text
Dev\Hosts.ps1
↓
Core\Hosts
```

Estado:

Pendiente de desacoplamiento de configuraciones.

---

## Users (BAT)

Estado:

Documentado

Responsabilidades:

- Creación de usuario OperadorSIC.

Migración:

```text
Users.bat
↓
Histórico
```

Estado:

Producción.

---

## Users (PowerShell)

Estado:

Documentado

Responsabilidades:

- Evolución técnica del módulo Users.
- Base para futura implementación TESSA.

Migración:

```text
Users.ps1
↓
Core\Users
```

Estado:

Pendiente de desarrollo.

---

## Personalizacion

Estado:

Documentado

Responsabilidades:

- Fondo corporativo.
- Configuración de experiencia de usuario.
- Configuración de perfiles locales.

Migración:

```text
Dev\Personalizacion.ps1
↓
Core\Personalizacion
```

Estado:

Pendiente de desacoplamiento de recursos SIC.

---

## Drivers-Lenovo

Estado:

Documentado

Responsabilidades:

- Instalación automática de controladores Lenovo.

Migración:

```text
Dev\Drivers-Lenovo.ps1
↓
Core\Drivers-Lenovo
```

Estado:

Pendiente de separación entre lógica y repositorio de controladores.

---

# Dependencias Identificadas

## Aplicaciones

Actualmente:

```text
C:\AIMT\Apps
```

Destino:

```text
Perfiles\SIC\Aplicaciones
```

---

## Fondos Corporativos

Actualmente:

```text
C:\AIMT\Wallpapers
```

Destino:

```text
Perfiles\SIC\FondosPantalla
```

---

## Controladores

Actualmente:

```text
C:\AIMT\Controladores
```

Destino:

```text
Perfiles\SIC\Controladores
```

---

## Componentes

Actualmente:

```text
C:\AIMT\Componentes
```

Destino:

```text
Recursos\Componentes
```

---

# Hallazgos Técnicos

Durante la documentación se identificaron patrones comunes:

## Rutas Fijas

Presente en:

- Init
- Drivers-Lenovo
- Personalizacion

---

## Configuración Embebida

Presente en:

- Init
- Hosts
- Users
- Personalizacion

---

## Dependencia SIC

Presente en:

- Users
- Personalizacion
- Hosts

---

## Ausencia de Configuración Centralizada

Actualmente los parámetros operativos se encuentran distribuidos dentro de los scripts.

---

# Plan de Refactorización

## Fase 1

Documentación

Estado:

✅ Completada

Módulos documentados:

- Init
- Hosts
- Users-BAT
- Users-PS1
- Personalizacion
- Drivers-Lenovo

---

## Fase 2

Separación de Configuración

Objetivos:

- Crear estructura Perfiles\SIC.
- Extraer configuraciones embebidas.
- Definir archivos de configuración.

Estado:

Pendiente.

---

## Fase 3

Construcción del Core

Objetivos:

- Migración progresiva de módulos.
- Eliminación de rutas AIMT.
- Estandarización de logs.

Estado:

Pendiente.

---

## Fase 4

Orquestación

Objetivos:

Creación del lanzador principal:

```text
Start-TESSA.ps1
```

Estado:

Pendiente.

---

## Fase 5

Versión Oficial

Objetivo:

Liberación de:

```text
TESSA v2.0.0
```

como sucesor oficial de AIMT.

---

# Identidad del Proyecto

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

Esta identidad deberá utilizarse en:

- Consola.
- Logs.
- Documentación.
- Scripts.
- Interfaces futuras.

---

# Estado General de Migración

Documentación:

✅ Completada

Arquitectura:

✅ Definida

Migración de Código:

⏳ Pendiente

Refactorización:

⏳ Pendiente

TESSA v2.0:

⏳ En construcción