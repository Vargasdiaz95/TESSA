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

### Motor del Módulo

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Hosts.ps1
```

### Lanzador

```text
TESSA
└── Perfiles
    └── SIC
        └── Hosts.cmd
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Hosts.cmd
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

### Actualización de Caché DNS

Después de aplicar los cambios ejecuta:

```text
ipconfig /flushdns
```

para limpiar la caché DNS del sistema.

---

### Registro de Actividades

Genera un log con:

- Usuario ejecutor.
- Alias visual del equipo.
- Fecha y hora de ejecución.
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

### Plataformas de Mensajería

- WhatsApp Web
- WhatsApp API
- Chat WhatsApp

---

## Flujo de Ejecución

```text
Inicio
│
├── Configuración de entorno
├── Generación de alias visual
├── Inicialización del log
│
├── Actualización del archivo Hosts
├── Aplicación de dominios bloqueados
├── Limpieza de caché DNS
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

Las rutas se generan dinámicamente a partir de la ubicación del script.

Implementación actual:

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path
```

Resultado:

```text
TESSA
```

---

### Ventajas

- Portabilidad total.
- Eliminación de dependencias de AIMT.
- Compatibilidad con cualquier ubicación del proyecto.
- Facilidad de despliegue.

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

## Logs

Ubicación:

```text
TESSA
└── Logs
```

Ejemplo:

```text
Hosts_BOGABC123.log
```

---

## Historial AIMT

El historial ya no se almacena dentro del script.

Se conserva únicamente con fines documentales.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original en Batch |
| 1.1.0 | Migración a PowerShell |
| 1.1.1 | Ampliación de plataformas bloqueadas |

---

## Cambios Introducidos en TESSA

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

### Eliminación del Historial Interno

La trazabilidad se gestiona mediante:

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

Ben*f*cios:

- Compatibilidad con Git.
-*Portabilidad.
- Facilidad de mante*imiento.
- Eliminación de rutas ab*olutas.
- Elevación automática*a administrador.

---

### Incorpo*ación de Logs

Se incorporó regist*o formal de ejecución*dentro de:

```text
TESSA\Logs
```*
---

## Riesgos Detectados

### D*plicación de Entradas

Actualmente*el script agrega registros sin val*dar si ya existen.

Ejecuciones re*etidas pueden generar entradas dup*icadas dentro del archivo Hosts.

*--

### Ausencia de Respaldo

No s* realiza copia de seguridad del ar*hivo Hosts antes de modificarlo.

*--

### Configuración Embebida

Lo* dominios bloqueados se encuentran*definidos directamente dentro del *ódigo.

---

## Mejoras Futuras

#*# Prioridad Alta

- Validar domini*s existentes antes de agregarlos.
* Evitar entradas duplicadas.
- Gen*rar respaldo automático del archiv* Hosts.

---

### Prioridad Media
*- Externalizar dominios bloqueados*
- Generar reportes estructurados *e cambios.

---

### Prioridad Baj*

- Gestión dinámica por perfiles.*- Listas administrables mediante c*nfiguración externa.

---

## Esta*o de Migración

### AIMT

✅ Funcio*alidad migrada a TESSA.

---

### *ESSA

✅ Módulo operativo.

✅ Rutas*dinámicas implementadas.

✅ Logs i*plementados.

✅ Lanzador CMD porta*le implementado.

✅ Compatible con*cualquier ubicación del proyecto.
*Versión actual:

```text
2.0.0-alp*a
```

---

## Responsable

```tex*
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