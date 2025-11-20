import pandas as pd
from pathlib import Path
from datetime import datetime, timedelta
import re

def parse_dt(received):
    if pd.isna(received):
        return None
    if isinstance(received, (pd.Timestamp, datetime)):
        dt = pd.to_datetime(received).to_pydatetime()
        original_str = received
    else:
        s = str(received).strip()
        original_str = s
        try:
            dt = datetime.strptime(s, "%Y-%m-%d %H:%M:%S")
        except ValueError:
            try:
                dt = datetime.strptime(s, "%d/%m/%Y %H:%M:%S")
            except ValueError:
                return None
    return (dt - timedelta(hours=5), original_str)

def fmt_fecha(dt, original):
    s = str(original)
    if '/' in s:
        return dt.strftime("%d/%m/%Y %H:%M:%S")
    return dt.strftime("%Y-%m-%d %H:%M:%S")

def ymdhm(dt):
    return dt.strftime("%y"), str(dt.month), str(dt.day), str(dt.hour), str(dt.minute)

def to_int_str(x, default="0"):
    try:
        if pd.isna(x):
            return default
        return str(int(round(float(x))))
    except Exception:
        return default

def to_str(x, default="0"):
    if pd.isna(x):
        return default
    if isinstance(x, str):
        return x.strip()
    try:
        xf = float(x)
        if xf.is_integer():
            return str(int(xf))
        return str(x)
    except Exception:
        return str(x)

def latlon_scaled(lat, lon):
    return to_int_str(float(lat) * 60000 if not pd.isna(lat) else 0), to_int_str(float(lon) * 60000 if not pd.isna(lon) else 0)

def estado_from_text(text):
    s = str(text).lower()
    if "encend" in s:
        return "1"
    if "apag" in s:
        return "2"
    return "0"

def bomba_name(text):
    m = re.search(r"bomba\s*(\d+)", str(text).lower())
    if m:
        return f"bomba{m.group(1)}"
    m2 = re.search(r"bomba(\d+)", str(text).lower())
    if m2:
        return f"bomba{m2.group(1)}"
    return None

def build_insert(table, cols, vals):
    values = ", ".join(vals)
    return f"INSERT INTO `{table}` ({', '.join(cols)}) VALUES ({values});"

def quote(v):
    return f"'{v}'"

def process_row(row):
    parsed = parse_dt(row.get('Received'))
    if not parsed:
        return None, None, None
    dt, original_rec = parsed
    fecha = fmt_fecha(dt, original_rec)
    year, month, day, hour, minute = ymdhm(dt)
    lat_s, lon_s = latlon_scaled(row.get('latitude'), row.get('longitude'))
    speed = to_str(row.get('speed'), "0")
    odometer = to_str(row.get('odometer'), "0")
    heading = to_str(row.get('heading_degrees') if 'heading_degrees' in row else row.get('heading'), "0")
    msg = str(row.get('Message Name') or '').strip()

    # reporte_J1939 -> reportesmelecto (EXCLUIDO por indicación)
    if msg == 'reporte_J1939':
        return None, None, None

    # slave5
    if msg == 'slave5':
        cols = ['fecha','year','month','day','hour','minute','latitude','longitude','speed','heading','odometer','TK_1','TK_2','TK_3','TK_4','TK_5','TK_6','TK_7','TK_8','TOTAL']
        vals = [quote(fecha), quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(heading), quote(odometer)]
        for i in range(1,9):
            vals.append(quote(to_str(row.get(f'TK_{i}'), '0')))
        total_val = to_str(row.get('TK_9'), '0')
        vals.append(quote(total_val))
        return 'slave5', build_insert('slave5', cols, vals), dt

    # slave6
    if msg == 'slave6':
        cols = ['fecha','year','month','day','hour','minute','latitude','longitude','speed','heading','odometer','HORO_MP','HORO_G1','HORO_G2','HORO_G3','HORO_G4','HORO_G5','ACEITE_1','ACEITE_2','ACEITE_3','ACEITE_4']
        vals = [quote(fecha), quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(heading), quote(odometer), quote(to_str(row.get('HORO_MP'), '0'))]
        for k in ['HORO_G1','HORO_G2','HORO_G3','HORO_G4','HORO_G5','ACEITE_1','ACEITE_2','ACEITE_3','ACEITE_4']:
            vals.append(quote(to_str(row.get(k), '0')))
        return 'slave6', build_insert('slave6', cols, vals), dt

    # slave1
    if msg == 'slave1':
        cols = ['fecha','year','month','day','hour','minute','latitude','longitude','speed','heading','odometer','PR_BR','PR_ER','PR_CT','PP_CT','PP_BR','PP_ER','TEMP_1','TEMP_2','TEMP_3','TEMP_4','TEMP_5','TEMP_6','CHIBR_IN','CHIBR_OUT','CHIER_IN','CHIER_OUT','CHICT_IN','CHICT_OUT','HORO_1','HORO_2','ON_OFF1','ON_OFF2']
        vals = [quote(fecha), quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(heading), quote(odometer)]
        for k in ['PR_BR','PR_ER','PR_CT','PP_CT','PP_BR','PP_ER','TEMP_1','TEMP_2','TEMP_3','TEMP_4','TEMP_5','TEMP_6','CHIBR_IN','CHIBR_OUT','CHIER_IN','CHIER_OUT','CHICT_IN','CHICT_OUT','HORO_1','HORO_2','ON_OFF1','ON_OFF2']:
            vals.append(quote(to_str(row.get(k), '0')))
        return 'slave1', build_insert('slave1', cols, vals), dt

    # bombas / bnwas
    if 'bomba' in msg.lower():
        name = bomba_name(msg)
        estado = estado_from_text(msg)
        if name in {'bomba7','bomba8','bomba9'}:
            cols = ['fecha','year','month','day','hour','minute','latitude','longitude','speed','odometer','nombre_bomba','estado','shell']
            vals = [quote(fecha), quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(odometer), quote(name), estado, "0"]
            return 'bnwas', build_insert('bnwas', cols, vals), dt
        # bombas específicas
        if name and name.startswith('bomba'):
            numero = name.replace('bomba','')
            table = f'bomba{numero}'
            # bomba6 has different column names
            if table == 'bomba6':
                cols = ['YEAR','MONTH','DAY','HOUR','MINUTE','latitude','longitude','speed','odometer','estado','fecha','shell']
                vals = [quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(odometer), estado, quote(fecha), "0"]
                return table, build_insert(table, cols, vals), dt
            else:
                cols = ['fecha','year','month','day','hour','minute','latitude','longitude','speed','odometer','estado']
                vals = [quote(fecha), quote(year), quote(month), quote(day), quote(hour), quote(minute), quote(lat_s), quote(lon_s), quote(speed), quote(odometer), estado]
                return table, build_insert(table, cols, vals), dt

    return None, None, None

def process_file(path):
    xls = pd.ExcelFile(path)
    df = pd.read_excel(xls, sheet_name=xls.sheet_names[0], dtype=object)
    items = []
    for _, r in df.iterrows():
        table, sql, dt = process_row(r)
        if table and sql and dt:
            items.append((table, dt, sql))
    return items

def main():
    boats = {
        'excel-TASA21': 'TASA21.sql',
        'excel-TASA22': 'TASA22.sql',
        'excel-TASA218': 'TASA218.sql',
        'excel-TASA210': 'TASA210.sql',
    }
    base = Path('.')
    out_dir = base
    order = ['bnwas','bomba1','bomba2','bomba3','bomba4','bomba5','bomba6','bomba10','slave1','slave5','slave6']
    for boat_dir, out_name in boats.items():
        groups = {}
        files = sorted((base / boat_dir).glob('*.xlsx'))
        for f in files:
            for table, dt, sql in process_file(f):
                groups.setdefault(table, []).append((dt, sql))
        out_path = out_dir / out_name
        with open(out_path, 'w', encoding='utf-8') as w:
            total = 0
            written_tables = set()
            for tbl in order:
                if tbl in groups:
                    items = sorted(groups[tbl], key=lambda x: x[0])
                    for _, sql in items:
                        w.write(sql + "\n")
                    total += len(items)
                    written_tables.add(tbl)
            for tbl in sorted(groups.keys()):
                if tbl in written_tables:
                    continue
                items = sorted(groups[tbl], key=lambda x: x[0])
                for _, sql in items:
                    w.write(sql + "\n")
                total += len(items)
            print(f'Generated {out_path} with {total} INSERTs')

if __name__ == '__main__':
    main()