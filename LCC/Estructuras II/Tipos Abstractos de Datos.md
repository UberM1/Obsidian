# Definicion
- La idea es separar la implementacion de el comportamiento.
- La finalidad de los TADs es abstraer detalles de implementacion.
- Un usuario es alquien que usa dicha abstraccion, el el implementador provee una implementacion que se ajusta al comportamiento esperado. 
- El usuario solo puede suponer el comportamiento descripto.
- Se le dice **Especidicaicon** a la abstraccion.
Ejemplo de TAD:
```haskell
tad Cola (A: Set) where
	import Bool
	vacia : Cola A
	poner : A -> Cola A -> Cola A
	primero : Cola A -> A
	sacar : Cola A -> Cola A
	esVacia : Cola A -> Bool
```
Las especificaciones de comportamiento también se puede dar tambien algebraicamente para ser mas precisos.
Tambien se pueden describir implementaciones de modelos externos 
(teoria de conjuntos por ejemplo).

## Especificacion Algebraica:
```
esVacia vacia = True
esVacia (poner x q) = false
primero (poner x vacia) = x
primero (poner x (poner y q)) = primero (poner y q)
sacar (poner x vacia) = vacia
sacar (poner x (poner y vacia)) = poner y vacia
```
> NO CONFUNDIR ESPECIFICACION CON CODIGO, NO SE ESTAN USANDO CONSTRUCTORES, SON **FUNCIONES**.

Los tads se generan con operaciones de tads (if then else funciones) y variables libres y (to-do).

Los tads permiten que los detalles de implementacion esten ocultos, el beneficio que trae es que se pueden realizar modificaciones a las implementaciones sin que los programas que utilizen el modelo de los tads se vean afectados
# Modelos


  

