# Módulo Personalizacion

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Personalizacion
```

---

## Descripción

Personalizacion es el módulo encargado de aplicar la configuración visual corporativa y determinados ajustes de experiencia de usuario en Windows para el perfil SIC.

Su objetivo es estandarizar la apariencia y la configuración básica de todos los perfiles de usuario del equipo.

---

## Ubicación

### Motor del Módulo

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Personalizacion.ps1
```

### Lanzador

```text
TESSA
└── Perfiles
    └── SIC
        └── Personalizacion.cmd
```

### Recursos Utilizados

```text
TESSA
└── Perfiles
    └── SIC
        └── Wallpapers
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Personalizacion.cmd
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

- Aplicar fondos corporativos.
- Configurar perfiles existentes.
- Configurar perfiles futuros.
- Estandarizar la experiencia de usuario.
- Aplicar configuraciones de productividad.
- Automatizar ajustes de Windows.

---

## Funcionalidades

### Configuración de Fondo Corporativo

Actualmente utiliza:

```text
thumb-imgpsh_fullsize_anim.png
```

Ubicación:

```text
Perfiles\SIC\Wallpapers
```

Destino:

```text
C:\Windows\Web\Screen
```

---

### Configuración de Nuevos Usuarios

Aplica configuraciones sobre:

```text
HKU\.DEFAULT
```

permitiendo que todos los usuarios creados posteriormente hereden las personalizaciones definidas por la organización.

---

### Configuración de Usuarios Existentes

Recorre:

```text
C:\Users
```

y aplica las configuraciones a los perfiles existentes del sistema.

---

### Usuarios Excluidos

Actualmente:

```text
Default
Public
Administrador
AdminSIC
```

---

### Sugerencias de Texto

Habilita:

```text
EnableHwkbTextPrediction
```

y

```text
EnableHwkbTextPredictionMultilingual
```

para mejorar la experiencia de escritura en Windows.

---

### Porcentaje de Batería

Habilita:

```text
ShowPercentage
```

cuando la versión de Windows y el hardware soportan dicha funcionalidad.

---

### Gestión de NTUSER.DAT

Carga temporalmente los perfiles de usuario para aplicar configuraciones sin necesidad de iniciar sesión con cada cuenta.

---

## Recursos Utilizados

Actualmente se encuentran disponibles:

```text
sic-lockscreen.jpg
sic-logo.png
sic-wallpaper.jpeg
thumb-imgpsh_fullsize_anim.png
```

---

## Flujo de Ejecución

```text
Inicio
│
├── Configuración de entorno
├── Generación de alias visual
├── Inicialización del log
│
├── Copia de wallpaper corporativo
│
├── Configuración Default User
│   ├── Wallpaper
│   ├── Predicción de texto
│   └── Porcentaje de batería
│
├── Recorrido de usuarios existentes
│
├── Aplicación de configuraciones
│   ├── Wallpaper
│   ├── Predicción de texto
│   └── Porcentaje de batería
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

### Registro de Windows

```text
HKU\.DEFAULT
```

```text
HKU\TempHive
```

---

### Sistema de Archivos

```text
C:\Users
```

```text
C:\Windows\Web\Screen
```

---

### PowerShell

Comandos utilizados:

```powershell
Get-CimInstance
Get-ChildItem
Copy-Item
Resolve-Path
Join-Path
Test-Path
Out-File
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

### Antes

```text
C:\AIMT\Wallpapers
```

---

### Ahora

```text
TESSA\Perfiles\SIC\Wallpapers
```

---

### Ventajas

- Eliminación de dependencias de AIMT.
- Portabilidad total.
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
TESSA\Logs
```

Ejemplo:

```text
Personalizacion_BOGABC123.log
```

---

## Historial AIMT

El historial ya no se almacena dentro del código.

Se conserva únicamente mediante documentación.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original Batch |
| 1.1.0 | Conversión a PowerShell |
| 1.1.1 | Incorporación de pausa final |

---

## Cambios Introducidos en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Rutina de Personalización de Entorno
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Eliminación del Historial Interno

La trazabilidad se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Eliminación de Dependencia AIMT

La referencia:

```text
C:\AIMT\Wallpapers
```

fue eliminada completamente.

---

### Sustitución de Accesos Directos

Los accesos directos tradicionales:

```text
*.lnk
```

fueron reempla*ados por lanzadores:

```text
*.cm*
```

Beneficios:

- Compatibilida* con Git.
- Portabilidad.
- Facili*ad de mantenimiento.
- Eliminación*de rutas absolutas.
- Elevación au*omática a administrador.

---

###*Incorporación de Logs

Se incorpor* registro de ejecución dentro de:
*```text
TESSA\Logs
```

---

## Ri*sgos Detectados

### Dependencia d* Recursos

La ejecución depende de*la existencia de los fondos corpor*tivos definidos en el repositorio.

---

### Configuración de Registro

Requiere permisos administrativos para aplicar modificaciones al registro y a los perfiles de usuario.

---

### Exclusiones Fijas

Los usuarios excluidos se encuentran definidos directamente dentro del script.

---

## Mejoras Futuras

### Prioridad Alta

- Validación previa de recursos gráficos.
- Registro detallado de configuraciones aplicadas.
- Verificación automática de integridad de recursos.

---

### Prioridad Media

- Configuración dinámica de recursos.
- Soporte para perfiles adicionales.
- Aplicación condicional según perfil corporativo.

---

### Prioridad Baja

- Cambio automático de pantalla de bloqueo.
- Aplicación de branding corporativo avanzado.
- Gestión centralizada de configuraciones visuales.

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
- Implementación de configuraciones dinámicas.

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