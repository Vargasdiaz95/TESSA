# Módulo Users (PowerShell)

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Users (PowerShell)
```

---

## Estado

Implementación en desarrollo.

No utilizada actualmente en producción.

---

## Descripción

Users.ps1 representa la evolución del módulo de creación de usuarios originalmente implementado en Batch.

Su objetivo es incorporar mejores prácticas de administración, manejo de errores y futuras capacidades de automatización dentro de TESSA.

---

## Origen

Migración del módulo Users.bat hacia PowerShell.

Versión identificada:

```text
1.1.2
```

Fecha:

```text
08/10/2026
```

---

## Mejoras Con Respecto a Users.bat

### UTF-8

Implementa soporte para caracteres especiales.

---

### Información de Equipo

Obtiene el serial del BIOS y genera un identificador de equipo.

Ejemplo:

```text
BOGXXXXXX
```

---

### Manejo de Errores

Implementa bloque:

```powershell
try
catch
```

---

### Administración Avanzada

Utiliza:

```powershell
Set-LocalUser
```

para garantizar:

- Contraseña sin expiración.
- Configuración consistente de la cuenta.

---

## Funcionalidades

### Creación de Usuario

Usuario configurado:

```text
OperadorSIC
```

---

### Configuración de Nombre Completo

```text
Operador SIC
```

---

### Configuración de Contraseña

Actualmente definida de forma estática:

```text
Sic2026*
```

---

### Configuración de Seguridad

- Contraseña nunca expira.
- Usuario no puede cambiar la contraseña.
- Cuenta sin expiración.

---

## Flujo Actual

```text
Inicio
│
├── Obtener serial del equipo
├── Generar identificador
├── Mostrar información
├── Crear usuario
├── Configurar propiedades
├── Aplicar PasswordNeverExpires
└── Finalizar
```

---

## Dependencias

### NET USER

```powershell
net user
```

### SET-LOCALUSER

```powershell
Set-LocalUser
```

---

## Riesgos Detectados

### Datos Embebidos

Actualmente el script contiene:

```text
OperadorSIC
```

```text
Operador SIC
```

```text
Sic2026*
```

directamente dentro del código.

---

### Sin Validación de Existencia

No valida si la cuenta ya fue creada anteriormente.

---

### Sin Registro de Eventos

Actualmente no genera logs.

---

## Valor para TESSA

Esta implementación constituye la base técnica prevista para convertirse en el futuro módulo oficial:

```text
Core
└── Users
```

dentro de la arquitectura TESSA.

---

## Estado de Migración

Documentado.

Pendiente de refactorización y adopción como implementación oficial del módulo Users.