# Arquitectura TESSA

## Identidad de la Plataforma

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

## Visión

TESSA (Tecnossystem Smart Setup Assistant) es una plataforma diseñada para automatizar, estandarizar y documentar los procesos de alistamiento, configuración, personalización, soporte e instalación de software en equipos Windows.

TESSA representa la evolución tecnológica de AIMT (Asistente de Instalación y Mejoras Tecnossystem), transformando una colección de scripts operativos en una plataforma organizada, portable, modular y mantenible.

La arquitectura actual está orientada a:

- Reutilización.
- Portabilidad.
- Escalabilidad.
- Mantenibilidad.
- Trazabilidad.
- Automatización.

---

# Objetivos Arquitectónicos

- Estandarizar los procesos de alistamiento de equipos.
- Reducir tareas manuales repetitivas.
- Centralizar recursos y documentación.
- Eliminar dependencias de rutas absolutas.
- Facilitar la evolución del proyecto.
- Permitir soporte para múltiples perfiles corporativos.
- Mantener compatibilidad con la operación actual.
- Garantizar trazabilidad mediante logs y documentación.

---

# Evolución del Proyecto

## AIMT v1.x

Arquitectura original:

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

Características:

- Dependencia absoluta de:

```text
C:\AIMT
```

- Uso de accesos directos `.lnk`.
- Configuraciones embebidas.
- Escasa documentación.
- Sin arquitectura formal.

---

## TESSA v2.0.0-alpha

Arquitectura actual:

```text
TESSA
│
├── Perfiles
│   └── SIC
│       │
│       ├── Core
│       │   ├── Init.ps1
│       │   ├── Hosts.ps1
│       │   ├── Personalizacion.ps1
│       │   ├── Users.ps1
│       │   └── Users.bat
│       │
│       ├── Init.cmd
│       ├── Hosts.cmd
│       ├── Personalizacion.cmd
│       ├── Users.cmd
│       ├── Users_Bat.cmd
│       │
│       └── Wallpapers
│           ├── sic-lockscreen.jpg
│           ├── sic-logo.png
│           ├── sic-wallpaper.jpeg
│           └── thumb-imgpsh_fullsize_anim.png
│
├── Controladores
│   │
│   ├── Core
│   │   └── Drivers-Lenovo.ps1
│   │
│   ├── Drivers-Lenovo.cmd
│   │
│   ├── Lenovo
│   └── Dell
│
├── Software
│   ├── Aplicaciones
│   └── Componentes
│       └── .NetFx3.5
│
├── Logs
│
├── Documentacion
│   ├── Arquitectura
│   └── Modulos
│
├── Pruebas
│
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
└── .gitignore
```

---

# Principios de Diseño

## Modularidad

Cada funcionalidad se implementa como un módulo independiente.

Ejemplos:

```text
Init
Hosts
Users
Personalizacion
Drivers-Lenovo
```

---

## Portabilidad

TESSA no depende de ubicaciones específicas del sistema.

Ejemplos válidos:

```text
C:\TESSA
```

```text
D:\TESSA
```

```text
E:\Herramientas\TESSA
```

```text
F:\USB\TESSA
```

---

## Reutilización

Los módulos deben poder utilizarse sin depender de otras implementaciones específicas.

---

## Mantenibilidad

La documentación, los logs y la organización del código deben facilitar la evolución del proyecto.

---

## Trazabilidad

Toda modificación debe ser rastreable mediante:

- Git.
- Commits.
- Documentación.
- Logs.

---

# Componentes Principales

## Perfiles

Los perfiles contienen configuraciones y recursos específicos de una organización.

Actualmente:

```text
SIC
```

es el perfil operativo principal.

---

### Responsabilidades

- Fondos corporativos.
- Configuración específica.
- Lanzadores operativos.
- Scripts asociados al perfil.

---

## Core del Perfil

Ubicación:

```text
Perfiles\SIC\Core
```

Contiene:

```text
Init.ps1
Hosts.ps1
Personalizacion.ps1
Users.ps1
Users.bat
```

Estos archivos representan la lógica operativa principal del perfil SIC.

---

## Controladores

Ubicación:

```text
Controladores
```

Responsable de la gestión de drivers.

Actualmente:

```text
Drivers-Lenovo.ps1
```

---

### Responsabilidades

- Detección de controladores.
- Instalación de drivers.
- Gestión de repositorios.
- Generación de logs.

---

## Software

Ubicación:

```text
Software
```

Repositorio central de recursos instalables.

---

### Aplicaciones

```text
Software\Aplicaciones
```

Ejemplos:

- Google Chrome.
- Adobe Reader.
- LibreOffice.
- TightVNC.
- Jarvis Browser.
- DeepL.

---

### Componentes

```text
Software\Componentes
```

Ejemplo actual:

```text
.NetFx3.5
```

---

## Logs

Ubicación:

```text
Logs
```

Centraliza los registros generados por todos los módulos.

Ejemplos:

```text
Init_BOGABC123.log
```

```text
Hosts_BOGABC123.log
```

```text
Personalizacion_BOGABC123.log
```

```text
Users_BOGABC123.log
```

```text
Drivers-Lenovo_BOGABC123.log
```

---

## Documentación

Ubicación:

```text
Documentacion
```

Subdirectorios:

```text
Arquitectura
```

```text
Modulos
```

---

### Arquitectura

Documentos estructurales del proyecto.

Ejemplos:

```text
Arquitectura-TESSA.md
```

```text
Mapa-Migracion-AIMT-TESSA.md
```

---

### Módulos

Documentación individual de cada componente.

Ejemplos:

```text
Init.md
```

```text
Hosts.md
```

```text
Personalizacion.md
```

```text
Users-BAT.md
```

```text
Users-PS1.md
```

```text
Drivers-Lenovo.md
```

---

# Sistema de Lanzadores

## Objetivo

Permitir la ejecución simple de módulos mediante doble clic.

---

## Tecnología Adoptada

```text
CMD autoelevable
```

Sustituyendo:

```text
LNK
```

---

## Beneficios

- Compatible con Git.
- Portable.
- Editable.
- Fácil mantenimiento.
- Eliminación de rutas absolutas.

---

## Ejemplos

```text
Init.cmd
```

```text
Hosts.cmd
```

```text
Personalizacion.cmd
```

```text
Users.cmd
```

```text
Users_Bat.cmd
```

```text
Drivers-Lenovo.cmd
```

---

# Gestión de Rutas

## Arquitectura AIMT

Dependencia histórica:

```text
C:\AIMT
```

---

## Arquitectura TESSA

Implementación estándar:

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path
```

o

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..").Path
```

según el módulo.

---

## Beneficios

- Portabilidad total.
- Eliminación de configuraciones manuales.
- Compatibilidad con múltiples ubicaciones.

---

# Estado de la Migración

## Documentación

✅ Completada.

---

## Migración de Código

✅ Completada.

Módulos migrados:

- Init
- Hosts
- Personalizacion
- Users-BAT
- Users-PS1
- Drivers-Lenovo

---

## Eliminación de Dependencias AIMT

✅ Completada.

---

## Rutas Dinámicas

✅ Implementadas.

---

## Lanzadores CMD

✅ Implementados.

---

## Logs

✅ Implementados.

---

# Roadmap Arquitectónico

## Versión 2.0.0-alpha

✅ Arquitectura definida.

✅ Migración completada.

✅ Documentación completada.

✅ Portabilidad implementada.

---

## Versión 2.0.0-beta

Objetivos:

- Optimización de módulos.
- Validaciones avanzadas.
- Refactorización de configuraciones.
- Reducción de código duplicado.

---

## Versión 2.0.0

Objetivos:

- Estabilización completa.
- Consolidación de módulos.
- Operación productiva permanente.

---

## Versiones Futuras

Elementos proyectados:

```text
Inventario
```

```text
Utilidades
```

```text
Start-TESSA.ps1
```

```text
Configuración centralizada
```

---

# Identidad del Proyecto

## Identidad Operativa

Utilizada en:

- Consola.
- Scripts.
- Logs.
- Lanzadores.

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

## Identidad Institucional

Utilizada en:

- Documentación.
- Repositorio.
- Manuales.

```text
Tecnossystem Co.
```

---

# Responsable

```text
Fabian R. Vargas
```

Organización:

```text
Tecnossystem Co.
```

Proyecto:

```text
TESSA
Tecnossystem Smart Setup Assistant
```