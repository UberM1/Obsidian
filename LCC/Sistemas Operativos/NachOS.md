ver:
- See mips run
- SPIM a mips r2000 simulator.
- `yay -S cross-mipsel-linux-gnu-gcc` para instalar el cross compiler.
plancha 3
- No se puede llenar mas de 0s en la inicializacion.
- Si se puede inicializar con 0s la zona que no es stack(pero es buena practica por seguridad) cuando se reserva la zona de memoria de un proceso.
- al momento de crear la tabla de paginacion hay que asignar paginas que sabemos que estan libres -> usar un mapa de bits para saber si la pagina esta ocupada. hay bitmap en lib usar eso(hay que meterlo en system.cc).
- cambiar en las llamadas de read code block para que se use la paginación y que sepa que las paginas estan fragmentadas.
- modificar exec para argumentos variables(hay que mover los datos a las paginas correspondientes, tienen que ser punteros validos a las paginas de paginacion usadas). hay que hacer una copia -> buffer del kernel -> pasar de ahi a la memoria del nuevo proceso (en el address space, el stack. Si se implementa un syscall hay que guardarlo en el kernel). Esto esta implementado en algunas funciones como: write_args
	- el puntero de argumentos es un array que arranca con null y termina con null. 
	- Cuando se copia al stack hay que dejar un hueco, comentario de CAUTION en args.hh

