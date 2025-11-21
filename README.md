# Proyecto de Conversión Excel a SQL para Embarcaciones TASA

Este proyecto contiene scripts en Python para procesar datos de telemetría de embarcaciones pesqueras TASA, convirtiendo archivos Excel en archivos SQL con sentencias INSERT para diferentes tablas de base de datos.

## 📋 Descripción

El sistema procesa datos de telemetría de múltiples embarcaciones (TASA21, TASA22, TASA210, TASA218) que incluyen información de:
- Posición GPS (latitud/longitud)
- Sensores de tanques (TK_1 a TK_9)
- Horómetros y aceites (slave6)
- Presiones y temperaturas (slave1)
- Estado de bombas (bomba1 a bomba10, bnwas)

## 🚀 Requisitos

### Dependencias
```bash
pip install pandas openpyxl
```

### Estructura de Directorios
```
script_python/
├── convert_excel_to_sql.py          # Script principal de conversión
├── excel-TASA21/                    # Archivos Excel de TASA21
├── excel-TASA22/                    # Archivos Excel de TASA22
├── excel-TASA210/                   # Archivos Excel de TASA210
├── excel-TASA218/                   # Archivos Excel de TASA218
├── scripts/
│   ├── compare_sql.py               # Comparación de archivos SQL
│   ├── find_duplicates_sql.py       # Búsqueda de duplicados
│   ├── generate_ids_for_slaves.py   # Generación de IDs
│   └── list_sheets.py               # Listar hojas de Excel
└── README.md
```

## 📖 Uso

### 1. Conversión de Excel a SQL

El script principal `convert_excel_to_sql.py` procesa todos los archivos Excel de cada embarcación y genera archivos SQL:

```powershell
python convert_excel_to_sql.py
```

**Salida generada:**
- `TASA21.sql` - Sentencias INSERT para TASA21
- `TASA22.sql` - Sentencias INSERT para TASA22
- `TASA210.sql` - Sentencias INSERT para TASA210
- `TASA218.sql` - Sentencias INSERT para TASA218

### 2. Listar Hojas de Excel

Para verificar las hojas y columnas de los archivos Excel:

```powershell
python scripts/list_sheets.py
```

Muestra:
- Nombres de las hojas en cada archivo
- Lista de columnas disponibles
- Primeras 3 filas de muestra

### 3. Buscar Duplicados

Para encontrar sentencias INSERT duplicadas en los archivos SQL generados:

```powershell
python scripts/find_duplicates_sql.py
```

O para archivos específicos:

```powershell
python scripts/find_duplicates_sql.py TASA21.sql TASA22.sql
```

**Salida generada:**
- `duplicados_TASA21.txt` - Reporte de duplicados con números de línea
- `duplicados_TASA22.txt`
- `duplicados_TASA210.txt`
- `duplicados_TASA218.txt`

### 4. Comparar Versiones de SQL

Para comparar dos versiones de un archivo SQL (nuevo vs antiguo):

```powershell
python scripts/compare_sql.py NUEVO.sql ANTIGUO.sql
```

**Salida generada:**
- `duplicados_old_NUEVO.txt` - Duplicados en archivo antiguo
- `agregados_new_NUEVO.txt` - Sentencias nuevas agregadas

**Información mostrada:**
- Total de INSERTs en cada archivo
- Conteo de únicos vs duplicados
- Estadísticas por tabla
- Diferencias entre versiones

### 5. Generar IDs para Slaves

Para agregar IDs auto-incrementales a las tablas slave5 y slave6:

```powershell
python scripts/generate_ids_for_slaves.py
```

**Salida generada:**
- `TASA21_slaves_ids.sql` - Con columna id agregada
- `TASA22_slaves_ids.sql`
- `TASA210_slaves_ids.sql`
- `TASA218_slaves_ids.sql`

**Configuración de IDs base:**
- TASA21: slave5=6854, slave6=6087
- TASA22: slave5=6225, slave6=5368
- TASA210: slave5=6358, slave6=5536
- TASA218: slave5=6869, slave6=5971

Los registros de la fecha actual (2025-11-19) inician con id=9000.

## 🗃️ Tablas Generadas

### slave5 (Datos de Tanques)
```sql
INSERT INTO `slave5` (fecha, year, month, day, hour, minute, latitude, longitude, 
                      speed, heading, odometer, TK_1, TK_2, TK_3, TK_4, TK_5, 
                      TK_6, TK_7, TK_8, TOTAL) VALUES (...)
```

### slave6 (Horómetros y Aceites)
```sql
INSERT INTO `slave6` (fecha, year, month, day, hour, minute, latitude, longitude, 
                      speed, heading, odometer, HORO_MP, HORO_G1, HORO_G2, HORO_G3, 
                      HORO_G4, HORO_G5, ACEITE_1, ACEITE_2, ACEITE_3, ACEITE_4) VALUES (...)
```

### slave1 (Presiones y Temperaturas)
```sql
INSERT INTO `slave1` (fecha, year, month, day, hour, minute, latitude, longitude, 
                      speed, heading, odometer, PR_BR, PR_ER, PR_CT, PP_CT, PP_BR, 
                      PP_ER, TEMP_1, TEMP_2, TEMP_3, TEMP_4, TEMP_5, TEMP_6, 
                      CHIBR_IN, CHIBR_OUT, CHIER_IN, CHIER_OUT, CHICT_IN, CHICT_OUT, 
                      HORO_1, HORO_2, ON_OFF1, ON_OFF2) VALUES (...)
```

### bomba1-bomba10 (Estado de Bombas)
```sql
INSERT INTO `bomba1` (fecha, year, month, day, hour, minute, latitude, longitude, 
                      speed, odometer, estado) VALUES (...)
```

### bnwas (Bombas Especiales)
```sql
INSERT INTO `bnwas` (fecha, year, month, day, hour, minute, latitude, longitude, 
                     speed, odometer, nombre_bomba, estado, shell) VALUES (...)
```

## ⚙️ Funcionalidades Principales

### Procesamiento de Fechas
- Convierte fechas de múltiples formatos
- Ajusta zona horaria (-5 horas)
- Preserva formato original de fecha

### Conversión de Coordenadas
- Escala latitud/longitud por factor de 60000
- Maneja valores nulos

### Procesamiento de Mensajes
- **slave5**: Datos de tanques (TK_1 a TK_9)
- **slave6**: Horómetros y aceites
- **slave1**: Presiones, temperaturas y chilleres
- **bombas**: Detecta estado (encendido/apagado)
- **reporte_J1939**: EXCLUIDO del procesamiento

### Ordenamiento
Los INSERTs se generan en orden cronológico y por tipo de tabla:
1. bnwas
2. bomba1-bomba10
3. slave1
4. slave5
5. slave6

## 📊 Ejemplo de Uso Completo

```powershell
# 1. Listar contenido de archivos Excel
python scripts/list_sheets.py

# 2. Convertir todos los Excel a SQL
python convert_excel_to_sql.py

# 3. Verificar duplicados
python scripts/find_duplicates_sql.py

# 4. Generar versiones con IDs
python scripts/generate_ids_for_slaves.py

# 5. Comparar con versión anterior (si existe)
python scripts/compare_sql.py TASA21.sql TASA21_old.sql
```

## 📝 Notas Importantes

- Los archivos Excel deben estar en las carpetas `excel-TASA*` correspondientes
- El formato de fecha esperado: `YYYY-MM-DD HH:MM:SS` o `DD/MM/YYYY HH:MM:SS`
- Los mensajes `reporte_J1939` son excluidos del procesamiento
- La columna `Message Name` determina el tipo de tabla destino
- Los valores nulos se convierten a "0" por defecto

## 🐛 Solución de Problemas

### Error: "No module named 'pandas'"
```powershell
pip install pandas openpyxl
```

### Error: "No such file or directory"
Verificar que las carpetas `excel-TASA*` existan y contengan archivos .xlsx

### Duplicados inesperados
Usar `find_duplicates_sql.py` para identificar y analizar duplicados

### IDs incorrectos en slaves
Verificar configuración de IDs base en `generate_ids_for_slaves.py`

## 👥 Embarcaciones Soportadas

- **TASA21**: Embarcación pesquera
- **TASA22**: Embarcación pesquera
- **TASA210**: Embarcación pesquera
- **TASA218**: Embarcación pesquera

## 📄 Licencia

Proyecto interno para procesamiento de datos de telemetría de embarcaciones TASA.
