En este archivo se describirá principalmente los archivos que se persisten en disco, no se tocarían en principio archivos no persistentes o generados dinamicamente. 

Los sistemas de archivos deben permitir:
- Persistencia: Para ello se utilizan dispositivos que almacenan bloques[^1] (conjuntos de datos de n-bytes, tipicamente `512`, `1024`) ver [[LBA]]
- Leer archivos
- Actualizarlos
- Eliminarlos

Para la implementacion de esta interfaz se deben tener en cuenta dos aspectos principales:
- La informacion a guardar.
- La informacion extra para el guardado de la informacion (metadatos).


# Metadata
- nombre.
- fecha.
- tamaño.
- donde estan sus bloques.

En un principio todo se guardaba en cada uno de los archivos, para que esto no relentice la busqueda, se comenzo a guardar esta informacion en una zona dedicada del sistema.

El lugar en donde se encuentran almacenados los fragmentos de un archivo van en la metadata, se guarda la info de donde estan cada uno de estos y el tamaño de cada uno.

# Archivo
Chunck de bytes :)


[^1]: Tambien llamados sectores. La lectura de ellos es mucho mas lenta que de la ram.


# SSD 
Los SSD se arruinan con la repetida escritura sobre el mismo sector, por eso mismo los telefonos no suelen tener memoria virtual.