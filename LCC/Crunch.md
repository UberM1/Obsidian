Herramienta utilizada para crear listas([[Passwords]][[Dictionary Attacks]]) de diccionarios con parametros especificos. 

\> Usage
```shell
 crunch <minimum length> <maximum length> <charset> -t <pattern> -o <output file>
```

***PARAMETROS:***
- `-t` provee un patron para las contraseñas.
	- `@` representa caracteres *lower case*.
	- `,` representa caracteres *upper case*.
	- `%` sera reemplazado con numeros.
	- `^` sera reemplazado con simbolos.
- `-o` define archivo de salida.
- `-d` cantidad de iteraciones sobre la salida ?
- 