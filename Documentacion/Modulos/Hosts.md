# Módulo Hosts

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Hosts
```

---

## Descripción

Hosts es el módulo responsable de administrar las entradas del archivo Hosts de Windows utilizadas por las políticas definidas para cada perfil de organización.

Su propósito es aplicar restricciones de acceso, resoluciones locales o configuraciones de red específicas requeridas durante el proceso de alistamiento corporativo.

---

## Origen

Este módulo proviene de AIMT versión 1.x, donde era utilizado para implementar políticas de restricción mediante modificaciones directas al archivo Hosts del sistema operativo.

Dentro de TESSA se convierte en un módulo reutilizable que ejecuta configuraciones definidas por cada perfil organizacional.

---

## Objetivos

- Administrar el archivo Hosts de forma controlada.
- Aplicar políticas corporativas de acceso.
- Mantener configuraciones específicas por perfil.
- Actualizar la caché DNS tras realizar cambios.
- Permitir una administración centralizada de dominios restringidos.

---

## Funcionalidades Identificadas en AIMT

### Identificación del Equipo

Obtiene el serial del BIOS para generar un identificador de equipo con formato:

```text
BOGXXXXXX
```

Esta información es utilizada únicamente con fines informativos durante la ejecución.

---

### Modificación del Archivo Hosts

Ubicación administrada:

```text
%windir%\System32\drivers\etc\hosts
```

Actualmente agrega entradas que redireccionan dominios hacia:

```text
127.0.0.1
```

---

### Actualización DNS

Después de modificar el archivo Hosts ejecuta:

```powershell
ipconfig /flushdns
```

para garantizar la aplicación inmediata de los cambios.

---

## Restricciones Detectadas en AIMT

Actualmente se identifican restricciones para servicios como:

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

### Mensajería

- WhatsApp Web

---

## Flujo Actual

```text
Inicio
│
├── Obtener información del equipo
├── Definir lista de dominios
├── Actualizar archivo Hosts
├── Limpiar caché DNS
├── Mostrar resultado
└── Finalización
```

---

## Dependencias Detectadas

### Sistema Operativo

Windows

### Archivo Hosts

```text
%windir%\System32\drivers\etc\hosts
```

### Privilegios

Requiere ejecución con permisos administrativos para modificar el archivo Hosts.

---

## Riesgos Detectados

### Duplicación de Entradas

La implementación actual agrega información utilizando:

```powershell
Add-Content
```

sin verificar si los dominios ya existen.

Esto puede generar múltiples registros duplicados después de ejecuciones repetidas.

---

### Configuración Embebida

La lista de dominios se encuentra codificada directamente dentro del script.

Cada cambio requiere modificar el código fuente.

---

### Ausencia de Respaldo

Actualmente no se genera copia de seguridad del archivo Hosts antes de realizar modificaciones.

---

### Ausencia de Validaciones

No existe validación de:

- Entradas existentes.
- Formato de registros.
- Estado previo del archivo.

---

## Evolución AIMT → TESSA

### AIMT v1.x

Características identificadas:

- Configuración fija en código.
- Dominios definidos manualmente.
- Sin respaldo automático.
- Sin control de duplicados.

---

### TESSA v2.x

Objetivos de refactorización:

- Separar configuración de lógica.
- Implementar respaldo automático.
- Validar registros existentes.
- Evitar duplicados.
- Registrar cambios realizados.
- Soportar configuraciones por perfil.

---

## Arquitectura Objetivo

La lógica permanecerá en:

```text
Core
└── Hosts
```

Las configuraciones pasarán a:

```text
Perfiles
└── SIC
    └── Configuracion
```

Ejemplo:

```text
Perfiles
└── SIC
    └── Configuracion
        └── Hosts.txt
```

o

```text
Perfiles
└── SIC
    └── Configuracion
        └── Hosts.json
```

---

## Mejoras Planificadas

### Prioridad Alta

- Eliminar dominios codificados en el script.
- Validar entradas existentes.
- Crear respaldo automático.
- Generar registros de ejecución.

---

### Prioridad Media

- Gestionar listas por perfil.
- Permitir comentarios y categorías.
- Implementar reversión de cambios.

---

### Prioridad Baja

- Interfaz de administración.
- Catálogos centralizados de dominios.
- Integración con futuras políticas corporativas.

---

## Estado de Migración

Estado actual:

Documentado.

Pendiente:

Migración a modelo basado en perfiles y separación completa entre lógica y configuración.