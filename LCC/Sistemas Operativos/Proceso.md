Un proceso es la imagen en memoria de un [[programa]], junto con el estado de su ejecución. 
## Proceso corto
Esperan mucho bloqueados a eventos particulares y su tiempo de ejecución en respuesta a estos eventos es corto. Son procesos limitados por la E/S.
> Según el profe el corto es el que en un [[Sistema Operativo#Quantum|quantum]] puede terminar su ejecución.

## Proceso largo
Procesos que por mucho tiempo estuvieron listos o en ejecución, procesos limitados por CPU.
> Según el profe son procesos que demoran varios [[Sistema Operativo#Quantum|quantum]] para terminar la ejecución.


# Estados de un proceso
- **Nuevo**: Solicitó al [[Sistema Operativo|SO]] la creación de un proceso, y sus recursos y estructuras están siendo creadas.
- **Listo**: listo para iniciar o continuar su ejecución pero el sistema no le ha asignado un procesador.
- **En ejecución**: El proceso está siendo ejecutado en este momento. Sus instrucciones están siendo procesadas en algún procesador.
- **Bloqueado**: En espera de algún evento para poder continuar su ejecución (aun si hubiera un procesador disponible, no podría avanzar).
- **Zombie**: El proceso ha finalizado su ejecución, pero el sistema operativo debe realizar ciertas operaciones de limpieza para poder eliminarlo de la lista.
- **Terminado**: El proceso terminó de ejecutarse, sus estructuras están a la espera de ser limpiadas por el [[Sistema Operativo|SO]].
