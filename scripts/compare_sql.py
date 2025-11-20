import sys
from pathlib import Path
from collections import defaultdict

def load_inserts(p):
    lines = []
    tbl_counts = {}
    with open(p, 'r', encoding='utf-8', errors='ignore') as f:
        for i, line in enumerate(f, 1):
            s = line.strip()
            if s.startswith('INSERT INTO `'):
                lines.append((i, s))
                t = s.split('`')[1]
                tbl_counts[t] = tbl_counts.get(t, 0) + 1
    return lines, tbl_counts

def main():
    if len(sys.argv) != 3:
        print('usage: compare_sql.py NEW.sql OLD.sql')
        sys.exit(1)
    new_p = Path(sys.argv[1])
    old_p = Path(sys.argv[2])
    new_lines, new_counts = load_inserts(new_p)
    old_lines, old_counts = load_inserts(old_p)
    new_set = set(s for _, s in new_lines)
    old_set = set(s for _, s in old_lines)
    missing_in_new = sorted(list(old_set - new_set))
    added_in_new = sorted(list(new_set - old_set))
    dup_map_old = defaultdict(list)
    for ln, s in old_lines:
        dup_map_old[s].append(ln)
    duplicates_old = {s: locs for s, locs in dup_map_old.items() if len(locs) > 1}
    print(f'Nuevo total INSERTs: {len(new_lines)}')
    print(f'Antiguo total INSERTs: {len(old_lines)}')
    print(f'Nuevo únicos: {len(new_set)}  Duplicados en nuevo: {len(new_lines)-len(new_set)}')
    print(f'Antiguo únicos: {len(old_set)}  Duplicados en antiguo: {len(old_lines)-len(old_set)}')
    print('Nuevo por tabla:')
    for t in sorted(new_counts.keys()):
        print(f'  {t}: {new_counts[t]}')
    print('Antiguo por tabla:')
    for t in sorted(old_counts.keys()):
        print(f'  {t}: {old_counts[t]}')
    print(f'Diferencias: faltan en nuevo: {len(missing_in_new)}, agregadas en nuevo: {len(added_in_new)}')
    def first_n(items, n=30):
        for i in items[:n]:
            print(i)
    print('Faltan en nuevo (primeros 30):')
    first_n(missing_in_new, 30)
    print('Agregadas en nuevo (primeros 30):')
    first_n(added_in_new, 30)
    print(f'Duplicados en antiguo (total {len(duplicates_old)}):')
    # Mostrar todos los duplicados con sus líneas de aparición
    for s in sorted(duplicates_old.keys()):
        locs = duplicates_old[s]
        print(f'COUNT={len(locs)} LINES={locs} :: {s}')

    # Write reports
    stem = new_p.stem
    dup_file = Path(f'duplicados_old_{stem}.txt')
    add_file = Path(f'agregados_new_{stem}.txt')
    with open(dup_file, 'w', encoding='utf-8') as w:
        w.write(f'Duplicados en antiguo: {len(duplicates_old)}\n')
        for s in sorted(duplicates_old.keys()):
            locs = duplicates_old[s]
            w.write(f'COUNT={len(locs)} LINES={locs} :: {s}\n')
    with open(add_file, 'w', encoding='utf-8') as w:
        w.write(f'Agregadas en nuevo: {len(added_in_new)}\n')
        for s in added_in_new:
            w.write(s + '\n')
    print(f'Escritos {dup_file} y {add_file}')

if __name__ == '__main__':
    main()