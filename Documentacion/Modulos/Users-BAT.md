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

Actualmente se conserva por razones de compatibilidad y operación mientras continúa la evolución del módulo Users.ps1.

---

## Ubicación

### Script

```text
TESSA
└── Perfiles
    └── SIC
        └── Core
            └── Users.bat
```

### Acceso Directo

```text
TESSA
└── Perfiles
    └── SIC
        └── Users_Bat.lnk
```

---

## Estado del Módulo

| Elemento | Estado |
|----------|----------|
| Migración a TESSA | Completa |
| Producción | Activo |
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
/exists:never
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
├── Configurar restricciones
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
|------------|------------|
| Expira | No |
| Cambio Contraseña | No |
| Cuenta Local | Sí |

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

Se conserva mediante documentación.

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

### Conservación Operativa

La funcionalidad original se mantiene sin cambios.

---

## Riesgos Detectados

### Usuario Fijo

La cuenta:

```text
OperadorSIC
```

se encuentra definida directamente dentro del script.

---

### Contraseña Fija

La contraseña se encuentra almacenada dentro del código.

---

### Sin Validación Previa

No verifica si el usuario ya existe antes de crearlo.

---

### Sin Manejo de Errores

No existen validaciones o captura de errores durante la ejecución.

---

## Mejoras Futuras

### Prioridad Alta

- Validación de existencia previa.
- Manejo de errores.
- Registro de actividades.

---

### Prioridad Media

- Configuración parametrizable.
- Definición de usuario mediante variables.

---

### Prioridad Baja

- Sustitución completa por Users.ps1.
- Administración mediante configuración centralizada.

---

## Relación con Users.ps1

Actualmente existen dos implementaciones del módulo:

### Producción

```text
Users.bat
```

---

### Evolución

```text
Users.ps1
```

La implementación PowerShell está destinada a convertirse en el reemplazo definitivo del archivo BAT en futuras versiones de TESSA.

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