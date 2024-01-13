import json
import zipfile
import os

api_token={"username":"pedro1491","key":"109351cf68d2f5cf2f4c81d77193ba9b"} #contenido de archivo kaggle.json
#conectar a kagle
with open('C:/Users/pedro/.kaggle/kaggle.json','w') as file:
    json.dump(api_token, file)

location = "C:/Users/pedro/OneDrive/Escritorio/certus/ops/proyecto_parcial/dataset"

#validar que la carpeta exista
if not os.path.exists(location):
    #si la carpeta no existe crear carpeta
    os.mkdir(location)
else:
    #si la carpeta existe se borra su contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) # elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name))  #elimino toda slas carpetas

#descarga data set de kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/pedro/OneDrive/Escritorio/certus/ops/proyecto_parcial/dataset")

os.chdir(location)
for file in os.listdir():      
    zip_ref = zipfile.ZipFile(file,"r")
    zip_ref.extractall()
    zip_ref.close()
    


