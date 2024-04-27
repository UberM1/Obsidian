Son un mecanismo de comunicacion entre [[proceso]]s 

un ^C, `segmentation fault` por ejemplo son señales, se podria decir que son eventos a los que todos los procesos reaccionan.

kill sirve para enviar señales por defecto envia una "señal por defecto" pero podemos especificar algunas otras.

> `man 7 signal` podemos ver mucha informacion de como el kernel funciona con el manejo de señales y que hace cada una.

# Señales y Hardware
muchas problemas de hardware como dividsion por 0 fallo de segmentacion etc, avisa al SO para ver si puede arreglarlo, y en caso de no poder envia una señal al proceso correspondiente. 

## Handlers
los handlers se encargan de recibir la señal enviada al proceso y reaccionar a modo de respuesta, como un intento de arreglar un error.

