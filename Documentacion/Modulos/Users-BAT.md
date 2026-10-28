# Módulo Users (BAT)

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Users-BAT
```

---

## Descripción

Users.bat es la implementación original del módulo de creación de usuarios heredada de AIMT.

Su propósito es crear una cuenta local estándar utilizada durante el proceso de alistamiento de equipos del perfil SIC.

Actualmente se conserva por razones de compatibilidad, continuidad operativa y referencia histórica mientras continúa la evolución del módulo Users.ps1.

---

## Ubicación

### Motor del Módulo

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Users.bat
```

### Lanzador

```text
TESSA
└── Perfiles
    └── SIC
        └── Users_Bat.cmd
```

---

## Método de Ejecución

El módulo se ejecuta mediante un lanzador CMD portable.

Archivo utilizado:

```text
Users_Bat.cmd
```

El lanzador proporciona:

- Elevación automática a administrador mediante UAC.
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
|----------|----------|
| Migración a TESSA | Completa |
| Producción | Operativo |
| Documentación | Completa |
| Sustitución futura | Pendiente |
| Dependencia AIMT | Eliminada |

Versión actual:

```text
2.0.0-alpha
```

---

## Objetivos

- Crear el usuario operativo estándar de SIC.
- Aplicar configuraciones básicas de la cuenta.
- Reducir tareas manuales durante el alistamiento.
- Garantizar homogeneidad en los equipos entregados.

---

## Funcionalidades

### Creación de Usuario

Usuario generado:

```text
OperadorSIC
```

---

### Nombre Completo

Configura:

```text
Operador SIC
```

como nombre descriptivo de la cuenta.

---

### Cuenta Sin Expiración

Aplica:

```text
/expires:never
```

mediante:

```cmd
net user OperadorSIC /expires:never
```

---

### Restricción de Cambio de Contraseña

Configura:

```text
/passwordchg:no
```

impidiendo que el usuario modifique la contraseña.

---

## Flujo de Ejecución

```text
Inicio
│
├── Mostrar información
├── Crear usuario
├── Configurar nombre completo
├── Configurar expiración
├── Configurar restricción de contraseña
│
└── Finalización
```

---

## Usuario Administrado

### Nombre

```text
OperadorSIC
```

---

### Nombre Completo

```text
Operador SIC
```

---

### Configuración

| Parámetro | Valor |
|-----------|-----------|
| Cuenta Local | Sí |
| Expira | No |
| Cambio de Contraseña | No |

---

## Dependencias

### Sistema Operativo

Windows.

---

### Herramientas del Sistema

```text
net.exe
```

---

### Batch

Comandos utilizados:

```cmd
net user
echo
pause
```

---

## Historial AIMT

El historial ya no se almacena dentro del archivo BAT.

Se conserva únicamente mediante documentación.

| Versión | Descripción |
|----------|----------|
| 1.0.0 | Script original Batch |

---

## Cambios Introducidos en TESSA

### Actualización de Identidad

Antes:

```text
Somos TSS CO. - Creacion de Usuario
```

Ahora:

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

---

### Eliminación del Historial Interno

El historial deja de mantenerse dentro del código.

La trazabilidad se realiza mediante:

- GitHub.
- Commits.
- Historial del repositorio.
- Documentación técnica.

---

### Sustitución de Accesos Directos

Los accesos directos tradicionales:

```text
*.lnk
```

fueron reemplazados por*lanzadores:

```text
*.cmd
``*

Beneficios:

- Compatibilidad co* Git.
- Portabilidad.
- Facilidad *e mantenimiento.
- Eliminación de *utas absolutas.
- Elevación automá*ica a administrador.

---

### Con*ervación Operativa

La funcionalid*d original se mantiene sin cambios*respecto a AIMT.

---

## Riesgos *etectados

### Usuario Fijo

La cu*nta:

```text
OperadorSIC
```

se *ncuentra definida directamente den*ro del script.

---

### Contraseñ* Fija

La contraseña se encuentra *lmacenada dentro del código.

---
*### Sin Validación Previa

No veri*ica si el usuario ya existe antes *e intentar crearlo.

---

### Sin *anejo de Errores

No existen valid*ciones ni captura de errores duran*e la ejecución.

---

## Mejoras F*turas

### Prioridad Alta

- Valid*ción de existencia previa.
- Manej* de errores.
- Registro de activid*des.

---

### Prioridad Media

- *onfiguración parametrizable.
- Def*nición de usuarios mediante variab*es.
- Configuración externa de cre*enciales.

---

### Prioridad Baja*
- Sustitución completa por Users.*s1.
- Administración mediante conf*guración centralizada.

---

## Re*ación con Users.ps1

Actualmente e*isten dos implementaciones del mód*lo.

### Implementación Histórica
*```text
Users.bat
```

---

### Im*lementación Evolutiva

```text
Use*s.ps1
```

La implementación Power*hell está destinada a convertirse *n el reemplazo definitivo del arch*vo BAT en futuras versiones de TES*A.

---

## Estado de Migración

#*# AIMT

✅ Funcionalidad migrada a *ESSA.

---

### TESSA

✅ Módulo op*rativo.

✅ Lanzador CMD portable i*plementado.

✅ Compatible con cual*uier ubicación del proyecto.

Vers*ón actual:

```text
2.0.0-alpha
``*

Próxima evolución:

- Consolidac*ón de Users.ps1.
- Migración gradu*l del uso operativo.
- Sustitución*definitiva de la versión Batch.

-*-

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