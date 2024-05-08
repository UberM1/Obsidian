Son un mecanismo de comunicacion entre [[Proceso]]s 

un ^C, `segmentation fault` por ejemplo son señales, se podría decir que son eventos a los que todos los procesos reaccionan.

kill sirve para enviar señales por defecto envía una "señal por defecto" pero podemos especificar algunas otras.

signal sirve para capturar una señal, con esto se configuran los handlers.

raise sirve para enviar una señal al mismo proceso que invoca esta función

> `man 7 signal` podemos ver mucha informacion de como el kernel funciona con el manejo de señales y que hace cada una.

- `SIG_KILL`: no funciona si el proceso esta en estado zombie o bloqueado, envia al proceso directamente a estado terminado, sin pasar por el estado zombie. Utilizar `SIG_KILL` puede llevar a perdidadas de información.

# Señales y Hardware
muchas problemas de hardware como dividsion por 0 fallo de segmentacion etc, avisa al SO para ver si puede arreglarlo, y en caso de no poder envia una señal al proceso correspondiente. 

## Handlers
los handlers se encargan de recibir una señal enviada al proceso para reaccionar a modo de respuesta, como un intento de arreglar un error o reaccionar a un evento.

Si no hay un manejador configurado para una señal en particular, entonces se usa el manejador por defecto si llega esa señal no manejada puede interrumpir el proceso, sencillamente ignorar la señal, provocar un volcado, etc...
