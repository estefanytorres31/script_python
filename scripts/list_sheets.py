import sys
from pathlib import Path
import pandas as pd

def main():
    base = Path('.')
    boats = [
        'excel-TASA21',
        'excel-TASA22',
        'excel-TASA218',
        'excel-TASA210',
    ]
    for boat in boats:
        boat_dir = base / boat
        files = sorted(boat_dir.glob('*.xlsx'))
        if not files:
            print(f'{boat}: no excel files')
            continue
        f = files[0]
        xls = pd.ExcelFile(f)
        print(f'{boat} -> {f.name}: {xls.sheet_names}')
        df = pd.read_excel(xls, sheet_name=xls.sheet_names[0])
        print(f'Columns: {list(df.columns)}')
        print(df.head(3).to_string(index=False))

if __name__ == '__main__':
    main()