# Módulo ConfigManager

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: ConfigManager
```

---

## Descripción

ConfigManager es el componente responsable de administrar el acceso a la configuración de TESSA.

Actúa como una capa de abstracción entre los módulos del Core y los perfiles de configuración, permitiendo que la lógica de negocio sea independiente de la información específica de cada organización.

---

## Origen

Módulo nativo de TESSA.

No existe equivalente en AIMT.

Fue creado como parte de la arquitectura v2 para soportar la separación entre:

```text
Código
```

y

```text
Configuración
```

---

## Objetivos

- Centralizar la lectura de configuraciones.
- Reducir duplicación de código.
- Facilitar el soporte de múltiples perfiles.
- Validar la existencia de archivos de configuración.
- Proporcionar acceso uniforme a los datos.
- Desacoplar los módulos del Core de las rutas físicas.

---

## Responsabilidades

### Gestión de Perfiles

Determinar cuál es el perfil activo.

Ejemplo:

```text
SIC
```

---

### Resolución de Rutas

Identificar automáticamente:

```text
TESSA
│
└── Perfiles
    └── SIC
        └── Configuracion
```

sin utilizar rutas codificadas.

---

### Lectura de Configuración

Cargar archivos JSON.

Ejemplos:

```text
Aplicaciones.json
```

```text
Hosts.json
```

```text
Usuarios.json
```

```text
Personalizacion.json
```

---

### Validación

Verificar:

- Existencia de archivos.
- Formato JSON válido.
- Disponibilidad de configuraciones requeridas.

---

## Arquitectura

```text
Core
└── Utilidades
    └── ConfigManager.ps1
```

---

## Funciones Actuales

### Get-TessaRoot()

Obtiene la ruta raíz de la plataforma.

Devuelve:

```powershell
C:\TESSA
```

(Ejemplo)

---

### Get-TessaProfile()

Obtiene el perfil actualmente cargado.

Ejemplo:

```powershell
SIC
```

---

### Get-TessaConfigPath()

Obtiene la ubicación de los archivos de configuración.

Ejemplo:

```powershell
Perfiles\SIC\Configuracion
```

---

### Get-TessaConfiguration()

Carga un archivo JSON y devuelve su contenido como objeto PowerShell.

Ejemplo:

```powershell
Get-TessaConfiguration -Name "Aplicaciones"
```

Resultado:

```powershell
$Config.Aplicaciones
```

---

### Test-TessaConfiguration()

Verifica la existencia de un archivo de configuración.

Ejemplo:

```powershell
Test-TessaConfiguration -Name "Hosts"
```

Resultado:

```powershell
True
```

o

```powershell
False
```

---

### Get-TessaConfigurationFiles()

Devuelve el listado de archivos JSON disponibles para el perfil activo.

Ejemplo:

```powershell
Get-TessaConfigurationFiles
```

---

## Flujo General

```text
Inicio
│
├── Determinar ruta raíz
├── Determinar perfil activo
├── Resolver carpeta Configuracion
│
├── Solicitud de módulo
│   │
│   ├── Aplicaciones.json
│   ├── Hosts.json
│   ├── Usuarios.json
│   ├── Personalizacion.json
│   └── Drivers-Lenovo.json
│
├── Validación
├── Conversión JSON
└── Entrega al módulo solicitante
```

---

## Consumidores Actuales

Los módulos previstos para utilizar ConfigManager son:

### Init

Configuraciones:

```text
Aplicaciones.json
TESSA.json
```

---

### Hosts

Configuraciones:

```text
Hosts.json
```

---

### Users

Configuraciones:

```text
Usuarios.json
```

---

### Personalizacion

Configuraciones:

```text
Personalizacion.json
```

---

### Drivers-Lenovo

Configuraciones:

```text
Drivers-Lenovo.json
```

---

## Dependencias

### PowerShell

Funciones:

```powershell
ConvertFrom-Json
```

```powershell
Get-Content
```

```powershell
Test-Path
```

```powershell
Join-Path
```

---

### Sistema de Archivos

Acceso a:

```text
Perfiles\<Perfil>\Configuracion
```

---

## Beneficios para la Arquitectura

Antes:

```text
Init.ps1
    └── C:\AIMT\Apps

Hosts.ps1
    └── Dominios definidos en código

Users.ps1
    └── Usuarios definidos en código
```

Después:

```text
Init
    └── ConfigManager
        └── Aplicaciones.json

Hosts
    └── ConfigManager
        └── Hosts.json

Users
    └── ConfigManager
        └── Usuarios.json
```

---

## Evolución Planificada

### Versión 1.1

- Selección dinámica de perfiles.
- Cambio de perfil sin modificar código.

---

### Versión 1.2

- Validación avanzada de esquemas JSON.
- Verificación de campos obligatorios.

---

### Versión 1.3

- Caché de configuraciones.
- Recarga dinámica.

---

### Versión 2.0

- Administración de múltiples perfiles simultáneos.
- Herencia de configuraciones.

---

## Estado del Módulo

Estado actual:

✅ Diseñado

✅ Documentado

✅ Implementado

---

## Importancia Estratégica

ConfigManager constituye el núcleo de la arquitectura TESSA.

Su incorporación permite desacoplar completamente los módulos operativos de las configuraciones específicas de una organización y habilita la evolución hacia una plataforma multiempresa reutilizable.