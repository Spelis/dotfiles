from sys import argv
from pathlib import Path

print(Path(*Path(argv[1]).parts[-2:]))

