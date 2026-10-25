# Esquema de Configuración

## Propósito

Este documento define la estructura, propósito y reglas de los archivos de configuración utilizados por TESSA.

Su objetivo es garantizar que todos los módulos del Core consuman configuraciones estandarizadas y desacopladas de la lógica de negocio.

---

# Principio General

## Regla Fundamental

Los módulos del Core no deben contener información específica de una organización.

Toda configuración particular deberá almacenarse dentro de:

```text
Perfiles\<Perfil>\Configuracion
```

---

## Ejemplo

Incorrecto:

```powershell
$Wallpaper = "sic-wallpaper.jpg"
```

Correcto:

```powershell
$Wallpaper = $Config.Personalizacion.Imagenes.Wallpaper
```

---

# Estructura de Configuración

Ejemplo para el perfil SIC:

```text
Perfiles
└── SIC
    └── Configuracion
        ├── TESSA.json
        ├── Aplicaciones.json
        ├── Hosts.json
        ├── Usuarios.json
        ├── Personalizacion.json
        └── Drivers-Lenovo.json
```

---

# TESSA.json

## Descripción

Contiene la configuración general del perfil.

## Consumido por

```text
Core\Init
```

## Ejemplo

```json
{
    "Perfil": "SIC",
    "Organizacion": "SIC",
    "Plataforma": "TESSA",
    "NombreCompleto": "Tecnossystem Smart Setup Assistant",
    "Version": "2.0.0-alpha",
    "PrefijoHostname": "BOG",
    "GenerarLogs": true,
    "CarpetaLogs": "Logs"
}
```

## Campos

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| Perfil | Sí | String |
| Organizacion | Sí | String |
| Plataforma | Sí | String |
| NombreCompleto | Sí | String |
| Version | Sí | String |
| PrefijoHostname | Sí | String |
| GenerarLogs | Sí | Boolean |
| CarpetaLogs | Sí | String |

---

# Aplicaciones.json

## Descripción

Define las aplicaciones que serán gestionadas por Init.

## Consumido por

```text
Core\Init
```

## Ejemplo

```json
{
    "Aplicaciones": []
}
```

## Campos

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| Nombre | Sí | String |
| Instalador | Sí | String |
| Tipo | Sí | String |
| Argumentos | No | String |
| Obligatorio | Sí | Boolean |

---

# Hosts.json

## Descripción

Define dominios que serán administrados por el módulo Hosts.

## Consumido por

```text
Core\Hosts
```

## Ejemplo

```json
{
    "DominiosBloqueados": [],
    "DireccionLoopback": "127.0.0.1"
}
```

## Campos

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| DominiosBloqueados | Sí | Array |
| DireccionLoopback | Sí | String |

---

# Usuarios.json

## Descripción

Define cuentas locales administradas por el módulo Users.

## Consumido por

```text
Core\Users
```

## Ejemplo

```json
{
    "Usuarios": []
}
```

## Campos

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| Nombre | Sí | String |
| NombreCompleto | Sí | String |
| CuentaExpira | Sí | Boolean |
| ContrasenaExpira | Sí | Boolean |
| PuedeCambiarContrasena | Sí | Boolean |
| GenerarAleatoria | Sí | Boolean |

---

# Personalizacion.json

## Descripción

Contiene la configuración visual y de experiencia de usuario.

## Consumido por

```text
Core\Personalizacion
```

## Ejemplo

```json
{
    "Imagenes": {},
    "Configuraciones": {}
}
```

## Campos

### Imagenes

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| Wallpaper | Sí | String |
| Lockscreen | No | String |
| Logo | No | String |

### Configuraciones

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| PrediccionTexto | Sí | Boolean |
| PrediccionMultilenguaje | Sí | Boolean |
| MostrarPorcentajeBateria | Sí | Boolean |

---

# Drivers-Lenovo.json

## Descripción

Contiene configuraciones específicas para la administración de controladores Lenovo.

## Consumido por

```text
Core\Drivers-Lenovo
```

## Ejemplo

```json
{
    "Fabricante": "Lenovo"
}
```

## Campos

| Campo | Obligatorio | Tipo |
|---------|---------|---------|
| Fabricante | Sí | String |
| BusquedaRecursiva | Sí | Boolean |
| FiltroArchivos | Sí | String |
| InstalacionAutomatica | Sí | Boolean |
| GenerarResumen | Sí | Boolean |
| GenerarLog | Sí | Boolean |

---

# Convenciones

## Nombres de Archivos

Todos los archivos de configuración deberán utilizar:

```text
PascalCase
```

Ejemplos:

```text
Aplicaciones.json
Hosts.json
Usuarios.json
Personalizacion.json
Drivers-Lenovo.json
```

---

## Formato

Todos los archivos deberán almacenarse en:

```text
UTF-8
```

---

## Estructura

Todos los archivos deberán ser JSON válidos.

No se permiten comentarios dentro de los archivos JSON.

---

# Responsabilidades

## Core

Responsable de:

- Leer configuración.
- Validar configuración.
- Ejecutar acciones.

No debe contener configuraciones organizacionales.

---

## Perfiles

Responsable de:

- Definir configuraciones.
- Definir recursos.
- Definir comportamiento organizacional.

No debe contener lógica de negocio.

---

# Futuras Ampliaciones

La arquitectura permite incorporar archivos adicionales sin modificar el Core.

Ejemplos:

```text
Office.json
Inventario.json
Impresoras.json
Red.json
Software.json
BitLocker.json
```

si las futuras versiones de TESSA lo requieren.

---

# Estado

Versión del esquema:

```text
1.0.0
```

Compatible con:

```text
TESSA 2.0.0-alpha
```