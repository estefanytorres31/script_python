import sys
from pathlib import Path
from collections import defaultdict

def load_inserts(p):
    lines = []
    with open(p, 'r', encoding='utf-8', errors='ignore') as f:
        for i, line in enumerate(f, 1):
            s = line.strip()
            if s.startswith('INSERT INTO `'):
                lines.append((i, s))
    return lines

def write_duplicates_report(file_path, lines):
    dup_map = defaultdict(list)
    for ln, s in lines:
        dup_map[s].append(ln)
    duplicates = {s: locs for s, locs in dup_map.items() if len(locs) > 1}
    stem = Path(file_path).stem
    out = Path(f'duplicados_{stem}.txt')
    with open(out, 'w', encoding='utf-8') as w:
        w.write(f'Duplicados: {len(duplicates)}\n')
        for s in sorted(duplicates.keys()):
            locs = duplicates[s]
            w.write(f'COUNT={len(locs)} LINES={locs} :: {s}\n')
    return out, len(duplicates)

def main():
    files = [
        'TASA21.sql',
        'TASA22.sql',
        'TASA210.sql',
        'TASA218.sql',
    ]
    if len(sys.argv) > 1:
        files = sys.argv[1:]
    for fp in files:
        p = Path(fp)
        if not p.exists():
            print(f'{fp} no existe')
            continue
        lines = load_inserts(p)
        out, count = write_duplicates_report(fp, lines)
        print(f'{fp}: duplicados={count}, reporte={out}')

if __name__ == '__main__':
    main()