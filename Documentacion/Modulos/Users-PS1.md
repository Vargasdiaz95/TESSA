# Módulo Users (PowerShell)

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Users
```

---

## Descripción

Users.ps1 representa la implementación PowerShell del módulo de administración de usuarios del perfil SIC.

Su objetivo es crear y configurar automáticamente la cuenta operativa estándar utilizada durante el proceso de alistamiento de equipos.

Esta versión constituye la evolución técnica de Users.bat y representa la base sobre la cual se construirá la implementación definitiva del módulo dentro de TESSA.

---

## Ubicación

### Motor del Módulo

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Users.ps1
```

### Lanzador

```text
TESSA
└── Perfiles
    └── SIC
        └── Users.cmd
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Users.cmd
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
| Evolución futura | Activa |
| Dependencia AIMT | Eliminada |

Versión actual:

```text
2.0.0-alpha
```

---

## Objetivos

- Crear el usuario operativo estándar.
- Configurar propiedades avanzadas de la cuenta.
- Reducir tareas manuales.
- Generar trazabilidad mediante logs.
- Preparar la evolución futura del módulo.

---

## Funcionalidades

### Creación de Usuario

Actualmente crea:

```text
OperadorSIC
```

---

### Nombre Completo

Configura:

```text
Operador SIC
```

como nombre descriptivo de la cuenta.

---

### Contraseña

La contraseña es definida durante la creación inicial del usuario.

---

### Cuenta Sin Expiración

Aplica:

```text
/expires:never
```

para garantizar que la cuenta no expire automáticamente.

---

### Contraseña Sin Expiración

Utiliza:

```powershell
Set-LocalUser
```

para garantizar:

```text
PasswordNeverExpires
```

---

### Restricción de Cambio de Contraseña

Aplica:

```text
/passwordchg:no
```

impidiendo que el usuario modifique su contraseña.

---

### Registro de Actividades

Genera un archivo de log con:

- Equipo procesado.
- Usuario ejecutor.
- Fecha y hora de ejecución.
- Resultado del proceso.

---

## Flujo de Ejecución

```text
Inicio
│
├── Preparación del entorno
├── Generación del alias visual
├── Inicialización del log
│
├── Creación de usuario
├── Configuración de nombre completo
├── Configuración de expiración
├── Configuración de contraseña
├── Configuración avanzada de la cuenta
│
├── Registro de resultado
│
└── Finalización
```

---

## Usuario Administrado

### Nombre

```text
OperadorSIC
```

### Nombre Completo

```text
Operador SIC
```

### Configuración

| Parámetro | Valor |
|------------|------------|
| Cuenta Local | Sí |
| Expira | No |
| Contraseña Expira | No |
| Cambio de Contraseña | No |

---

## Dependencias

### Sistema Operativo

Windows.

---

### PowerShell

Comandos utilizados:

```powershell
Get-CimInstance
Get-Date
Set-LocalUser
Resolve-Path
Join-Path
Test-Path
New-Item
Out-File
```

---

### Herramientas del Sistema

```text
net.exe
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
Users_BOGABC123.log
```

---

## Historial AIMT

El historial deja de existir dentro del script.

Se conserva únicamente en la documentación.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original Batch |
| 1.1.0 | Conversión a PowerShell |
| 1.1.1 | Contraseña nunca expira |
| 1.1.2 | Reemplazo de Pause por Read-Host |

---

## Cambios Introducidos en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Rutina de Creacion de Usuario
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Incorporación de Logs

El módulo registra sus resultados en:

```text
TESSA\Logs
```

---

### Eliminación del Historial Interno

La gestión de cambios se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Eliminación de Dependencia AIMT

Las referencias a AIMT fueron eliminadas completamente.

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

## *iesgos Detectados

### Usuario Fij*

La cuenta:

```text
OperadorSIC
*``

está definida directamente den*ro del código.

---

### Contraseñ* Embebida

La contraseña continúa *efinida dentro del script.

---

#*# Sin Validación de Existencia

Ac*ualmente no se verifica si la cuen*a ya existe antes de intentar crea*la.

---

## Mejoras Futuras

### *rioridad Alta

- Validar existenci* previa.
- Manejo avanzado de erro*es.
- Registro detallado de result*dos.

---

### Prioridad Media

- *onfiguración parametrizable.
- Gen*ración automática de contraseña.
-*Configuración externa de credencia*es.

---

### Prioridad Baja

- Ad*inistración centralizada.
- Integr*ción con futuras configuraciones d* TESSA.

---

## Relación con User*.bat

Actualmente existen dos impl*mentaciones del módulo.

### Imple*entación Histórica

```text
Users.*at
```

---

### Implementación Ev*lutiva

```text
Users.ps1
```

La implementación PowerShell está destinada a convertirse en el reemplazo definitivo de la versión Batch en futuras versiones de TESSA.

---

## Estado de Migración

### AIMT

✅ Funcionalidad migrada a TESSA.

---

### TESSA

✅ Módulo operativo.

✅ Logs implementados.

✅ Lanzador CMD portable implementado.

✅ Compatible con cualquier ubicación del proyecto.

✅ Preparado para evolución futura.

Versión actual:

```text
2.0.0-alpha
```

Próximas actividades:

- Consolidación funcional.
- Mejora de validaciones.
- Sustitución progresiva de Users.bat.

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