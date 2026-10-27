"""Validate SQL-analysis notebook JSON and Python code-cell syntax.

This is a static check only: it does not connect to MySQL/PostgreSQL or claim query
results have been executed against a source dataset.
"""
import ast
import json
from pathlib import Path

NOTEBOOKS = [
    Path("D-Mart/Data_Mart_SQL_Solutions_Findings.ipynb"),
    Path("Retail Sales Analysis/Retail_Sales_SQL_Solutions_Findings.ipynb"),
    Path("Netflix Movies and TV Shows/Netflix_SQL_Solutions_Findings.ipynb"),
    Path("Spotify Advanced SQL Project/Spotify_SQL_Solutions_Findings.ipynb"),
]


def main():
    for path in NOTEBOOKS:
        notebook = json.loads(path.read_text(encoding="utf-8"))
        if notebook.get("nbformat") != 4 or not isinstance(notebook.get("cells"), list):
            raise ValueError(f"{path}: invalid notebook structure")
        checked = 0
        for index, cell in enumerate(notebook["cells"]):
            if cell.get("cell_type") != "code":
                continue
            source = cell.get("source", "")
            if isinstance(source, list):
                source = "".join(source)
            try:
                ast.parse(source, filename=f"{path} cell {index}")
            except SyntaxError as exc:
                raise SyntaxError(f"{path}, cell {index}: {exc}") from exc
            checked += 1
        print(f"Validated {path}: notebook JSON + {checked} Python code cells")
    print("SQL solutions notebook static validation passed.")


if __name__ == "__main__":
    main()
