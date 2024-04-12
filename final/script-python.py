import os

location = "D:/Mauricio/Data-Analitycs/Tarea-parcial/dataset"


###Validar que la carpeta exista###
if not os.path.exists(location):
    ##En caso mi carpeta no exista, voy a crear una nueva##
    os.mkdir(location) ##mkdir -> make directory
else:
##Si la carpeta ya existe, entonces borramos el contenido##
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##elimino todos los archivos
    for name in dirs:
            os.rmdir(os.path.join(root,name)) ##rmdir -> remove directory / elimino todas mis carpetas

from kaggle.api.kaggle_api_extended import KaggleApi

api = KaggleApi()
api.authenticate()

#print(api.dataset_list(search='SAHIR MAHARAJ'))
api.dataset_download_file('sahirmaharajj/retail-sales-analysis','Warehouse_and_Retail_Sales.csv',path=location,quiet=False)

import zipfile

location = "D:/Mauricio/Data-Analitycs/Tarea-parcial/dataset"

##vamos a carpeta con archivo.zip y lo descomprimimos
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file, 'r')
    zip_ref.extractall()
    zip_ref.close()
