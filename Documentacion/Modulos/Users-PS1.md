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

Esta versión es la evolución técnica de Users.bat y constituye la base para la futura implementación definitiva del módulo dentro de TESSA.

---

## Ubicación

### Script

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Users.ps1
```

### Acceso Directo

```text
TESSA
└── Perfiles
    └── SIC
        └── Users.lnk
```

---

## Estado del Módulo

| Elemento | Estado |
|----------|----------|
| Migración a TESSA | Completa |
| Producción | Disponible |
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
- Preparar la futura evolución del módulo.

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

---

### Contraseña

La contraseña es definida durante la creación de la cuenta.

---

### Cuenta Sin Expiración

Aplica:

```text
/expires:never
```

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

---

### Registro de Actividades

Genera un archivo de log con:

- Equipo.
- Usuario ejecutor.
- Fecha.
- Resultado de ejecución.

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
├── Configuración de propiedades
├── Configuración de expiración
├── Configuración de contraseña
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

El módulo ahora registra sus resultados en:

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

## Riesgos Detectados

### Usuario Fijo

La cuenta:

```text
OperadorSIC
```

está definida directamente dentro del código.

---

### Contraseña Embebida

La contraseña continúa definida dentro del script.

---

### Sin Validación de Existencia

Actualmente no se verifica si la cuenta ya existe.

---

## Mejoras Futuras

### Prioridad Alta

- Validar existencia previa.
- Manejo avanzado de errores.
- Registro detallado de resultados.

---

### Prioridad Media

- Configuración parametrizable.
- Generación automática de contraseña.

---

### Prioridad Baja

- Administración centralizada.
- Integración con configuraciones futuras de TESSA.

---

## Relación con Users.bat

Actualmente existen dos implementaciones:

### Producción Histórica

```text
Users.bat
```

### Evolución Técnica

```text
Users.ps1
```

La implementación PowerShell está destinada a reemplazar definitivamente la versión Batch en futuras versiones del proyecto.

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