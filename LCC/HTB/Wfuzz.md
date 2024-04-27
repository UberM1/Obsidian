[Wfuzz](https://wfuzz.readthedocs.io/en/latest/index.html) tiene varias funcionalidades de Fuzzing, el Fuzzing es una forma de "spamear" requests a direcciones y Wfuzz se encarga de filtrar todas las requests hechas y devolvernos las exitosas.

Un caso de uso comun es para realizar [[Enumeracion]] de paths dentro de una URL, por ejemplo: 

```bash
wfuzz -w wordlist/general/common.txt http://testphp.vulnweb.com/FUZZ
```

Donde `wordlist/general/common.txt` indica la dirección a un diccionario, y por cada palabra en el se hara una request a la direccion indicada reemplazando el campo ocupado por FUZZ. Esta funcionalidad se puede extender poe ejemplo para buscar imagenes o algun tipo especifico de archivo.



![[wfuzz.svg]]
