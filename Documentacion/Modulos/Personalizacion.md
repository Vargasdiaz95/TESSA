# Módulo Personalizacion

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Personalizacion
```

---

## Descripción

Personalizacion es el módulo encargado de aplicar configuraciones visuales y ajustes de experiencia de usuario durante el proceso de alistamiento del equipo.

Su función principal es garantizar que todos los usuarios reciban una experiencia corporativa homogénea conforme a las directrices definidas por la organización.

---

## Origen

Este módulo proviene de AIMT versión 1.x, donde era utilizado para aplicar configuraciones corporativas sobre fondos de pantalla y ajustes de experiencia de usuario en Windows.

Dentro de TESSA evolucionará hacia un módulo reutilizable capaz de aplicar configuraciones específicas según el perfil seleccionado.

---

## Objetivos

- Aplicar imagen corporativa.
- Configurar parámetros visuales del sistema.
- Configurar perfiles existentes y futuros.
- Estandarizar la experiencia de usuario.
- Automatizar ajustes posteriores a la instalación del sistema operativo.

---

## Funcionalidades Identificadas en AIMT

### Configuración de Fondo Corporativo

Actualmente utiliza:

```text
thumb-imgpsh_fullsize_anim.png
```

Origen:

```text
C:\AIMT\Wallpapers
```

Destino:

```text
C:\Windows\Web\Screen
```

---

### Configuración para Nuevos Usuarios

Modifica el perfil:

```text
HKU\.DEFAULT
```

para que todos los usuarios creados posteriormente reciban la configuración corporativa definida.

---

### Configuración de Usuarios Existentes

Aplica configuraciones sobre los perfiles ya presentes en:

```text
C:\Users
```

excluyendo:

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
Predicción de texto por teclado físico
```

mediante las claves:

```text
EnableHwkbTextPrediction
EnableHwkbTextPredictionMultilingual
```

---

### Porcentaje de Batería

Habilita la visualización del porcentaje de batería mediante:

```text
ShowPercentage
```

---

### Gestión de Hives de Usuario

Carga dinámicamente:

```text
NTUSER.DAT
```

para aplicar configuraciones directamente sobre perfiles no conectados.

---

## Flujo Actual

```text
Inicio
│
├── Identificación del equipo
├── Copia de recursos gráficos
│
├── Configuración Default User
│   ├── Fondo corporativo
│   ├── Predicción de texto
│   └── Porcentaje de batería
│
├── Enumeración de perfiles
│
├── Aplicación por usuario
│   ├── Carga de NTUSER.DAT
│   ├── Fondo corporativo
│   ├── Predicción de texto
│   ├── Porcentaje de batería
│   └── Descarga de hive
│
└── Finalización
```

---

## Dependencias Detectadas

### Recursos Gráficos

```text
C:\AIMT\Wallpapers
```

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

## Recursos Utilizados

Actualmente se identifican los siguientes archivos gráficos:

```text
sic-lockscreen.jpg
sic-logo.png
sic-wallpaper.jpeg
thumb-imgpsh_fullsize_anim.png
```

---

## Riesgos Detectados

### Rutas Fijas

Actualmente existen dependencias directas con:

```text
C:\AIMT\Wallpapers
```

---

### Imagen Embebida

El archivo de fondo se encuentra definido directamente dentro del código.

Ejemplo:

```powershell
thumb-imgpsh_fullsize_anim.png
```

---

### Configuración Dependiente de SIC

La selección de recursos visuales pertenece a la identidad corporativa actual y debería administrarse mediante perfiles.

---

### Sin Validación de Recursos

No se verifica previamente la existencia de la imagen antes de aplicarla.

---

### Sin Registro de Eventos

Actualmente no genera archivo de log propio.

---

## Evolución AIMT → TESSA

### AIMT v1.x

Características identificadas:

- Configuración visual específica para SIC.
- Recursos definidos dentro del código.
- Rutas fijas.
- Sin validación de recursos.

---

### TESSA v2.x

Objetivos:

- Separar recursos visuales del código.
- Soportar múltiples perfiles corporativos.
- Incorporar validaciones.
- Generar registros de ejecución.
- Centralizar configuraciones visuales.

---

## Arquitectura Objetivo

La lógica permanecerá en:

```text
Core
└── Personalizacion
```

Los recursos visuales y configuraciones corporativas deberán almacenarse en:

```text
Perfiles
└── SIC
    └── FondosPantalla
```

Ejemplo:

```text
Perfiles
└── SIC
    ├── FondosPantalla
    │   ├── wallpaper.jpg
    │   ├── lockscreen.jpg
    │   └── logo.png
    │
    └── Configuracion
```

---

## Mejoras Planificadas

### Prioridad Alta

- Eliminación de rutas fijas.
- Configuración mediante perfiles.
- Validación de recursos gráficos.
- Registro de ejecución.

---

### Prioridad Media

- Soporte para múltiples fondos corporativos.
- Aplicación de pantalla de bloqueo.
- Configuración de iconografía institucional.

---

### Prioridad Baja

- Temas corporativos.
- Configuración avanzada de interfaz.
- Personalización dinámica según perfil.

---

## Estado de Migración

Estado actual:

Documentado.

Pendiente:

Separación entre lógica de personalización y recursos específicos del perfil SIC.