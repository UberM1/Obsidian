La idea es definir si la implementacion de un [[Tipos Abstractos de Datos|TAD]] es correcta.

Si es implementado en haskell los tipos estan automaticamente chequeados pero la verificacion final del comportamiento la debe hacer el programador.

**patrones disjuntos**: hay casos en los que conviene cambiar la implementacion para que se posibilite utilizar los casos de haskell como ecuaciones. evitar otherwises.

**extensionalidad**: se tiene la concepcion de que dos funciones son iguales solo si todos sus resultados son iguales, sin embargo pensar solo una funcion como una caja negra, no es lo mismo que dos funciones hagan lo mismo pero una tarde un orden mas.

**analisis por casos**: se prueba la validez de una implementacion por extensionalidad.

> sobre programas recursivos se utiliza [[Inducción]].