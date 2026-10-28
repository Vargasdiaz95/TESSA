# Changelog

Todos los cambios relevantes de TESSA deben registrarse en este documento.

El proyecto sigue el esquema:

```text
Mayor.Menor.Parche
```

Ejemplo:

```text
2.0.0-alpha
```

---

# [UNRELEASED]

## Próxima Versión

```text
2.0.0-beta
```

Estado:

```text
Planificada
```

---

## Objetivos

- Validación funcional de los módulos.
- Ejecución de pruebas operativas.
- Validación de portabilidad.
- Validación de logs.
- Corrección de incidencias detectadas durante pruebas.
- Preparación para liberación Beta.

---

## Calidad

Pruebas definidas mediante:

```text
CASOS-PRUEBA.md
```

```text
MATRIZ-VALIDACION-BETA.md
```

```text
PLAN-PRUEBAS-BETA.md
```

```text
PRUEBAS-SIMULACION.md
```

---

## Resultado Esperado

Promoción oficial de:

```text
TESSA v2.0.0-alpha
```

a:

```text
TESSA v2.0.0-beta
```

una vez completadas satisfactoriamente todas las pruebas funcionales.

---

# [2.0.0-alpha]

Fecha:

```text
2026
```

Estado:

```text
Actual
```

---

## Arquitectura

### AIMT → TESSA

- Migración oficial de AIMT a TESSA.
- Definición de identidad de plataforma.
- Reorganización estructural del proyecto.
- Creación de arquitectura modular documentada.

---

### Portabilidad

- Eliminación de dependencias de:

```text
C:\AIMT
```

- Implementación de rutas dinámicas mediante:

```powershell
Resolve-Path
```

- Compatibilidad con múltiples ubicaciones de ejecución.

---

### Lanzadores

- Eliminación progresiva de archivos:

```text
*.lnk
```

- Implementación*de:

```*ext
*.cmd
```

autoelevables media*te UAC.

---

## Módulos

### Init*
- Migrado a arquitectura T*SSA.
- Implementación de logs.
- R*tas dinámicas.
- Actualización doc*mental.

---

### Hosts

- Migrado*a arquitectura TESSA.
- Incorporac*ón de logs.
- Eliminación de depen*encias AIMT.

---

### Personaliza*ion

- Migrado a arquitectura TESS*.
- Recursos movidos al perfil SIC*
- Incorporación de logs.

---

##* Users-BAT

- Conservado por compa*ibilidad operativa.
- Documentació* completa.
- Integración con lanza*or CMD.

---

### Users-PS1

- Evo*ución inicial completada.
- Incorp*ración de logs.
- Preparado para f*tura sustitución de Users.bat.

--*

### Drivers-Lenovo

- Migrado a *rquitectura TESSA.
- Implementació* de logs.
- Conversión a rutas din*micas.

---

## Documentación

###*Arquitectura

Documentos generados*

```text
Arquitectura-TESSA.md
Ma*a-Migracion-AIMT-TESSA.md
```

---*
### Módulos

Documentación genera*a para:

```text
Init
Hosts
Person*lizacion
Users-BAT
Users-PS1
Drive*s-Lenovo
```

---

### Gobierno de* Proyecto

Documentos generados:

*``text
README.md
CHANGELOG.md
CONT*IBUTING.md
ROADMAP.md
LICENSE
```
*---

## Calidad

Documentación de *ruebas creada:

```text
CASOS*PRUEBA.md
```

```text
MATRIZ-*ALIDACION-BETA.md
```

```text
PLA*-PRUE*AS-BETA.md
```

```text
PRUEBAS*SIMULACION.md
```

---

## Lic*nciamiento

- Migración desde lice*cia MIT.
- Implementación*de:

```text
Tecnossystem Internal*Use License *TIUL) v1.0
```

---

## Estado

Ve*sión:

```text
TESSA v2.*.0-alpha
```

Migración:

*``text
Completada
```

Documentaci*n:

```text*Completada
```

Arquitectura:

```*ext
Com*letada
```

Próxima versión:

```*ext
2.0.0-beta
```