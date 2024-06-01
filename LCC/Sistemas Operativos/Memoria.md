****# Jerarquía de memoria
Hay distintos tipos de memoria, en primera instancia esta la del procesador, luego la ram(almacenamiento primario) y por ultimo el almacenamiento secundario.

- ***Memoria del procesador***:
	- Registros.
	- niveles de cache.
- Ram se accede por bytes, se puede representar como un arreglo de bytes.
- Almacenamiento secundario, se accede por Kb, se puede representar por un arreglo de bloques.

# RAM
El procesador se encarga de ubicar donde va a correr un proceso en la ram.

Se divide en bloques llamados paginas, el tamaño de estas paginas lo configura el SO y hace que la reubicación de procesos por fragmentacion sea mas sencillo.

## Direcciones virtuales
### MMU(Memory Management Unit)
Unidad independiente del procesador, transforma direcciones virtuales de los procesos en direcciones físicas de memoria. Aparece con la necesidad de tener mas de un [[Proceso]] cargado en memoria, también tiene la capacidad de abstraer el espacio de almacenamiento para dar la sensación de que hay mas espacio disponible del real. El [[Sistema operativo]] es el que se encarga de configurar dicha unidad.[^1]

[^1]: El sistema operativo es el encargado de asignar donde va a correr un proceso.
#### Funcionamiento
Agarra una dirección requerida por el procesador y le suma una "base" que corresponde al proceso que se esta ejecutando. Ademas de esto verifica que un proceso no acceda a direcciones que no le corresponden, para esto guarda un registro base y un registro limite. En caso de una falla en la operación de chequear que l dirección a la cual se quiere hacer fetch o execute, levanta una [[Señales |señal]] de *segmentation-fault*.

#### Tabla de paginación
Es parte de la mmu, la utiliza para facilitar la traducción de direcciones virtuales, se guarda en la memoria RAM donde haya hueco y la mmu guarda un puntero a la dirección física de la pagina del proceso que se esta ejecutando.
Cada pagina virtual corresponde con una pagina física del mismo tamaño.
Una pagina puede estar mapeada pero puede estar guardada en disco, la memoria.

![[Pasted image 20240430143132.png]]

##### Swapping
Cuando no hay espacio en memoria las paginas completas son enviadas al disco, esto es implementado por el sistema operativo.

#### Reverse Mapping
Es el proceso de obtener las entradas que apuntan a determinado marco. Se almacena los punteros a las entradas de traduccion que apuntan a cada marco. e utilizan punteros a regiones de memoria que permiten obtener (a través de otras tablas relacionadas) la misma información que se obtendría que si estas translation entrys estuviesen en una lista.

#### TLB
Es una cache de la tabla de paginacion, esta con la esperanza de que no se tengan que volver a traducir varias veces direcciones continuas, esto es para cuando hay varios niveles de paginacion y pasar por la tabla lleva su tiempo(por cada n niveles de paginacion se necesitan n accesos a memoria).



# Memoria compartida
Se divide el codigo `.text` en segmentos, lo que permite que varios procesos puedan compartir una seccion del codigo de texto. Requiere trabajo adicional en ocaciones pues se necesita saber cuando se puede liberar esta memoria, todos los procesos que la utilicen deben haber terminado.

Los procesos a su vez podrian compartir completamente un segmento  de `.text` o un segmento de `.rodata`(read-only data).

## Usos 
- librerias dinamicas.
- varias instancias de un mismo proceso. 

# Demand Loading
Las paginas solo se cargan en demanda, para no cargar paginas a memoria que no se precisen. 

# Politicas de paginación
Las paginas son cargadas y descargadas de la memoria bajo distintas políticas, cada una tiene sus particularidades pero todas se basan en Hits or Miss, los Miss son cuando la pagina buscada no es valida, es decir, hay que buscarla en memoria, pueden ser detectados por el fallo de pagina. Los Hits, son los casos en los que una pagina buscada si está cargada en memoria.
- **FIFO**: al cargar una página se toma nota de en qué momento fue cargada, cuando sea necesario reemplazar una página se elige la que haya sido cargada hace más tiempo. Todas las paginas tienen la misma posibilidad de ser reemplazadas sin importar su frecuencia de uso.
- **OPT**: de planteo teórico, se elige como pagina a reemplazar la que no vaya a ser utilizada por un tiempo máximo o nunca mas. Es el mejor pero requiere conocimiento a futuro de las paginas que van a ser necesarias 
- **LRU**: Se intenta aproximar a OPT reemplazando la pagina que hace mas tiempo no se utiliza, para esto hay que llevar cuenta de cuando una pagina se utiliza,lo que requiere apoyo de hardware.
	Debido a la complejidad del desarrollo de hardware necesario se desarrollaron sistemas para aproximarlo:
	- **Bit de Referencia**: Todas las entradas de la tabla de páginas tienen un bit adicional, al que llamaremos de *referencia* o de *acceso*, al iniciar la ejecicion estan siempre en 0, cada vez que se referencia un marco, su bit de referencia se enciende. (por lo general mediante hardware).
	- **Columna de referencia**:
- **MFU/LFU**: Se basan en mantener un contador, tal como lo hace LRU, pero en vez de medir el tiempo, miden la cantidad de referencias que se han hecho a cada página. MFU se basa en que si una pagina se uso mucho se va a seguir usando mucho. LFU se basa en que si una pagina se uso indica que la pagina esta recien cargada y se va a utilizar en un futuro cercano. 

LRU suele ser un poco mejor que OPT.

# Reclamo de Paginas

# Cache de disco
El disco es lento, mover el brazo del disco es lento, cada vuelta del disco para el SO es lento, por lo tanto cada vez que se va a leer de el disco se leen varios bloques contiguos y se guardan en cache, para que si se pide algun dato del mismo proceso se lo pueda buscar en alguno de estos bloques contiguos.

