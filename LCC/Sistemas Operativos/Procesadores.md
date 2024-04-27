# Funcionamiento
## Hyperthreading(hilos de hardware)
Es una metodología implementada en ciertos procesadores que ofrecen un nivel de concurrencia adicional. Debido a la alta frecuencia de los procesadores y la necesidad de "esperar" por recursos se separa el procesador en *unidades funcionales.

El flujo de una instrucción a través de un procesador simple como un MIPS puede ser dividido en cinco etapas[^1], creando una "pipeline". Idealmente habría una instrucción ejecutándose en cada una de las secciones del procesador.

![[Pasted image 20240414182323.png]]

Las divisiones en el MIPS son:
- Recuperación de la instrucción (Instruction Fetch, IF).
- Decodificación de la instrucción (Instruction Decode, ID).
- Ejecución (Execution, EX).
- Acceso a datos (MEM).
- Almacenamiento (Writeback, WB).

[^1]: Actualmente los procesadores pueden contar con mas de 20 etapas.

Pero se descubrió que con implementar únicamente estas pipelines no es suficiente pues se sigue desperdiciando tiempo de computo a la espera de que una de las componentes termine de procesar la instrucción correspondiente, por lo que se emplea el **Hyper threading**, que consiste en atender varios procesos en un mismo procesador con la finalidad de aprovechar este tiempo de computo adicional.

![[Pasted image 20240414183031.png]]

Los hilos en hardware implican cuestiones de complejidad tal como el ordenamiento específico de las instrucciones, predicción de ramas de ejecución, e incluso asuntos relativos a la seguridad, dado que se han presentado goteos que permiten a un proceso ejecutando en un hilo espiar el estado del procesador correspondiente a otro de los hilos.