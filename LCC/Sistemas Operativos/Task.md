Se le llama task a un [[Proceso|proceso]] o un [[Hilos|hilo]] en ejecucion, las tasks pueden tener distintos estados:
-  TASK_RUNNING
-  TASK_INTERRUPTABLE
-  TASK_STOPPED
-  TASK_UNINTERRUMPABKE
-  EXIT_ZOMBIE
-  EXIT_DEAD

Se clasifican dos tipos de tareas, las normales y las de tiempo real, las de tiempo real tienen mayor prioridad.[^1]
[^1]: Esta es la definicion de task dada por el profesor en clase, en contraposicion la definicion de task por el libro se puede encontrar en la pagina [[Fundamentos de los sistemas operativos.pdf#page=69&selection=31,0,39,52|69]]

## Prioridades(linux)
Las prioridades van de 0 a 139
- de 0 a 99 se asigna prioridad a las tareas de tiempo real.
- de 100 a 139 el resto de las tareas. El default es de 120.

Revisar apunte para mas info.

Wait_runtime se define a partir del real clock que se configura en base a la cantidad de procesos que hay dividido un segundo. El wait runtime se modifica segun la prioridad.

el comando `nice` o `renice` en linux permite cambiar la priordad de ejecucion de una tarea. Sin embargo con estos comandos no se puede subir la prioridad de un proceso a tiempo real.

En linux todos las tasks corriendo aparecen en /proc



