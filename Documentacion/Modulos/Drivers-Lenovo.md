# Módulo Drivers-Lenovo

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Drivers-Lenovo
```

---

## Descripción

Drivers-Lenovo es el módulo encargado de instalar controladores Lenovo durante el proceso de alistamiento de equipos.

Su función principal es identificar y desplegar automáticamente los paquetes de controladores disponibles dentro del repositorio local definido para TESSA.

---

## Origen

Este módulo proviene de AIMT versión 1.x, donde evolucionó desde un script Batch hacia una implementación PowerShell con funcionalidades de registro, seguimiento de progreso y generación de reportes.

---

## Objetivos

- Automatizar la instalación de controladores Lenovo.
- Estandarizar el proceso de actualización de drivers.
- Mantener registro de actividades realizadas.
- Reducir errores durante el aprovisionamiento de equipos.
- Mejorar la trazabilidad del proceso de instalación.

---

## Evolución Histórica

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Implementación original en Batch |
| 1.1.0 | Migración a PowerShell |
| 1.2.0 | Incorporación de alias visual de equipo |
| 1.3.0 | Instalación con seguimiento individual |
| 1.3.1 | Estandarización de cabeceras y logs |
| 1.3.2 | Versión de simulación (pruebas) |
| 1.3.3 | Resumen final de ejecución |
| 1.3.4 | Listado completo de controladores instalados |
| 1.3.5 | Simulación con listado completo |

---

## Funcionalidades Identificadas en AIMT

### Identificación del Equipo

Obtiene el número de serie del BIOS y genera un alias visual con formato:

```text
BOGXXXXXX
```

El alias es utilizado únicamente con propósitos informativos y de registro.

---

### Descubrimiento Automático de Controladores

Busca de forma recursiva archivos:

```text
*.inf
```

dentro de:

```text
C:\AIMT\Controladores\Lenovo
```

incluyendo subdirectorios.

---

### Instalación Automatizada

Utiliza:

```powershell
pnputil.exe
```

para instalar cada controlador detectado.

Comando utilizado:

```powershell
pnputil /add-driver <archivo.inf> /install
```

---

### Seguimiento de Progreso

Muestra el avance de instalación:

```text
(1/25)
(2/25)
(3/25)
...
```

facilitando la trazabilidad durante la ejecución.

---

### Resumen de Instalación

Al finalizar genera:

- Conteo total de controladores procesados.
- Duración de la ejecución.
- Listado completo de controladores instalados.

---

### Generación de Logs

Crea archivos de registro utilizando el formato:

```text
Drivers_Update_<Equipo>.log
```

Ejemplo:

```text
Drivers_Update_BOG123ABC.log
```

---

## Flujo Actual

```text
Inicio
│
├── Configuración temporal de políticas
├── Identificación del equipo
├── Inicialización de log
│
├── Descubrimiento de archivos INF
│
├── Instalación
│   ├── Controlador 1
│   ├── Controlador 2
│   ├── Controlador n
│
├── Consolidación de resultados
├── Generación de resumen
├── Generación de listado final
│
└── Finalización
```

---

## Dependencias Detectadas

### Controladores Lenovo

Ubicación actual:

```text
C:\AIMT\Controladores\Lenovo
```

---

### Logs

Ubicación actual:

```text
C:\AIMT\Logs
```

---

### Herramientas del Sistema

```text
pnputil.exe
```

---

### PowerShell

```powershell
Start-Process
Get-ChildItem
Out-File
```

---

## Recursos Utilizados

Actualmente se identifican carpetas relacionadas con controladores Lenovo:

```text
Controladores
└── Lenovo
    └── M710q
```

---

## Riesgos Detectados

### Ruta Fija

Actualmente depende de:

```text
C:\AIMT\Controladores\Lenovo
```

---

### Dependencia por Fabricante

El módulo está orientado exclusivamente a Lenovo.

Esto limita su reutilización para otros fabricantes.

---

### Ausencia de Detección de Modelo

Actualmente instala todos los archivos INF encontrados.

No valida:

- Modelo del equipo.
- Compatibilidad de paquete.
- Familia de dispositivo.

---

### Gestión Básica de Errores

Los errores son registrados pero no existe clasificación ni mecanismo de recuperación.

---

## Evolución AIMT → TESSA

### AIMT v1.x

Características identificadas:

- Repositorio local de controladores.
- Instalación masiva mediante INF.
- Registro básico de actividades.
- Dependencia de fabricante.

---

### TESSA v2.x

Objetivos:

- Eliminar rutas fijas.
- Soportar múltiples fabricantes.
- Detectar modelo automáticamente.
- Validar compatibilidad antes de instalar.
- Centralizar configuración.
- Mejorar análisis de resultados.

---

## Arquitectura Objetivo

La lógica permanecerá en:

```text
Core
└── Drivers-Lenovo
```

Los paquetes de controladores deberán almacenarse en:

```text
Perfiles
└── SIC
    └── Controladores
        └── Lenovo
```

Ejemplo:

```text
Perfiles
└── SIC
    └── Controladores
        └── Lenovo
            ├── M710q
            ├── M720q
            └── ThinkCentre
```

---

## Mejoras Planificadas

### Prioridad Alta

- Separar lógica y repositorio de controladores.
- Detectar modelo automáticamente.
- Validar existencia de drivers antes de ejecutar.
- Registrar resultados estructurados.

---

### Prioridad Media

- Soporte para Dell.
- Soporte para HP.
- Inventario previo de dispositivos sin controlador.

---

### Prioridad Baja

- Descarga automática de controladores.
- Integración con Lenovo System Update.
- Generación de reportes gráficos.

---

## Estado de Migración

Estado actual:

Documentado.

Pendiente:

Refactorización hacia arquitectura TESSA y desacoplamiento de rutas dependientes de AIMT.