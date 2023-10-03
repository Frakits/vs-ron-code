import os


for i in os.scandir("./"):
    if not ".py" in i.name: 
        for j in os.scandir("./"+i.name+"/charts"):
            if not 'hard' in j.name: os.remove(j)