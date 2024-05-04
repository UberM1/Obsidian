Se la define como dos eventos que ocurren simultáneamente pero no se puede predecir el orden relativo en el que ocurrirán. Por lo general adicionalmente, ambas tareas deben tener algún tipo de vinculo, que por lo general es el conflictivo.
> Aunque una de las tareas principales de los sistemas operativos es dar a cada proceso la ilusión de que se está ejecutando en una computadora dedicada, de modo que el programador no tenga que pensar en la competencia por recursos, a veces un programa requiere interactuar con otros: parte del procesamiento puede depender de datos obtenidos en fuentes externas, y la cooperación con hilos o procesos externos es fundamental.

# Conceptos
## Operacion atomica
Manipulacion de datos que se debe asegurar de que se ejecutará de manera ininterrumpida, es decir, que ningun otro proceso interferirá en la ejecucion o fallará completamente, no mediante un error, sino que tendria un resultado no deseado.
## Race Condition
Errores de programacion que se dan cuando dos procesos fallan al comunicarse su estado mutuo y esto lleva a resultados inconsistentes. Generalmente consecuencia de no considerar la atomicidad de una operación.
## Sección critica
Área del codigo que requiere ser protegida de accesos simultaneos, donde se realiza la modificación de datos compartidos.
## Recurso Compartido
Recurso que se puede tener acceso desde mas de un proceso. Pueden ser variables, archivos, perisfericos, etc.