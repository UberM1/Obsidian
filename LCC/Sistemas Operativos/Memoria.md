# Jerarquía de memoria
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

#### TLB
Es una cache de la tabla de paginacion, esta con la esperanza de que no se tengan que volver a traducir varias veces direcciones continuas, esto es para cuando hay varios niveles de paginacion y pasar por la tabla lleva su tiempo(por cada n niveles de paginacion se necesitan n accesos a memoria).




