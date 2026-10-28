# Módulo Init

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Init
```

---

## Descripción

Init es el módulo principal de preparación y alistamiento de equipos dentro de TESSA.

Es responsable de ejecutar la instalación de aplicaciones corporativas, habilitar componentes del sistema operativo, aplicar configuraciones iniciales y preparar el equipo para su entrega o uso operativo.

Este módulo constituye el punto de entrada principal para el proceso de alistamiento del perfil SIC.

---

## Ubicación

### Motor del Módulo

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Init.ps1
```

### Lanzador

```text
TESSA
└── Perfiles
    └── SIC
        └── Init.cmd
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Init.cmd
```

El lanzador proporciona:

- Elevación automática a administrador mediante UAC.
- Ejecución de PowerShell con ExecutionPolicy Bypass.
- Compatibilidad con cualquier ubicación del proyecto.
- Resolución automática de rutas relativas.
- Independencia de rutas absolutas.

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

La ejecución no requiere modificaciones siempre que se conserve la estructura interna de TESSA.

---

## Estado del Módulo

| Elemento | Estado |
|----------|----------|
| Migración a TESSA | Completa |
| Producción | Operativo |
| Documentación | Completa |
| Refactorización | Parcial |
| Dependencia AIMT | Eliminada |

Versión actual:

```text
2.0.0-alpha
```

---

## Objetivos

- Automatizar el alistamiento inicial de equipos.
- Instalar aplicaciones corporativas.
- Habilitar componentes requeridos por Windows.
- Configurar parámetros básicos del sistema.
- Estandarizar la preparación de equipos.
- Reducir errores manuales.
- Mantener trazabilidad mediante registros de ejecución.

---

## Funcionalidades

### Generación de Alias de Equipo

Obtiene el serial del BIOS y genera un identificador visual.

Formato:

```text
BOGXXXXXX
```

Ejemplo:

```text
BOGABC123
```

Este identificador también se utiliza como nuevo nombre del equipo.

---

### Instalación de Aplicaciones

Actualmente administra la instalación de:

- 7-Zip
- Adobe Reader
- Google Chrome
- Java Runtime Environment (JRE)
- LibreOffice
- Jarvis Browser
- DeepL
- TightVNC
- Dell Command Update
- SupportAssist

---

### Habilitación de .NET Framework 3.5

Utiliza:

```text
DISM.exe
```

para habilitar la característica:

```text
NetFx3
```

a partir de los archivos almacenados localmente dentro de TESSA.

---

### Renombrado del Equipo

Aplica el nombre generado a partir del serial del BIOS.

Ejemplo:

```text
BOGABC123
```

---

### Etiquetado de Unidad

Configura la unidad:

```text
C:
```

con la etiqueta:

```text
Windows
```

---

### Registro de Actividades

Genera un log detallado de la ejecución.

Incluye:

- Inicio del proceso.
- Usuario ejecutor.
- Equipo procesado.
- Aplicaciones instaladas.
- Configuraciones aplicadas.
- Resumen final de ejecución.

---

## Aplicaciones Gestionadas

### Fase 1

Aplicaciones base:

- 7-Zip
- Adobe Reader
- Google Chrome
- Java Runtime Environment (JRE)
- LibreOffice

---

### Fase 2

Aplicaciones complementarias:

- Jarvis Browser
- DeepL

---

### Fase 3

Herramientas de soporte:

- TightVNC
- Dell Command Update
- SupportAssist

---

### Fase 4

Configuración del sistema:

- .NET Framework 3.5

---

## Estructura Asociada

### Perfil SIC

```text
Perfiles
└── SIC
```

---

### Aplicaciones

```text
Software
└── Aplicaciones
```

Archivos esperados:

```text
7z2603-x64.msi
AcroRdrDCx642600221931_MUI.exe
googlechromestandaloneenterprise64.msi
jre-8u503-windows-x64.exe
LibreOffice_26.8.0_Win_x86-64.msi
JarvisBrowser-Setup.exe
DeepLSetup.exe
tightvnc-2.8.88-gpl-setup-64bit.msi
SupportAssistLauncher.exe
system_update_5.08.04.85.exe
```

---

### Componentes

```text
Software
└── Componentes
    └── .NetFx3.5
```

---

### Logs

Ubicación:

```text
TESSA
└── Logs
```

Ejemplo:

```text
Init_BOGABC123.log
```

---

## Flujo de Ejecución

```text
Inicio
│
├── Preparación de entorno
├── Generación de alias del equipo
├── Inicialización del log
│
├── Fase 1
│   ├── 7-Zip
│   ├── Adobe Reader
│   ├── Google Chrome
│   ├── Java Runtime Environment
│   └── LibreOffice
│
├── Fase 2
│   ├── Jarvis Browser
│   └── DeepL
│
├── Fase 3
│   ├── TightVNC
│   ├── Dell Command Update
│   └── SupportAssist
│
├── Fase 4
│   └── .NET Framework 3.5
│
├── Renombrado del equipo
├── Etiquetado de unidad
├── Generación de resumen
│
└── Finalización
```

---

## Dependencias

### Sistema Operativo

Windows.

---

### Herramientas del Sistema

```text
DISM.exe
```

```text
msiexec.exe
```

---

### PowerShell

Comandos utilizados:

```powershell
Get-CimInstance
Get-Date
Start-Process
Resolve-Path
Join-Path
Out-File
Test-Path
New-Item
Rename-Computer
```

---

## Convención de Rutas TESSA

Las rutas se generan dinámicamente a partir de la ubicación del script.

Implementación:

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path
```

Resultado:

```text
TESSA
```

---

### Antes

```text
C:\AIMT\Apps
```

```text
C:\AIMT\Componentes
```

```text
C:\AIMT\Logs
```

---

### Ahora

```text
TESSA\Software\Aplicaciones
```

```text
TESSA\Software\Componentes
```

```text
TESSA\Logs
```

---

### Ventajas

- Eliminación de dependencias de AIMT.
- Portabilidad total.
- Compatibilidad con cualquier ubicación del proyecto.
- Despliegue simplificado.

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

Siempre que la estructura interna permanezca intacta.

---

## Historial AIMT

El historial ya no se almacena dentro del código.

Se conserva únicamente con fines documentales.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original BAT |
| 1.1.0 | Conversión inicial a PowerShell |
| 1.2.0 | Función Show-Block, ASCII y hostname personalizado |
| 1.2.1 | Registro de llamadas externas |
| 1.3.0 | Ejecución de rutinas externas |
| 1.3.3 | Ajustes de hostname, instaladores y pausa final |
| 1.3.4 | Actualización de instaladores |
| 1.3.5 | Ajuste de instalación de Java |
| 1.3.6 | Invocación directa de instaladores |
| 1.3.7 | Uso de Start-Process -Wait |
| 1.3.8 | Cambio de etiqueta del volumen C |
| 1.3.9 | Correcciones de mensajes y logs |
| 1.3.10 | Ajustes finales para DeepL y SupportAssist |

---

## Cambios Introducidos en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Init (Despliegue de Aplicaciones)
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Eliminación del Historial Interno

El historial deja de mantenerse dentro de los scripts.

La trazabilidad se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Eliminación de Dependencia AIMT

La dependencia:

```text
C:\AIMT
```

fue eliminada completamente.

---

### Sustitución de Accesos Directos

Los accesos directos tradicionales:

```text
*.lnk
```

fueron reemplazados por *anzadores:

```text
*.cmd
```

Ben*ficios:

- Compatibilidad con Git.*- Portabilidad.
- Facilidad de man*enimiento.
- Eliminación de rutas *bsolutas.
- Elevación automática a*administrador.

---

### Actualiza*ión de Rutas

Antes:

```text
C:\A*MT\Apps
```

Ahora:

```text
TESSA*Software\Aplicaciones
```

---

An*es:

```text
C:\AIMT\Componentes
`*`

Ahora:

```text
TESSA\Software\Componentes
```

---

Antes:

```text
C:\AIMT\Logs
```

Ahora:

```text
TESSA\Logs
```

---

## Riesgos Detectados

### Dependencia de Archivos

La ejecución depende de la disponibilidad de los instaladores dentro de:

```text
Software\Aplicaciones
```

---

### Instalaciones Interactivas

Algunos instaladores requieren interacción del usuario.

Ejemplo:

```text
DeepL
```

---

### Dependencia de Fabricante

Las herramientas:

```text
Dell Command Update
```

y

```text
SupportAssist
```

están orientadas a equipos Dell.

---

## Mejoras Futuras

### Prioridad Alta

- Validación previa de instaladores.
- Registro detallado de resultados.
- Manejo avanzado de errores.

---

### Prioridad Media

- Instalación condicional según fabricante.
- Verificación posterior de instalación.
- Inventario de software instalado.

---

### Prioridad Baja

- Catálogo configurable de aplicaciones.
- Integración con perfiles avanzados.
- Implementación de configuraciones dinámicas.

---

## Estado de Migración

### AIMT

✅ Funcionalidad migrada a TESSA.

---

### TESSA

✅ Módulo operativo.

✅ Rutas dinámicas implementadas.

✅ Logs implementados.

✅ Lanzador CMD portable implementado.

✅ Compatible con cualquier ubicación del proyecto.

Versión actual:

```text
2.0.0-alpha
```

Próximas actividades:

- Optimización.
- Refactorización progresiva.
- Validaciones avanzadas.

---

## Responsable

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