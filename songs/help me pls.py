import os


for i in os.scandir("./"):
    for j in os.scandir("./"+i.name+"/charts"):
        os.rename("./"+i.name+"/charts/"+j.name, "./"+i.name+"/charts/"+j.name[len(i.name):])