Los [[Proceso|procesos]] de tiempo real son procesos que requieren *garantías de tiempo*, se les debe garantizar tener determinado tiempo de proceso antes de un tiempo límite.
Algunos ejemplos mas comunes:
- Controladores de dispositivos
- reproductores de medios
- recodificadores.

Para ser clasificado como proceso de tiempo real deben declarar sus requisitos de tiempo, al iniciar su ejecución o en el transcurso de la misma. Estos procesos obtienen una *prioridad* mayor, por lo general en una cola exclusiva de alta prioridad.

> Los sistemas donde el tiempo máximo es garantizable se los considera de *tiempo real duro*. Por otro lado el *tiempo real suave*, requiere que los procesos críticos reciban trato prioritario, pero no da garantías sobre el tiempo máximo.
> 
> Al *tiempo real suave* se lo puede considerar como un sistema de retroalimentación multilevel donde:
> - La cola de tiempo real es la de mayor prioridad
> - Los procesos de dicha cola no degradan su prioridad con el tiempo, sin importar si se ejecutan repetidamente.
> - La prioridad de los demás procesos nunca llega a la de tiempo real.
> - la latencia de despacho es minima.

# Sistemas en tiempo real
Un dispositivo vuelca información en un area de la memoria dedicada que actúa como buffer. Al inicializarse el proceso en tiempo real que actúa como su controlador declara cuánto tiempo le tomará recoger, procesar la información y la frecuencia con que dicha operación tiene que ocurrir. Luego de ejecutarse el controlador libera el buffer para el siguiente ciclo de escritura del dispositivo.

Un ***sistema*** es de ***de tiempo real*** si puede garantizar que en ese intervalo se le otorgara al proceso en cuestión el tiempo de computo necesario para procesar la información del buffer.

En caso de que el [[Sistema Operativo|SO]] no pueda garantizar este tiempo de computo avisará con una señal al proceso para que este pueda alertar al usuario.

La necesidad de atención puede ser *periódica* (necesito computo cada 30ms) o *aperiódica*(necesito que este proceso que dura X termine en menos de 3s).

Toda implementación de tiempo real precisa que el planificador sepa cuanto tiempo cuestan las tareas, sin embargo a veces ocurre que hay recursos de latencia variable e impredecible, en estos casos no se puede garantizar tiempo real duro.

