# Módulo Hosts

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Hosts
```

---

## Descripción

Hosts es el módulo encargado de administrar el archivo Hosts de Windows utilizado por el perfil SIC.

Su función principal es aplicar restricciones corporativas mediante redirecciones locales hacia la dirección de loopback, bloqueando el acceso a servicios específicos desde el equipo.

---

## Ubicación

### Script

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Hosts.ps1
```

### Acceso Directo

```text
TESSA
└── Perfiles
    └── SIC
        └── Hosts.lnk
```

---

## Estado del Módulo

| Elemento | Estado |
|----------|----------|
| Migración a TESSA | Completa |
| Producción | Activo |
| Documentación | Completa |
| Refactorización | Parcial |
| Dependencia AIMT | Eliminada |

Versión actual:

```text
2.0.0-alpha
```

---

## Objetivos

- Aplicar restricciones corporativas.
- Gestionar el archivo Hosts.
- Bloquear dominios definidos por SIC.
- Actualizar la caché DNS.
- Generar trazabilidad mediante registros.

---

## Funcionalidades

### Gestión del Archivo Hosts

Administra el archivo:

```text
%windir%\System32\drivers\etc\hosts
```

---

### Bloqueo de Dominios

Redirecciona dominios hacia:

```text
127.0.0.1
```

con el objetivo de impedir el acceso desde el equipo.

---

### Actualización DNS

Después de aplicar cambios ejecuta:

```text
ipconfig /flushdns
```

para limpiar la caché DNS.

---

### Registro de Actividades

Genera un log con:

- Usuario.
- Alias del equipo.
- Hora de ejecución.
- Resultado del proceso.

---

## Dominios Gestionados Actualmente

### Plataformas de Video

- Netflix
- Disney+
- Prime Video
- HBO Max
- Paramount+
- Hulu
- Apple TV
- Star+
- Crunchyroll
- YouTube

---

### Mensajería

- WhatsApp Web
- WhatsApp API
- Chat WhatsApp

---

## Flujo de Ejecución

```text
Inicio
│
├── Configuración de entorno
├── Generación de alias
├── Inicialización de log
│
├── Actualización del archivo Hosts
├── Limpieza de DNS
│
├── Registro de resultado
│
└── Finalización
```

---

## Dependencias

### Sistema Operativo

Windows.

---

### Archivo Hosts

```text
%windir%\System32\drivers\etc\hosts
```

---

### Herramientas del Sistema

```text
ipconfig.exe
```

---

### PowerShell

Comandos utilizados:

```powershell
Add-Content
Get-CimInstance
Get-Date
Resolve-Path
Join-Path
Out-File
Test-Path
New-Item
```

---

## Convención de Rutas TESSA

Implementación actual:

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path
```

---

### Logs

Ubicación:

```text
TESSA\Logs
```

Ejemplo:

```text
Hosts_BOGABC123.log
```

---

## Historial AIMT

El historial ya no se almacena dentro del script.

Se conserva únicamente como documentación.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original en Batch |
| 1.1.0 | Migración a PowerShell |
| 1.1.1 | Ampliación de plataformas bloqueadas |

---

## Cambios Implementados en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Rutina de Actualización de Hosts
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Eliminación de Dependencia AIMT

La dependencia:

```text
C:\AIMT
```

fue eliminada completamente.

---

### Eliminación del Historial Interno

La trazabilidad se gestiona mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Incorporación de Logs

Se incorpora registro formal de ejecución dentro de:

```text
TESSA\Logs
```

---

## Riesgos Detectados

### Duplicación de Entradas

Actualmente el script agrega registros sin validar si ya existen.

Ejecuciones repetidas pueden generar entradas duplicadas.

---

### Ausencia de Respaldo

No se realiza copia de seguridad del archivo Hosts antes de modificarlo.

---

### Configuración Embebida

Los dominios bloqueados se encuentran definidos directamente dentro del código.

---

## Mejoras Futuras

### Prioridad Alta

- Validar dominios existentes.
- Evitar duplicados.
- Generar respaldo automático.

---

### Prioridad Media

- Externalizar dominios bloqueados.
- Reporte estructurado de cambios.

---

### Prioridad Baja

- Gestión dinámica por perfiles.
- Listas administrables desde configuración.

---

## Estado de Migración

### AIMT

✅ Migración completada.

---

### TESSA

✅ Módulo operativo.

Versión actual:

```text
2.0.0-alpha
```

---

## Responsable

```text
Somos TSS CO.
```

Proyecto:

```text
TESSA
Tecnossystem Smart Setup Assistant
```