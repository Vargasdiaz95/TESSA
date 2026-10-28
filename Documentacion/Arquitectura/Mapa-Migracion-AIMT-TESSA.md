# Mapa de Migración AIMT → TESSA

## Propósito

Este documento define la estrategia de evolución desde AIMT (Asistente de Instalación y Mejoras Tecnossystem) hacia TESSA (Tecnossystem Smart Setup Assistant).

Su objetivo es preservar la funcionalidad existente mientras se transforma la solución en una plataforma portable, modular, documentada y mantenible.

Asimismo, documenta el estado real de la migración ejecutada, las decisiones arquitectónicas adoptadas y las actividades pendientes para futuras versiones.

---

# Estado Histórico

## AIMT v1.x

Arquitectura original:

```text
C:\AIMT
│
├── Apps
├── Componentes
├── Controladores
├── Dev
├── Logs
└── Wallpapers
```

Módulos identificados:

```text
Init.ps1
Hosts.ps1
Users.ps1
Users.bat
Personalizacion.ps1
Drivers-Lenovo.ps1
```

Características principales:

- Dependencia de rutas absolutas.
- Uso de accesos directos LNK.
- Configuración embebida en los scripts.
- Estructura monolítica.
- Documentación limitada.

---

# Estado Actual

## TESSA v2.0.0-alpha

Arquitectura vigente:

```text
TESSA
│
├── Perfiles
│   └── SIC
│       │
│       ├── Core
│       │   ├── Init.ps1
│       │   ├── Hosts.ps1
│       │   ├── Personalizacion.ps1
│       │   ├── Users.ps1
│       │   └── Users.bat
│       │
│       ├── Init.cmd
│       ├── Hosts.cmd
│       ├── Personalizacion.cmd
│       ├── Users.cmd
│       ├── Users_Bat.cmd
│       │
│       └── Wallpapers
│
├── Controladores
│   │
│   ├── Core
│   │   └── Drivers-Lenovo.ps1
│   │
│   ├── Drivers-Lenovo.cmd
│   │
│   ├── Lenovo
│   └── Dell
│
├── Software
│   ├── Aplicaciones
│   └── Componentes
│       └── .NetFx3.5
│
├── Logs
├── Documentacion
├── Pruebas
│
├── README.md
├── CONTRIBUTING.md
├── LICENSE
└── .gitignore
```

Estado general:

✅ Migración de código completada.

✅ Documentación de módulos completada.

✅ Eliminación de dependencias AIMT.

✅ Implementación de rutas dinámicas.

✅ Implementación de logs.

✅ Implementación de lanzadores CMD autoelevables.

✅ Portabilidad completa del proyecto.

---

# Principios de Migración

## 1. Preservar Operación

Ninguna funcionalidad operativa de AIMT debía perderse durante la migración.

Objetivo:

```text
Misma funcionalidad
+
Mejor arquitectura
```

---

## 2. Mantener Nombres Funcionales

Los módulos conservan sus nombres históricos:

```text
Init
Hosts
Users
Personalizacion
Drivers-Lenovo
```

Esto facilita:

- Trazabilidad.
- Capacitación.
- Soporte.
- Continuidad operativa.

---

## 3. Portabilidad Total

Uno de los objetivos principales de TESSA fue eliminar completamente las rutas absolutas.

Antes:

```text
C:\AIMT
```

Ahora:

```powershell
$TessaRoot = (Resolve-Path "...").Path
```

Resultado:

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

funcionan de forma idéntica.

---

## 4. Eliminación de Dependencias AIMT

Se eliminaron referencias directas a:

```text
C:\AIMT
```

de todos los módulos migrados.

---

## 5. Sustitución de Accesos Directos

Se reemplazaron:

```text
*.lnk*```

por:

```text
*.cmd*```

autoelevables.

Benef*cios:

- Portabilidad.
- Compatibi*idad con*Git.
- Facilidad de mantenimiento.*- Eliminación de dependencias de*ubicación.

---

# Inventario de M*dulos*
## Init

Estado:

```text
Migr*do
```

Responsabilidades:

* Instalación de aplicaciones.
- Ha*ilitación de .NET Framework 3.5.
-*Renombrado del equipo.
- Etiquetad* de unidad.
- Configuración inicia*.

Estado actual:

✅ Operativo.

✅*Documentado.

✅*Portable.

---

## Hosts

*stado:

```text
Migrado
```

*esponsabilidades:

- Gestión del a*chivo Hosts.
- Restricciones corpo*ativas.
-*Actualización de*caché DNS.

Estado actual:

✅ Oper*tivo.

✅ Documentado.

✅ Portable.*
---

##*Personalizacion

Estado:

```*ext
Migrado
```

Responsabilidades*

- Fondos corporativos.
- Configu*ación de perfiles existentes.
- Co*figuración de*nuevos usuarios.
- Ajustes de expe*iencia de usuario.

Estado actual:*
✅ Operativo.

✅ Documentado.

✅ P*rtable.

---

## Users (BAT*

Estado:

```text
Migrado
``*

Responsabilidades:

- Creación d*l usuario OperadorSIC.

Estado act*al:

✅ Operativo.

✅ Documentado.
*✅ Conservado por compatibilidad.

*--

## Users (PowerShell)

Estado:*
```text
Migrado
*``

Responsabilidades:

- Evolució* del módulo Users.
- Configuración*avanzada de cuentas locales.
- Gen*ración de logs.

Estado actual:

✅*Operativo.

✅ Documentado.

✅ Base*para evolución futura.

---

## Dr*vers-Lenovo

Estado:

```text
Migr*do
```

Responsabilidades:

- Inst*lación automática de controladores*Lenovo.
- Procesamiento de archivo* INF.
- Generación de registros.

*stado actual:

✅ Operativo.

✅ Doc*mentado.

✅ Portable.

---

# Depe*dencias Migradas

## Aplicaciones
*Antes:

```text
C:\AIMT\Apps
```

*hora:

```text
TESSA\Software\Apli*aciones
```

---

## Componentes

*ntes:

```text
C:\AIMT\Componentes*```

Ahora:

```text
TESSA\Softwar*\Componentes
```

---

## Fondos C*rporativos

Antes:

```text
C:\AIM*\Wallpapers
```

Ahora:

```text
T*SSA\Perfiles\SIC\Wallpapers
```

-*-

## Logs

Antes:

```text
C:\AIM*\Logs
```

Ahora:

```text
TESSA\L*gs
```

---

## Controladores

Ant*s:

```text
C:\AIMT\Controladores
*``

Ahora:

```text
TESSA\Controla*ores
```

---

# Hallazgos Técnico*

Durante la migración se identifi*aron los siguientes patrones.

## *onfiguración Embebida

Persisten c*nfiguraciones definidas dentro del*código:

- Hosts.
- Users.
- Perso*alizacion.
- Init.

---

## Usuari*s y Credenciales Fijas

Presente e*:

```text
Users.bat
Users.ps1
```*
---

## Dependencias por Perfil

*resente en:

```text
SIC
```

Los *ódulos:

- Hosts.
- Personalizacio*.
- Users.

mantienen elementos es*ecíficos del perfil SIC.

---

## *epositorios Dependientes de Recurs*s

Presente en:

- Software.
- Wal*papers.
- Controladores.

---

# P*an de Evolución

## Fase 1 – Docum*ntación

Estado:

```text
Completada
```

Módulos documentados:

- Init
- Hosts
- Personalizacion
- Users-BAT
- Users-PS1
- Drivers-Lenovo

---

## Fase 2 – Migración Arquitectónica

Estado:

```text
Completada
```

Actividades realizadas:

- Eliminación de AIMT.
- Migración a TESSA.
- Implementación de rutas dinámicas.
- Organización por perfiles.
- Organización de controladores.

---

## Fase 3 – Portabilidad

Estado:

```text
Completada
```

Actividades realizadas:

- Eliminación de rutas absolutas.
- Sustitución de accesos directos.
- Creación de lanzadores CMD.
- Autoelevación mediante UAC.

---

## Fase 4 – Refactorización

Estado:

```text
Pendiente
```

Objetivos:

- Externalizar configuraciones.
- Reducir código duplicado.
- Parametrizar variables.
- Mejorar validaciones.

---

## Fase 5 – Orquestación

Estado:

```text
Pendiente
```

Objetivos:

Crear un lanzador centralizado:

```text
Start-TESSA.ps1
```

capaz de ejecutar módulos y perfiles desde una única interfaz.

---

## Fase 6 – Versión Estable

Objetivo:

```text
TESSA v2.0.0
```

como sucesor operativo definitivo de AIMT.

---

# Identidad del Proyecto

## Identidad Operativa

Utilizada en:

- Consola.
- Logs.
- Scripts.
- Lanzadores.

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

## Identidad Institucional

Utilizada en:

- Documentación.
- GitHub.
- Manuales.
- Arquitectura.

```text
Tecnossystem Co.
```

---

# Estado General de Migración

Documentación:

✅ Completada

Arquitectura:

✅ Definida

Migración de Código:

✅ Completada

Migración de Rutas:

✅ Completada

Portabilidad:

✅ Completada

Implementación de Logs:

✅ Completada

Lanzadores CMD:

✅ Completados

Refactorización:

⏳ Pendiente

TESSA v2.0.0:

⏳ En evolución

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