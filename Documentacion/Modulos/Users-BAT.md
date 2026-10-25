# Módulo Users (BAT)

## Identidad del Módulo

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo: Users (BAT)
```

---

## Estado

Implementación actualmente utilizada en producción.

---

## Descripción

Users.bat es la implementación original del módulo de creación de usuarios desarrollado para AIMT.

Su objetivo es crear una cuenta local estándar utilizada durante la preparación y entrega de equipos corporativos.

---

## Origen

Implementación original basada en Batch.

Versión identificada:

```text
1.0.0
```

Fecha:

```text
07/10/2026
```

---

## Funcionalidades

### Creación de Usuario

Usuario configurado:

```text
OperadorSIC
```

---

### Nombre Completo

```text
Operador SIC
```

---

### Configuración de Cuenta

Aplica las siguientes configuraciones:

- La cuenta no expira.
- El usuario no puede cambiar la contraseña.

---

## Flujo Actual

```text
Inicio
│
├── Mostrar información de ejecución
├── Crear usuario
├── Configurar propiedades
└── Finalizar
```

---

## Dependencias

### Comando NET USER

```cmd
net user
```

---

## Riesgos Detectados

### Usuario Definido en Código

```text
OperadorSIC
```

---

### Contraseña Definida en Código

```text
Sic2026*
```

---

### Sin Validaciones

No verifica si el usuario ya existe previamente.

---

### Sin Registro de Eventos

No genera logs ni trazabilidad.

---

## Estado de Migración

Producción.

Pendiente de reemplazo por implementación PowerShell dentro de TESSA.