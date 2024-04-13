


Se definen recusrivamente en haskell como: 
```haskell
data Tree a = Hoja | Nodo (Tree a) a (Tree a)
```
Donde los datos se pueden guardar en las hojas en los nodos o en ambos, en este caso vamos a tener en cuenta la definicion provista.

## Subarboles
A partir de la definicion de arbol, un subarbol es el arbol definido por algun nodo hijo del nodo actual donde nos encontramos.


### Complejidad en la Busqueda
En caso de que hablemos de arboles *ordenados* la complejidad la busqueda de un elemento en el mismo es de la **altura del arbol**, si *no esta ordenado* hay que chequear todos los nodos y en ese caso tiene **orden lineal**

### Complejidad en la Insercion
 Se recorre el arbol hasta encontrar una hoja y alli se inserta el nodo.
 La complegidad sera siempre la altura maxima del arbol independientemente del metodo que se quiera utilizar.

### Complejidad en la eliminación
Se recorre el arbol hasta encontrar el nodo a borrar, la complejidad de esto es h, la altura del arbol, al momento de eliminarlo, es decir cuando encontramos el nodo es mas complejo pues hay que analizarlo por partes:
- si no tiene hijos se borra directamente el nodo y se le asigna en la recursion una hoja al nodo anterior.
- en caso que tenga un unico subarbol con datos  seleccionamos a la raiz del arbol como nuevo nodo derecho o izquierdo de el nodo actual y listo.
- en caso de que tengamos dos hijos vamos a tener que reemplazar el nodo actual con el minimo del subarbol derecho, en caso que los elementos menores o iguales esten en el subarbol izquierdo. Se puede buscar sino el maximo elemento del subarbol derecho.

Las operaciones de busqueda, inserción y borrado son del **orden** de la *altura del arbol*, es decir $O(log(n))$, para esto nos alcanza con que el arbol este ordenado, por ej.: Abl, Red-Black Trees.

## Red-Black Trees
Es un arbol binario de busqueda pero con nodos *coloreados*, propiedades:
- rellenar



#EstructurasII