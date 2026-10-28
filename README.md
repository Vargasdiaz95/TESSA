# TESSA

## Tecnossystem Smart Setup Assistant

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

TESSA es una plataforma desarrollada por Tecnossystem Co. para automatizar, estandarizar y documentar los procesos de alistamiento, configuración, personalización, soporte e instalación de software en equipos Windows.

Nace como la evolución tecnológica de AIMT (Asistente de Instalación y Mejoras Tecnossystem), transformando una colección de scripts operativos en una plataforma portable, modular, documentada y mantenible.

Actualmente TESSA constituye la herramienta oficial de automatización para los procesos de preparación y soporte de equipos gestionados por Tecnossystem Co.

---

# Objetivo

Estandarizar y automatizar las actividades técnicas requeridas durante la preparación y entrega de equipos corporativos, reduciendo tiempos operativos, minimizando errores manuales y facilitando la administración de configuraciones específicas.

Objetivos principales:

- Automatizar procesos de alistamiento.
- Reducir tareas repetitivas.
- Mejorar la consistencia de las configuraciones.
- Centralizar recursos técnicos.
- Facilitar la trazabilidad operativa.
- Permitir la evolución controlada del proyecto.

---

# Estado del Proyecto

Versión actual:

```text
2.0.0-alpha
```

Estado general:

```text
Operativo
```

Migración AIMT → TESSA:

```text
Completada
```

Situación actual:

✅ Arquitectura definida.

✅ Migración de código completada.

✅ Rutas dinámicas implementadas.

✅ Logs implementados.

✅ Documentación técnica completada.

✅ Lanzadores CMD autoelevables implementados.

✅ Eliminación de dependencias de AIMT.

---

# Características

## Automatización

- Instalación de aplicaciones.
- Instalación de componentes Windows.
- Configuración de usuarios.
- Personalización corporativa.
- Instalación de controladores.
- Configuración del archivo Hosts.

---

## Portabilidad

TESSA puede ejecutarse desde cualquier ubicación:

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

sin necesidad de modificar el código fuente.

---

## Trazabilidad

Todos los módulos generan registros de operación.

Ejemplos:

```text
Init_BOGABC123.log
```

```text
Hosts_BOGABC123.log
```

```text
Users_BOGABC123.log
```

```text
Drivers-Lenovo_BOGABC123.log
```

---

## Documentación

La plataforma mantiene documentación completa de:

- Arquitectura.
- Migración.
- Módulos.
- Convenciones.
- Contribuciones.
- Versionamiento.

---

# Arquitectura General

Estructura actual:

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

# Módulos Disponibles

## Init

Responsable de:

- Instalación de aplicaciones.
- Habilitación de .NET Framework 3.5.
- Renombrado del equipo.
- Configuración inicial del sistema.

Estado:

```text
Operativo
```

---

## Hosts

Responsable de:

- Administración del archivo Hosts.
- Implementación de restricciones corporativas.
- Actualización de caché DNS.

Estado:

```text
Operativo
```

---

## Personalizacion

Responsable de:

- Fondos corporativos.
- Ajustes de experiencia de usuario.
- Configuración de perfiles locales.

Estado:

```text
Operativo
```

---

## Users (BAT)

Responsable de:

- Creación del usuario OperadorSIC.

Estado:

```text
Operativo
```

---

## Users (PowerShell)

Responsable de:

- Evolución del módulo de usuarios.
- Configuración avanzada de cuentas.
- Implementación futura definitiva.

Estado:

```text
Operativo
```

---

## Drivers-Lenovo

Responsable de:

- Instalación de controladores Lenovo.
- Gestión de repositorios de drivers.
- Generación de registros de instalación.

Estado:

```text
Operativo
```

---

# Sistema de Ejecución

TESSA utiliza lanzadores CMD autoelevables.

Ejemplos:

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

Beneficios:

- Elevación automática mediante UAC.
- Compatibilidad con Git.
- Eliminación de archivos LNK.
- Portabilidad total.

---

# Sistema de Logs

Ubicación:

```text
TESSA\Logs
```

Objetivos:

- Auditoría.
- Diagnóstico.
- Soporte.
- Trazabilidad.

Todos los módulos generan registros estandarizados.

---

# Documentación

Ubicación:

```text
Documentacion
```

### Arquitectura

```text
Arquitectura-TESSA.md
```

```text
Mapa-Migracion-AIMT-TESSA.md
```

### Módulos

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

# Roadmap

## v2.0.0-alpha

✅ Migración AIMT → TESSA.

✅ Eliminación de dependencias AIMT.

✅ Portabilidad completa.

✅ Implementación de logs.

✅ Documentación técnica.

---

## v2.0.0-beta

Objetivos:

- Optimización de módulos.
- Validaciones avanzadas.
- Reducción de código duplicado.
- Parametrización de configuraciones.
- Inicio de pruebas funcionales integrales.

---

## v2.0.0

Objetivos:

- Versión estable.
- Consolidación operativa.
- Refactorización completada.
- Validación de producción.

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

```text
Soporte multiempresa
```

---

# Tecnologías Utilizadas

## Lenguajes

```text
PowerShell
```

```text
Batch
```

```text
Markdown
```

---

## Herramientas

```text
DISM
```

```text
PnPUtil
```

```text
Net.exe
```

```text
Git
```

---

# Contribuciones

Las contribuciones deben seguir las directrices establecidas en:

```text
CONTRIBUTING.md
```

---

# Licencia

TESSA es software propietario de uso interno.

Licencia aplicable:

```text
Tecnossystem Internal Use License (TIUL) v1.0
```

Consultar el archivo:

```text
LICENSE
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