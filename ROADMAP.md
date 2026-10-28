# ROADMAP

## Tecnossystem Smart Setup Assistant

```text
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant
```

Este documento define la hoja de ruta oficial para la evolución de TESSA, estableciendo objetivos, prioridades y metas técnicas para las próximas versiones de la plataforma.

---

# Estado Actual

Versión:

```text
2.0.0-alpha
```

Estado:

```text
Operativo
```

Situación actual:

✅ Migración AIMT → TESSA completada.

✅ Arquitectura definida.

✅ Módulos documentados.

✅ Rutas dinámicas implementadas.

✅ Logs implementados.

✅ Lanzadores CMD autoelevables implementados.

✅ Eliminación de dependencias AIMT.

✅ Documentación técnica completada.

Objetivo inmediato:

```text
Validación funcional y transición a 2.0.0-beta
```

---

# Versión 2.0.0-beta

## Objetivo General

Validar el funcionamiento completo de TESSA en escenarios reales de operación.

Esta versión estará enfocada en:

- Pruebas funcionales.
- Corrección de errores.
- Optimización de módulos.
- Fortalecimiento de validaciones.
- Estabilización de la arquitectura actual.

---

## Actividades Principales

### Validación de Módulos

Ejecutar pruebas completas sobre:

```text
Init
```

```text
Hosts
```

```text
Personalizacion
```

```text
Users-BAT
```

```text
Users-PS1
```

```text
Drivers-Lenovo
```

---

### Validación de Portabilidad

Pruebas desde:

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

---

### Validación de Logs

Comprobar:

- Creación correcta de registros.
- Formato consistente.
- Escritura de resultados.
- Manejo de errores.

---

### Validación de Dependencias

Verificar:

- Instaladores.
- Drivers.
- Wallpapers.
- Componentes.

---

### Optimización

Objetivos:

- Reducir código duplicado.
- Mejorar mensajes.
- Simplificar rutas.
- Estandarizar procedimientos.

---

## Resultado Esperado

```text
TESSA estable para validación operativa
```

---

# Versión 2.0.0

## Objetivo General

Publicar la primera versión estable de TESSA.

---

## Metas

### Estabilidad

Todos los módulos deberán:

- Ejecutar correctamente.
- Generar logs válidos.
- Completar procesos sin errores críticos.

---

### Documentación Consolidada

Documentación completa para:

- Arquitectura.
- Migración.
- Contribución.
- Módulos.
- Versionamiento.

---

### Gobernanza del Proyecto

Documentos obligatorios:

```text
README.md
```

```text
CHANGELOG.md
```

```text
CONTRIBUTING.md
```

```text
LICENSE
```

```text
ROADMAP.md
```

---

### Sustentabilidad

La plataforma deberá operar sin dependencias de AIMT.

---

## Resultado Esperado

```text
TESSA v2.0.0 Stable
```

---

# Versión 2.1.0

## Objetivo General

Introducir capacidades de orquestación y modularización avanzada.

---

## Start-TESSA

Implementación de:

```text
Start-TESSA.ps1
```

Funciones previstas:

- Menú central.
- Ejecución de módulos.
- Selección de perfiles.
- Validaciones previas.

---

## Configuración Centralizada

Externalización de parámetros actualmente embebidos.

Ejemplos:

- Usuarios.
- Credenciales.
- Hosts.
- Wallpapers.
- Aplicaciones.

---

## Inventario

Implementación inicial de:

```text
Inventario
```

Capacidades previstas:

- Hardware.
- Software.
- Seriales.
- Exportación.

---

## Resultado Esperado

```text
TESSA con administración centralizada
```

---

# Versión 2.5.0

## Objetivo General

Expandir la plataforma más allá del perfil SIC.

---

## Soporte Multi Perfil

Capacidad para manejar varios perfiles corporativos.

Ejemplo:

```text
Perfiles
├── SIC
├── ClienteA
├── ClienteB
└── Laboratorio
```

---

## Configuración Independiente

Cada perfil podrá:

- Definir aplicaciones.
- Definir usuarios.
- Definir fondos.
- Definir restricciones.

---

## Resultado Esperado

```text
TESSA multiperfil
```

---

# Versión 3.0.0

## Objetivo General

Convertir TESSA en una plataforma integral de despliegue y soporte.

---

## Interfaz Gráfica

Evaluar implementación mediante:

```text
PowerShell WPF
```

o

```text
WinUI
```

---

## Inventario Avanzado

Capacidades previstas:

- Exportación CSV.
- Exportación Excel.
- Resúmenes ejecutivos.
- Reportes técnicos.

---

## Gestión de Controladores

Capacidades previstas:

- Detección automática de fabricante.
- Selección automática de repositorio.
- Validación previa.

---

## Configuración Dinámica

Implementación de:

```text
JSON
```

o

```text
YAML
```

como mecanismo oficial de configuración.

---

## Resultado Esperado

```text
TESSA como plataforma integral de automatización
```

---

# Mejoras Continuas

Estas actividades podrán ejecutarse en cualquier etapa.

## Calidad

- Limpieza de código.
- Refactorización.
- Optimización.

---

## Seguridad

- Eliminación de credenciales embebidas.
- Parametrización de configuraciones sensibles.
- Reducción de privilegios innecesarios.

---

## Observabilidad

- Mejora de logs.
- Mayor detalle de errores.
- Métricas de ejecución.

---

## Documentación

- Manuales operativos.
- Manuales técnicos.
- Diagramas arquitectónicos.
- Diagramas de flujo.

---

# Criterios para Avanzar de Alpha a Beta

TESSA podrá avanzar oficialmente a:

```text
2.0.0-beta
```

cuando se cumplan las siguientes condiciones:

### Arquitectura

✅ Completada.

### Documentación

✅ Completada.

### Migración

✅ Completada.

### Licenciamiento

✅ Definido.

### Portabilidad

✅ Validada.

### Módulos

- [ ] Init validado.
- [ ] Hosts validado.
- [ ] Personalizacion validado.
- [ ] Users-BAT validado.
- [ ] Users-PS1 validado.
- [ ] Drivers-Lenovo validado.

### Logs

- [ ] Verificados en pruebas reales.

---

# Estado Actual del Roadmap

```text
Versión actual:        2.0.0-alpha
Próxima versión:       2.0.0-beta
Objetivo inmediato:    Pruebas funcionales
```

---

# Responsable

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