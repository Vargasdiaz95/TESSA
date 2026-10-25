# Módulo Drivers-Lenovo

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Drivers-Lenovo
```

---

## Descripción

Drivers-Lenovo es el módulo encargado de la instalación automatizada de controladores Lenovo dentro de TESSA.

Su función principal es localizar, procesar e instalar los archivos INF disponibles en el repositorio de controladores Lenovo, permitiendo la preparación de equipos Lenovo durante los procesos de alistamiento y soporte.

Este módulo forma parte del subsistema de controladores de TESSA y es independiente de cualquier perfil corporativo.

---

## Ubicación

### Motor del Módulo

```text
TESSA
└── Controladores
    └── Core
        └── Drivers-Lenovo.ps1
```

### Acceso Directo

```text
TESSA
└── Controladores
    └── Drivers-Lenovo.lnk
```

### Repositorio de Controladores

```text
TESSA
└── Controladores
    └── Lenovo
```

---

## Estado del Módulo

| Elemento | Estado |
|-----------|-----------|
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

- Automatizar la instalación de controladores Lenovo.
- Reducir actividades manuales.
- Estandarizar los procesos de actualización de drivers.
- Permitir reutilización entre diferentes perfiles corporativos.
- Mantener trazabilidad mediante registros de ejecución.
- Facilitar el soporte técnico de equipos Lenovo.

---

## Funcionalidades

### Generación de Alias del Equipo

Obtiene el serial del BIOS y genera un identificador visual.

Ejemplo:

```text
BOGABC123
```

Este identificador tiene únicamente fines informativos.

No modifica el hostname real del sistema operativo.

---

### Descubrimiento Automático de Controladores

Localiza de forma automática todos los archivos:

```text
*.inf
```

presentes dentro de* repositorio Lenovo.

La búsqueda *ncluye subdirectorios.

---

### I*stalación de Drivers

Utiliza:

``*text
pnputil.exe
```

para realiza* la instalación de los controlador*s encontrados.

Ejemplo:

```power*hell
pnputil /add-driver archivo.i*f /install
```

---

### Seguimien*o de Progreso

Durante la ejecució* se muestra el estado de avance.

*jemplo:

```text
[1/25]
[2/25]
[3/*5]
```

---

### Registro de Resul*ados

Genera registros de ejecució* que incluyen:

- Inicio del proce*o.
- Usuario ejecutor.
- Alias del*equipo.
- Controladores procesados*
- Errores detectados.
- Resumen f*nal.

---

### Resumen Final

Al f*nalizar se presenta:

- Fecha de f*nalización.
- Tiempo total de ejec*ción.
- Total de controladores pro*esados.
- Listado completo de cont*oladores instalados.

---

## Estr*ctura Asociada

### Controladores
*```text
Controladores
│
├── Core
│*  └── Drivers-Lenovo.ps1
│
├── Len*vo
│   └── M710q
│
├── Dell
│
└── *rivers-Lenovo.lnk
```

---

### Lo*s

Ubicación:

```text
TESSA
└── L*gs
```

Ejemplo de log generado:

*``text
Drivers-Lenovo_BOGABC123.lo*
```

---

## Flujo de Ejecución

*``text
Inicio
│
├── Configuración *e entorno
├── Obtención del serial*├── Generación del alias visual
├─* Inicialización del log
│
├── Desc*brimiento de archivos INF
│
├── In*talación de controladores
│   ├── *river 1
│   ├── Driver 2
│   ├── D*iver N
│
├── Consolidación de resu*tados
├── Generación de resumen
├─* Generación de listado final
│
└──*Finalización
```

---

## Dependen*ias

### Sistema Operativo

Window*.

---

### Herramientas del Siste*a

```text
pnputil.exe
```

---

#*# PowerShell

Comandos utilizados:*
```powershell
Get-CimInstance
Get*ChildItem
Start-Process
Test-Path
*ew-Item
Out-File
Resolve-Path
Join*Path
```

---

## Convención de Ru*as TESSA

A partir de TESSA las ru*as ya no utilizan ubicaciones abso*utas.

### Antes

```powershell
C:*AIMT\Controladores\Lenovo
```

```*owershell
C:\AIMT\Logs
```

---

#*# Ahora

Las rutas se generan diná*icamente desde la ubicación del sc*ipt.

Implementación:

```powershe*l
$TessaRoot = (Resolve-Path "$PSS*riptRoot\..\..").Path
```

Resultado:

```text
TESSA
```

---

### Ventajas

- Portabilidad total.
- Eliminación de dependencias de AIMT.
- Compatibilidad con cualquier unidad.
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

## Historial AIMT

El historial ya no se almacena dentro del código.

Se conserva únicamente con fines documentales.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original en Batch |
| 1.1.0 | Conversión a PowerShell con cabecera y log |
| 1.2.0 | Incorporación de alias visual del equipo |
| 1.3.0 | Instalación con seguimiento individual |
| 1.3.1 | Unificación de cabeceras |
| 1.3.2 | Versión de simulación |
| 1.3.3 | Producción con resumen final |
| 1.3.4 | Producción con listado completo de controladores |
| 1.3.5 | Simulación con listado completo |

---

## Cambios Introducidos en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Instalación de Controladores Lenovo
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Eliminación del Historial Interno

El historial ya no se almacena dentro de los scripts.

La gestión de cambios se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Eliminación de Dependencia AIMT

La dependencia:

```text
C:\AIMT
```

fue eliminada completamente.

---

### Nueva Convención de Logs

Antes:

```text
Drivers_Update_BOGXXXX.log
```

Ahora:

```text
Drivers-Lenovo_BOGXXXX.log
```

---

## Riesgos Detectados

### Instalación Masiva

Actualmente todos los archivos INF encontrados son procesados.

No existe filtrado por:

- Modelo.
- Familia.
- Generación.

---

### Dependencia del Repositorio

La efectividad del módulo depende de la calidad y organización de los controladores almacenados.

---

### Validación de Compatibilidad

Actualmente no existe validación previa entre:

- Modelo del equipo.
- Driver encontrado.
- Compatibilidad del paquete.

---

## Mejoras Futuras

### Prioridad Alta

- Detección automática del modelo Lenovo.
- Validación de controladores antes de instalar.
- Mejora en el manejo de errores.

---

### Prioridad Media

- Generación de inventario previo.
- Reporte estructurado de resultados.
- Validación posterior a la instalación.

---

### Prioridad Baja

- Descarga automática de controladores.
- Integración con Lenovo System Update.
- Generación de reportes avanzados.

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

Próximas actividades:

- Optimización.
- Refactorización progresiva.
- Soporte para nuevos fabricantes.

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