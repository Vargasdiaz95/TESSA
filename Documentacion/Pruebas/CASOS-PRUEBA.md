# Casos de Prueba

## TESSA v2.0.0-beta

Este documento registra las pruebas funcionales oficiales de los módulos de TESSA.

---

# Init

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| INIT-001 | Ejecutar Init.cmd | Inicio correcto | ☐ |
| INIT-002 | Instalar 7-Zip | Instalación exitosa | ☐ |
| INIT-003 | Instalar Adobe Reader | Instalación exitosa | ☐ |
| INIT-004 | Instalar Chrome | Instalación exitosa | ☐ |
| INIT-005 | Instalar Java | Instalación exitosa | ☐ |
| INIT-006 | Instalar LibreOffice | Instalación exitosa | ☐ |
| INIT-007 | Instalar DeepL | Instalación exitosa | ☐ |
| INIT-008 | Instalar Jarvis Browser | Instalación exitosa | ☐ |
| INIT-009 | Instalar TightVNC | Instalación exitosa | ☐ |
| INIT-010 | Instalar Dell Command Update | Instalación exitosa | ☐ |
| INIT-011 | Instalar SupportAssist | Instalación exitosa | ☐ |
| INIT-012 | Habilitar .NET 3.5 | Activado correctamente | ☐ |
| INIT-013 | Renombrar equipo | Hostname actualizado | ☐ |
| INIT-014 | Etiquetar unidad C | Etiqueta aplicada | ☐ |
| INIT-015 | Generar log | Init_ALIAS.log creado | ☐ |

---

# Hosts

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| HOST-001 | Ejecutar Hosts.cmd | Inicio correcto | ☐ |
| HOST-002 | Crear entradas Hosts | Entradas agregadas | ☐ |
| HOST-003 | Bloquear Netflix | Resolución a 127.0.0.1 | ☐ |
| HOST-004 | Bloquear YouTube | Resolución a 127.0.0.1 | ☐ |
| HOST-005 | Ejecutar FlushDNS | Sin errores | ☐ |
| HOST-006 | Generar log | Hosts_ALIAS.log creado | ☐ |

---

# Personalizacion

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| PER-001 | Ejecutar módulo | Inicio correcto | ☐ |
| PER-002 | Copiar wallpaper | Archivo copiado | ☐ |
| PER-003 | Configurar HKU.DEFAULT | Correcto | ☐ |
| PER-004 | Configurar usuarios existentes | Correcto | ☐ |
| PER-005 | Habilitar predicción de texto | Correcto | ☐ |
| PER-006 | Mostrar porcentaje de batería | Correcto | ☐ |
| PER-007 | Generar log | Personalizacion_ALIAS.log creado | ☐ |

---

# Users-BAT

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| UBAT-001 | Crear OperadorSIC | Usuario creado | ☐ |
| UBAT-002 | Configurar expiración | Nunca expira | ☐ |
| UBAT-003 | Deshabilitar cambio contraseña | Correcto | ☐ |

---

# Users-PS1

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| UPS1-001 | Crear OperadorSIC | Usuario creado | ☐ |
| UPS1-002 | PasswordNeverExpires | Correcto | ☐ |
| UPS1-003 | PasswordChangeDisabled | Correcto | ☐ |
| UPS1-004 | Generar log | Users_ALIAS.log creado | ☐ |

---

# Drivers-Lenovo

| ID | Caso de Prueba | Resultado Esperado | Estado |
|------|------|------|------|
| LEN-001 | Descubrir INF | Archivos encontrados | ☐ |
| LEN-002 | Procesar controladores | Correcto | ☐ |
| LEN-003 | Generar resumen final | Correcto | ☐ |
| LEN-004 | Generar log | Drivers-Lenovo_ALIAS.log creado | ☐ |

---

# Pruebas de Portabilidad

| ID | Caso | Estado |
|------|------|------|
| PORT-001 | Ejecutar desde C:\TESSA | ☐ |
| PORT-002 | Ejecutar desde D:\TESSA | ☐ |
| PORT-003 | Ejecutar desde E:\Herramientas\TESSA | ☐ |
| PORT-004 | Ejecutar desde USB | ☐ |