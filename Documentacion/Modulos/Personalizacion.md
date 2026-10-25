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

### Script

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Personalizacion.ps1
```

### Acceso Directo

```text
TESSA
└── Perfiles
    └── SIC
        └── Personalizacion.lnk
```

### Recursos Utilizados

```text
TESSA
└── Perfiles
    └── SIC
        └── Wallpapers
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

permitiendo que todos los usuarios creados posteriormente hereden las personalizaciones.

---

### Configuración de Usuarios Existentes

Recorre:

```text
C:\Users
```

y aplica configuraciones a los usuarios existentes.

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

---

### Porcentaje de Batería

Habilita:

```text
ShowPercentage
```

cuando el sistema operativo soporta dicha característica.

---

### Gestión de NTUSER.DAT

Carga temporalmente los perfiles de usuario para aplicar configuraciones sin necesidad de inicio de sesión.

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
├── Generación de alias
├── Inicialización de log
│
├── Copia de wallpaper
│
├── Configuración Default User
│   ├── Wallpaper
│   ├── Predicción de texto
│   └── Porcentaje batería
│
├── Recorrido de usuarios
│
├── Aplicación de configuraciones
│   ├── Wallpaper
│   ├── Predicción de texto
│   └── Porcentaje batería
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

Implementación actual:

```powershell
$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path
```

---

### Antes

```text
C:\AIMT\Wallpapers
```

---

### Ahora

```text
Perfiles\SIC\Wallpapers
```

---

### Logs

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

El historial deja de existir dentro del código.

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

### Eliminación de Dependencia AIMT

La referencia:

```text
C:\AIMT\Wallpapers
```

fue eliminada completamente.

---

### Incorporación de Logs

Se incorpora registro de ejecución dentro de:

```text
TESSA\Logs
```

---

### Eliminación del Historial Interno

La trazabilidad se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

## Riesgos Detectados

### Dependencia de Recursos

La ejecución depende de la existencia de los fondos corporativos.

---

### Configuración de Registro

Requiere permisos administrativos.

---

### Exclusiones Fijas

Los usuarios excluidos están definidos directamente en el script.

---

## Mejoras Futuras

### Prioridad Alta

- Validación previa de recursos gráficos.
- Registro detallado de configuraciones aplicadas.

---

### Prioridad Media

- Configuración dinámica de recursos.
- Soporte para perfiles adicionales.

---

### Prioridad Baja

- Cambio automático de pantalla de bloqueo.
- Aplicación de branding corporativo avanzado.

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