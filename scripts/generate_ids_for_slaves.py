import re
from pathlib import Path
from datetime import datetime

BOATS = {
    'TASA21': {
        'file': 'TASA21.sql',
        'out': 'TASA21_slaves_ids.sql',
        'base': {'slave5': 6854, 'slave6': 6087},
    },
    'TASA22': {
        'file': 'TASA22.sql',
        'out': 'TASA22_slaves_ids.sql',
        'base': {'slave5': 6225, 'slave6': 5368},
    },
    'TASA210': {
        'file': 'TASA210.sql',
        'out': 'TASA210_slaves_ids.sql',
        'base': {'slave5': 6358, 'slave6': 5536},
    },
    'TASA218': {
        'file': 'TASA218.sql',
        'out': 'TASA218_slaves_ids.sql',
        'base': {'slave5': 6869, 'slave6': 5971},
    },
}

TODAY_STR = '2025-11-19'

def parse_fecha(val):
    s = val.strip().strip("'")
    try:
        return datetime.strptime(s, '%Y-%m-%d %H:%M:%S')
    except Exception:
        return None

def extract_values(line):
    m = re.search(r"VALUES\s*\((.*)\)\s*;\s*$", line)
    if not m:
        return None
    return m.group(1)

def process_boat(config):
    path = Path(config['file'])
    if not path.exists():
        return 0
    entries = {'slave5': [], 'slave6': []}
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            if line.startswith("INSERT INTO `slave5`") or line.startswith("INSERT INTO `slave6`"):
                table = 'slave5' if 'INSERT INTO `slave5`' in line else 'slave6'
                vals = extract_values(line)
                if not vals:
                    continue
                first_comma = vals.find(',')
                fecha_val = vals[:first_comma]
                dt = parse_fecha(fecha_val)
                entries[table].append((dt, vals))
    for t in entries:
        entries[t] = [e for e in entries[t] if e[0] is not None]
        entries[t].sort(key=lambda x: x[0])
    out_path = Path(config['out'])
    with open(out_path, 'w', encoding='utf-8') as w:
        total = 0
        for table in ['slave5', 'slave6']:
            base_id = config['base'][table]
            cur_id = base_id
            cur_today = 9000
            for dt, vals in entries[table]:
                id_val = cur_today if dt.strftime('%Y-%m-%d') == TODAY_STR else cur_id
                if dt.strftime('%Y-%m-%d') == TODAY_STR:
                    cur_today += 1
                else:
                    cur_id += 1
                cols = 'id, ' + ('fecha, year, month, day, hour, minute, latitude, longitude, speed, heading, odometer, HORO_MP, HORO_G1, HORO_G2, HORO_G3, HORO_G4, HORO_G5, ACEITE_1, ACEITE_2, ACEITE_3, ACEITE_4' if table == 'slave6' else 'fecha, year, month, day, hour, minute, latitude, longitude, speed, heading, odometer, TK_1, TK_2, TK_3, TK_4, TK_5, TK_6, TK_7, TK_8, TOTAL')
                w.write(f"INSERT INTO `{table}` ({cols}) VALUES ({id_val}, {vals});\n")
                total += 1
    return total

def main():
    grand_total = 0
    for name, cfg in BOATS.items():
        count = process_boat(cfg)
        print(f"{name}: {count} INSERTs con id -> {cfg['out']}")
        grand_total += count
    print(f"Total: {grand_total}")

if __name__ == '__main__':
    main()