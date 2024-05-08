Decide momento a momento cual va a ser siguiente proceso en ocupar tiempo de proceso, es el encargado de planificar sobre los procesos que estan *listos para ejecución*.

# Objetivos
- **Ser Justo**: a procesos que compartan caragteristicas se los debe tratar de igual manera.
- **Maximizar el rendimiento**: tratar de atender la mayor cantidad de procesos por unidad de tiempo
- **ser predesible**: Si se corre dos veces un mismo trabajo tiene que tomar aproximadamente la misma cantidad de tiempo independientemente de la carga actual del sistema.
- **Minimizar la sobrecarga**: El algoritmo de planificacion debe ser ligero.
- **Equilibrar el uso de recursos**: favorecer a los recursos que usen recursos abundantes y penalizar a los que estorben el sistema por requerir recursos escazos.
- **Evitar la postergacion indefinida**: Aumentar la prioridad a procesos que llevan mas tiempo en espera.
- **Favorecer el uso esperado del sistema**: maximizar la prioridad a procesos del mismo sistema.
- **Dar preferencia a los procesos que podrian causar bloqueos**:  si un proceso esta esperando que un recurso sea liberado por un recurso de prioridad menor, favorecer a dicho proceso para que pueda terminar ==problema inversion de prioridades==.
- **Favorecer los procesos con un comportamiento deseable**: Si un proceso esta hueveando con llamadas al sistema o requests de I/O bajarle la prioridad.
- **Degradarse suavemente**: Usar siempre el 100% del procesador es imposible, se debe buscar responder con la menor penalización a los procesos pre- existentes al momento de exceder este umbral.

# Planificación en [[Sistemas Batch]]

# Fifo
Tipo de cola que hacen que el primer elemento en ingresar a la cola va a ser el primero en ingresar

## SPF 
Shortest process first. Este tipo de colas intenta dar prioridad a los procesos mas cortos, para ello se necesita una duracion aproximada de cuando dura dicho proceso.
### Algoritmo en cooperación
Calculo el $e_p$ para cada proceso
Luego, cuando un proceso ceda la ejecutcion al nucleo, se calcula $e_p = f*e_p + (1-f)*q$ 
> q = cuantos tics uso el procesador.
> $e_p$ = promedio ponderado de la duracion de la ejecucion.
> $f$ = un numero que lo que hace es ir bajando la prioridad de los procesos cortos con la finalidad de que se lleguen a ejecutar los procesos de menor prioridad(chequear en el libro).

Desventajas: 
- Hay que buscar un criterio para f.
- Requiere buscar continuamente el proceso minimo.
- hay que determinar el $e_p$ inicial.
## HPRN
Funciona bajo el mismo criterio que shortest process first solo que busca dar prioridad a los procesos que tienen una mayor penalizacion primero.
 Cada vez que es obligado a esperar un tiempo w por otro proceso, P se actualiza como:
$$P = \dfrac{w+t}{t}$$
> w = Tiempo esperado
> t = tiempo en ejecucion
> P siempre inicia en 1

Desventaja es que hay que hacer el calculo luego de ada iteracion y es costoso calcularlo para cada proceso.


## Sistemas cooperativos
los sistemas coperativos son sistemas donde el proceso que esta ejecutandose nunca es interrumpido, solo cortara su ejecucion en caso de que voluntariamente haga un yield o un transfer(transferirle la ejecucion a otro proceso).


# Sistemas Apropiativos
La ejecición de un proceso corta cuando se terminan su quantum de ejecucion, puede terminar el uso de su quantum o puede bloquearse, lo que le cede la ejecucion al proximo proceso.

> Cuando ocurre un cambio de contexto se pierde tiempo de ejecucion, por lo que se recomienda el uso de un q intermedio.

## Round Robin
La idea principal es que hay una cola, donde la ejecución se permite por `X` cantidad de quantums, luego son enviados nuevamente a la cola y a esperar de nuevo. Los procesos nuevos ingresan al final de la cola.
cuanto mas grande sea `X` la ronda tiende mas a una `FIFO`, si `X` es chico incrementan la cantidad de cambios de contexto y por ende baja el rendimiento. 

## Selfish Round Robin
selfish, de egoísta, busca dar prioridad a procesos que ya se encuentran en ejecución, estos tendran prioridad sobre procesos nuevos hasta que hayan estado en espera el tiempo necesario para que su prioridad aumente.

- Siempre se elije el primero de la cola.
- Hay dos colas, una de procesos nuevos y otra de procesos aceptados.
- Un proceso nuevo pasa a aceptado una vez que su prioridad aumenta lo suficiente(un proceso nuevo alcanza la prioridad de un proceso aceptado)
- La prioridad sirve para ver si el proceso pasa a la cola de aceptados o no, y esta prioridad se actualiza cada un quantum(por lo general).
$p' = p + a|b$ 

> a y b son modificadores de cada una de las colas, aceptados y nuevos resp, hay que tener cuidado al seleccionarlos pues dependiendo de el valor pueden pasar muy rápido los procesos nuevos a aceptados o pueden no pasar nunca lo ideal es que $\dfrac{b}{a}< 1$.
> - Si b/a >= 1 se transforma en FCFS
> - si b = 0 es una ronda comun.


## Multicolas con prioridad

Hay mas de una cola, entonces dependiendo de la prioridad de un proceso va a una cola u otra, siempre que haya procesos en la cola de alta prioridad serán ejecutados, no se ejecutaran procesos de baja prioridad a no ser que no haya procesos de prioridad mayor.
> El problema de esto es que puede que haya una starvation de procesos de baja prioridad. Tambien puede ocurrir que un proceso de alta prioridad y largo termine siendo degradado a baja prioridad.

Para solucionar este problema se utilizan algoritmos que utilizan distintos metodos para lograr que un proceso de menor prioridad llegue a ejecutarse:
- Asignar quantums mas largos a procesos de menor prioridad.
- Re calcular las prioridades de los procesos.


## Loteria
En este método cada proceso tiene una cierta cantidad de números y el planificador saca un numero random, el proceso que tenga dicho numero es el que le toca la ejecución, este numero sorteado **no** se des-asigna de un proceso sino que lo conserva.

Se pueden manejar prioridades asignando mas números a los procesos con mas prioridad, y el sistema de turnos se maneja con probabilidades.

Algo que se puede implementar es que cuando un primer proceso espere la salida de un segundo, se puede dar los numeros del primer proceso al segundo para resolver el problema de inversion de prioridades.
# Planificación de multiprocesadores
En base a los tipos de planificaciones anteriormente mencionados, hay dos soluciones posibles para la planificación cuando se tiene mas de un procesador, puede elegirse despachar a los [[procesadores]] por igual, tomándolos como unidades de ejecución idénticas e iguales o pueden mantenerse listas separadas de procesos.

El sistema de una cola única de donde los procesadores consumen procesos no se suele emplear pues no facilita la *afinidad* por un procesador.

## Afinidad a un procesador
Luego de que un proceso se ejecuta en un determinado procesador, habrá datos del proceso cargados en la cache del mismo. Por eso, resulta conveniente que los procesos tengan *afinidad* por un determinado procesador/núcleo, es decir, que en caso de que hubiesen ocupado tiempo de ejecución en un determinado procesador/núcleo, no se muevan de este, pues en caso de moverlos de moverlos habría que, a demás de copiar los datos del proceso, invalidarlos de la cache de la unidad de computo que se haya utilizado.[^1]

A partir de lo dicho anteriormente, tenemos 2 tipos de afinidades:
- **Afinidad suave**: Cuando un proceso se ejecuta *preferentemente* en un procesador. Una eventual sobrecarga en el procesador por el cual este proceso tiene afinidad podria llevar a que el proceso en espera fuera despachado a otro procesador.
- **Afinidad dura**: Disponible solo en algunos SO, la *afinidad dura* garantiza la ejecución de dicho proceso en un procesador o conjunto de procesadores.
> Un entorno [[NUMA]] funcionaria mejor si el sistema que lo emplea manejara un esquema de afinidad dura y algoritmos de asignación de memoria que le aseguren que un proceso siempre se ejecutara en el procesador que tenga mejor acceso a sus datos.

[^1]: *Este caso de uso depende del sistema sobre el que se este trabajando*: en caso de que el proceso se mueva de núcleo, puede que solamente haya que invalidar los datos de la cache L1, porque la cache L2 es compartida por lo general, pero en caso de movelo de procesador, se va a tener que invalidar también la L2 en caso de que la L3 sea compartida y así hasta que el sistema de computo anterior no tenga mas datos validos del proceso. 

## Balanceo de cargas
Por el contrario que la *Afinidad a procesadores*, el balanceo de cargas utiliza algoritmos que analizan el estado de las colas de procesos con la finalidad de homogeneizarlas. Pues en un caso ideal que se estén despachando trabajos de forma eficiente, todos los procesadores de nuestro sistema de computo estarán al 100%.
Lo que se busca es que la divergencia entre las cargas de cada uno de los procesadores sea la menor posible, justamente, afectando a procesos con afinidad suave.

Se plantean dos tipos de estrategias para lograr el balanceo de carga:
- **Push migration**: consiste en una tarea que se ejecuta en tiempo de núcleo(es parte del núcleo) y periódicamente revisa el estado de los procesadores. En caso de encontrar un desbalance por afuera de el permitido, empuja procesos de una cola a otra.[^2]
- **Pull migration**: Este tipo de migración se ejecuta cuando un procesador se queda sin tareas, en este caso el procesador carga una tarea especial (idle). El tiempo de de proceso de esta tarea se emplearía como tiempo de núcleo y este se encargaría ahí en caso de que lo considere oportuno, de traer nuevos procesos a la cola de este procesador.
> Todo balanceo de cargas que se haga conllevara a una penalización al CPU pues tiene que invalidar los datos que los otros procesadores/núcleos tengan de los procesos reubicados.

[^2]: Linux ejecuta este algoritmo cada 200 milisegundos.

# Planificación Híbrida

Son casos donde por ejemplo un sistema multicolas no utiliza en todas sus colas round robin sino que tambien pueden tener distintos algoritmos en cada una de las colas. 

En estos sistemas es muy importante tener algoritmos que necesiten poco tiempo de computo de kernel porque sino a cada cambio de contexto se va a perder mucho tiempo.



# [[Hilos#Planificación de Hilos|Planificación de Hilos]]

# Multiprocesadores
El planificador tiene la carga de cada uno de los procesadores, en caso de que un procesador tenga sobrecarga, puede reubicar procesos de dicho procesador para que tome mas tareas y distribuir de mejor forma la carga 
