# Módulo Init

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Init
```

---

## Descripción

Init es el módulo responsable de ejecutar el proceso inicial de preparación de equipos dentro de TESSA.

Actúa como punto de entrada principal para las tareas de instalación de software, configuración del sistema operativo y aplicación de configuraciones corporativas definidas por el perfil seleccionado.

---

## Origen

Este módulo proviene de AIMT versión 1.x, donde era utilizado como rutina principal para el despliegue de aplicaciones y configuración inicial de equipos.

Dentro de TESSA se convierte en el orquestador principal del proceso de alistamiento.

---

## Objetivos

- Preparar el entorno de trabajo.
- Instalar aplicaciones corporativas.
- Habilitar componentes requeridos por el sistema.
- Aplicar configuraciones iniciales.
- Estandarizar el alistamiento de equipos.
- Registrar la ejecución del proceso.

---

## Funcionalidades Identificadas en AIMT

### Gestión de la Ejecución

- Validación inicial del entorno.
- Configuración temporal de Execution Policy.
- Generación de archivo de log.
- Medición de tiempo de ejecución.

---

### Identificación del Equipo

Obtiene el número de serie del dispositivo y genera un nombre de equipo siguiendo el formato:

```text
BOGXXXXXX
```

donde los últimos seis caracteres corresponden al serial del BIOS.

---

### Instalación de Aplicaciones

Actualmente despliega:

| Aplicación | Método |
|------------|---------|
| 7-Zip | MSI |
| Adobe Reader | EXE |
| Google Chrome Enterprise | MSI |
| Java Runtime Environment | EXE |
| LibreOffice | MSI |
| Jarvis Browser | EXE |
| DeepL | EXE |
| TightVNC | MSI |
| Dell Command Update | EXE |
| SupportAssist | EXE |

---

### Configuración del Sistema

Realiza las siguientes acciones:

- Habilita .NET Framework 3.5.
- Renombra el equipo.
- Cambia la etiqueta de la unidad C a "Windows".

---

### Generación de Logs

Genera archivos de registro con el formato:

```text
Init_NombreEquipo.log
```

Ejemplo:

```text
Init_BOG123ABC.log
```

---

## Flujo Actual

```text
Inicio
│
├── Configuración temporal del entorno
├── Obtención de información del equipo
├── Inicialización del log
│
├── Fase 1
│   ├── 7-Zip
│   ├── Adobe Reader
│   ├── Google Chrome
│   ├── Java
│   └── LibreOffice
│
├── Fase 2
│   ├── Jarvis Browser
│   └── DeepL
│
├── Fase 3
│   ├── TightVNC
│   ├── Dell Command Update
│   └── SupportAssist
│
├── Fase 4
│   └── .NET Framework 3.5
│
├── Cambio de nombre del equipo
├── Cambio de etiqueta de volumen
├── Registro de cierre
└── Finalización
```

---

## Dependencias Detectadas en AIMT

### Aplicaciones

```text
C:\AIMT\Apps
```

### Componentes

```text
C:\AIMT\Componentes
```

### Logs

```text
C:\AIMT\Logs
```

---

## Limitaciones Detectadas

### Rutas Fijas

Actualmente el módulo depende de rutas codificadas de forma estática.

Ejemplo:

```powershell
C:\AIMT\Apps
C:\AIMT\Logs
C:\AIMT\Componentes
```

---

### Catálogo Embebido

Las aplicaciones a instalar se encuentran definidas directamente dentro del script.

Cualquier cambio requiere modificación del código.

---

### Dependencia de Perfil

El módulo contiene configuraciones específicas para SIC que deben desacoplarse y trasladarse hacia el sistema de perfiles de TESSA.

---

## Evolución AIMT → TESSA

### AIMT v1.x

- Script monolítico.
- Aplicaciones definidas manualmente.
- Configuración embebida.
- Dependencia de rutas fijas.

### TESSA v2.x

Objetivos de refactorización:

- Configuración basada en perfiles.
- Eliminación de rutas fijas.
- Catálogo de aplicaciones configurable.
- Manejo centralizado de logs.
- Validación de errores y resultados.
- Mayor reutilización entre organizaciones.

---

## Historial Resumido

| Versión AIMT | Evento |
|-------------|---------|
| 1.0 | Implementación original en BAT |
| 1.1 | Migración a PowerShell |
| 1.2 | Incorporación de hostname dinámico y logging |
| 1.3 | Consolidación del despliegue de aplicaciones |
| 1.3.x | Ajustes de instaladores, .NET Framework y configuraciones de sistema |

---

## Estado de Migración

**Estado actual:** Documentado.

**Próximo paso:** Desacoplar configuración, rutas y catálogo de aplicaciones para convertir Init en un módulo reutilizable del Core de TESSA.