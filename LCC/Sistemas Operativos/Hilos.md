# Tipos de Hilo
## Hilos de Usuario/Verdes
Son hilos gestionados completamente dentro del proceso y sin ayuda del sistema operativo.
## Hilos de Núcleo/Kernel
Hilos gestionados por el sistema operativo, como si fueran procesos.

# Planificación de Hilos
La planificación de hilos depende de como estén mapeados estos a procesos, se plantean tres tipos de mapeos:
- **Muchos a uno**: Es el caso de los hilos verdes. El SO asigna el tiempo de proceso a un proceso y este proceso es el encargado de asignar tiempo de ejecución a cada uno de sus hilos[^1].
- **Uno a uno**: en este modelo cada hilo se mapea con un proceso ligero. En este caso se mantiene la sencillez y rapidez de inicialización(como característica de los hilos), pues el costo de crear un LWP es mucho menor que la de un proceso regular, puesto que ademas los hilos continúan compartiendo su memoria, [[file descriptors]] y demás estructuras.
- **Muchos a muchos**: Este es un mecanismo mixto pues permite *bound threads*, donde hay hilos que corresponden a solo un *LWP*, y *unbound threads*, que uno o mas están mapeados a un *LWP*.[^2] 

## Hilos POSIX(pthreads)
Los pthreads son una interfaz en algunos lenguajes de programación que siguen ciertas reglas y permiten la configuración y el manejo del comportamiento de hilos desde el código.

## Contención
los hilos pthread tienen dos enfoques con respecto a la contención que deben tener, es decir, que atención le debe dar el SO a dos hilos que son resultado de la separación de ejecución de un proceso?

- *Process Contention Scope*: Todos los hilos deben ser atendidos sin exceder el tiempo que seria asignado a un solo proceso. En esta categoría caen los procesos que siguen un modelo de *muchos a uno* o uno que multiplexa varios hilos no unidos bajo un modelo de muchos a muchos.
- *System Contention Scope*: En esta categoría caen los hilos que son vistos por el planificador como un proceso independiente. En este caso los hilos son tratados como procesos normales.

[^1]: Este modelo no aprovecha realmente el paralelismo y hace que todos los hilos se bloqueen cuando uno de ellos realiza una llamada bloqueante al sistema.
[^2]: Este modelo tiene la ventaja de que cuando se esta ejecutando sobre un sistema que no soporta los los mapeos **uno a uno** puede derivar en un modelo degradado que funcione como un **muchos a muchos**.
