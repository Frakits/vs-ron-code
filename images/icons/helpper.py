import os

for i in os.scandir():
    if not ".py" in i.name:
        os.rename(i.name, i.name[5:])