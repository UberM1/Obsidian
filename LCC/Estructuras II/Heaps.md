Son un tipo de [[Arboles]], definido en haskell como: 

```haskell
type Rank = Int
data Heap a = E | N Rank a (Heap a) (Heap a)
```

## Rango
El rango de un heap es la longitud de la *espina derecha*(el camino hacia la derecha hasta un nodo vacio)
## leftist Heap
Es un Heap que cumple con la invariante que el rango de cualquier hijo izquierdo es mayor o igual que el de su hermano de la derecha.

### Propiedades
- la espina derecha es el camino mas corto a un nodo vacio.
- rellenar
### Operaciones 

#### Merge
#### MakeH
#### Rank

#EstructurasII 


