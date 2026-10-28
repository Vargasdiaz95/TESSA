# Plan de Pruebas Beta

## TESSA v2.0.0-beta

---

# Objetivo

Validar la estabilidad operativa de todos los módulos antes de declarar una versión Beta.

---

# Entorno de Pruebas

## Sistemas Operativos

- Windows 10
- Windows 11

---

# Ubicaciones

Validar funcionamiento desde:

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
F:\TESSA
```

---

# Escenario 1

## Equipo Nuevo

Ejecutar:

- Init
- Hosts
- Personalizacion
- Users
- Drivers-Lenovo

Validar:

- Instalaciones
- Usuarios
- Personalización
- Drivers

---

# Escenario 2

## Equipo Reutilizado

Ejecutar nuevamente todos los módulos.

Objetivo:

- Identificar duplicados.
- Identificar errores.
- Verificar comportamiento repetitivo.

---

# Escenario 3

## Portabilidad

Mover TESSA entre unidades.

Validar:

- Scripts
- Logs
- Recursos
- Drivers
- Aplicaciones

---

# Escenario 4

## Generación de Logs

Validar:

```text
Init_ALIAS.log
```

```text
Hosts_ALIAS.log
```

```text
Personalizacion_ALIAS.log
```

```text
Users_ALIAS.log
```

```text
Drivers-Lenovo_ALIAS.log
```

---

# Riesgos a Validar

## Init

- Instaladores faltantes.
- Instaladores corruptos.
- Fallos DISM.

---

## Hosts

- Entradas duplicadas.
- Permisos insuficientes.

---

## Personalizacion

- Wallpapers inexistentes.
- Usuarios inaccesibles.

---

## Users

- Usuario existente.
- Contraseña inválida.

---

## Drivers-Lenovo

- INF corruptos.
- Drivers incompatibles.
- Repositorio incompleto.

---

# Condición de Salida

Se podrá promover:

```text
TESSA v2.0.0-beta
```

cuando:

- Todos los casos críticos sean satisfactorios.
- Los logs funcionen correctamente.
- Las rutas dinámicas funcionen correctamente.
- No existan dependencias AIMT.
- No existan errores bloqueantes.

---

# Resultado Esperado

```text
Aprobación de TESSA v2.0.0-beta
```

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