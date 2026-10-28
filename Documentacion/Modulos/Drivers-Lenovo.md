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

### Lanzador

```text
TESSA
└── Controladores
    └── Drivers-Lenovo.cmd
```

### Repositorio de Controladores

```text
TESSA
└── Controladores
    └── Lenovo
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Drivers-Lenovo.cmd
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
|-----------|-----------|
| Migración a TESSA | Completa |
| Producción | Operativo |
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

La búsqueda *ncluye todos los subdirectorios.

*--

### Instalación de Drivers

Ut*liza:

```text
pnputil*exe
```

para realizar la instalac*ón de los controladores encontrado*.

Ejemplo:

```powershell
pnputil*/add-driver archivo.inf /install
`*`

---

### Seguimiento de Pro*reso

Durante la ejecución se mues*ra el estado de avance.

Ejemplo:
*```text
[1/25]
[2/25]
[3/25]
```

*--

### Registro de Resultados

Ge*era registros de ejecución que inc*uyen:

- Inicio del proceso.
- Usu*rio ejecutor.
- Alias del equipo.
* Controladores procesados.
- Error*s detectados.
- Res*men final.

---

### Resumen Final*
Al finalizar se presenta:

- Fech* de finalización.
- Tiempo total d* ejecución.
- Total de control*dores procesados.
- Listado comple*o de controladores instalados.

--*

## Estructura Asociada

### Cont*oladores

```text
Controladores
│
*── Core
│  *└── Drivers-Lenovo.ps1
*
├── Drivers-Lenovo.cmd
*
├── Lenovo
│   └*─ M710q
│
└──*Dell
```

---

### Logs

Ubicación*

```text
TESSA
└*─ Logs
```

Ejemplo de log generad**

```text
Drivers-Lenovo_BOG*BC123.log
```

---

## Flujo de Ej*cución

```text
Inicio
*
├── Configuración de entorno
├*─ Obtención del serial
├── Generac*ón*del alias visual
├── Inicializació* del log
│
├── Descubrimiento de a*chivos INF
│
├── Instalación de co*trol*dores
│   ├── Driver 1*│   ├── Driver 2
*   ├── Driver N
│
*── Consolidación de resultados
├──*Gener*ción de resumen
├── Generación de *istado final
│
└── Finalización
*``

---

## Dependencias

### Sist*ma Oper*tivo

Windows.

---

### Herramien*as del Sistema

```text
pnputil.ex*
```

---

### PowerShell

Comando* utilizados:

```powershell
Get-Ci*Instance
Get-ChildItem
Start-Proce*s
Test-Path
New-Item
Out-File
Reso*ve-Path
Join-Path
```

---

## Con*ención de Rutas TESSA

A partir de*TESSA las rutas ya no utilizan ubi*aciones absolutas.

### Antes

```*owershell
C:\AIMT\Controladores\Le*ovo
```

```powershell
C:\AIMT\Log*
```

---

### Ahora

Las rutas se*generan dinámicamente desde la ubi*ación del script.

Implementación:*
```powershell
$TessaRoot = (Resol*e-Path "$PSScriptRoot\..\..").Path*```

Resultado:

```text
TESSA
```*
---

### Ventajas

- Portabilidad*total.
-*Eliminación de dependencias de AIM*.
- Compatibilidad con cualquier u*icación del proyecto.
- Facilidad *e despliegue.

Ejemplos válidos:

*``text
C:\TESSA
```

```text
*:\TESSA
```

```text*E:\Herramientas\TESSA*```

Siempre que la estructura int*rna permanezca intacta.

---

## H*storial AIMT

El historial*ya no se almacena dentro del códig*.

Se conserva únicamente con fine* documentales.

| Versión | Descri*ción |
|----------|----------|
| 1*0.0 | Script original en Batch |
|*1.1.0 | Conversión a PowerShell co* cabecera y log |
| 1.2.0 | Incorp*r*ción de alias visual del equipo |
* 1.3.0 | Instalación*con seguimiento individual |
| 1.3** | Unificación de cabeceras |
|*1.3.2 | Versión de*simulación |
| 1.3.3*| Producción con resumen final |
|*1.3.4 | Producción con listado com*leto*de controladores |
| 1.3.* | Simulación con listado completo*|

---

##*Cambios Introducidos en TESSA

###*Actualización de Identidad

Antes:*
```text
Somos TSS CO. - Instalaci*n de Controladores Lenovo
```

Aho*a:

```text
Somos TSS CO. | TESSA*Tecnossystem Smart Setup Assistant*```

---

### Eliminación del Hist*rial Interno

El historial ya no s* almacena dentro de los scripts.

*a gestión de cambios se realiza me*iante:

- GitHub.
- Commits.
- His*orial del repositorio.
- Documenta*ión técnica.

---

### Eliminación*de Dependencia AIMT

La dependenci*:

```text
C:\AIMT
```

fue elimin*da completamente.

---

### Sustit*ción de Accesos Directos

Los acce*os directos tradicionales:

```tex*
*.lnk
```

fueron reemplazados po* lanzadores:

```text
*.cmd
```

B*neficios:

- Compatibilidad con Gi*.
- Portabilidad.
- Facilidad de m*ntenimiento.
- Eliminación de ruta* absolutas.
- Elevación automática*a administrador.

---

### Nueva C*nvención de Logs

Antes:

```text
*rivers_Update_BOGXXXX.log
```

Aho*a:

```text
Drivers-Lenovo_BOGXXXX*log
```

---

## Riesgos Detectado*

### Instalación Masiva

Actualme*te todos los archivos INF encontra*os son procesados.

No existe filt*ado por:

- Modelo.
- Familia.
- G*neración.

---

### Dependencia de* Repositorio

La efectividad del m*dulo depende de la calidad y organ*zación de los controladores almace*ados.

---

### Validación de Comp*tibilidad

Actualmente no existe v*lidación previa entre:

- Modelo d*l equipo.
- Driver encontrado.
- C*mpatibilidad del paquete.

---

##*Mejoras Futuras

### Prioridad Alt*

- Detección automática del model* Lenovo.
- Validación de controlad*res antes de instalar.
- Mejora en*el manejo de errores.

---

### Pr*oridad Media

- Generación de inve*tario previo.
- Reporte estructura*o de resultados.
- Validación post*rior a la instalación.

---

### Prioridad Baja

- Descarga automática de controladores.
- Integración con Lenovo System Update.
- Generación de reportes avanzados.

---

## Estado de Migración

### AIMT

✅ Funcionalidad migrada a TESSA.

---

### TESSA

✅ Módulo operativo.

✅ Rutas dinámicas implementadas.

✅ Logs implementados.

✅ Lanzador CMD portable implementado.

✅ Compatible con cualquier ubicación del proyecto.

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