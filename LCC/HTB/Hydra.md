hydra se usa principalmente para Login Brute Forcing, Se encarga de realizar las consultas necesarias usando listas de credenciales filtrando los resultados exitosos.

# Sintaxis
```bash
hydra -<option> <path/to/dict> <target-ip> -s <port> <method> /
```

a comun usage can be:
```shell
hydra -C /opt/useful/SecLists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt 178.211.23.155 -s 31099 http-get /
```

`-C` indica el uso de listas de credenciales de tipo usuario:password
`-L` indica uso de listas de usuarios, `-l <user>` indica uno en especifico
`-P` indica uso de listas de contraseñas, `-p <password>` indica una contraseña en especifico.
`-f` corta la ejecucion en el primer match
`-u` prueba todos los users por cada password, por defecto es al revez.
`-h` Muestra el help
`<module_name> -U` nos provee info de como se utiliza cada modulo.

con el siguiente comando podemos ver los servicios sobre los cuales hydra puede configurarse para hacer brute forcinig:
```shell
hydra -h | grep "Supported services" | tr ":" "\n" | tr " " "\n" | column -e
```

los mas importantes son:
1. `http[s]-{head|get|post}`: para HTTP basic
2. `http[s]-post-form`: para forms `.php` o `.aspx`

> Por lo general nos podemos dar cuenta si es un loguin de post o de get mirando si los parametros se pasan por la url.

## fail/success
>To make it possible for `hydra` to distinguish between successfully submitted credentials and failed attempts, we have to specify a unique string from the source code of the page we're using to log in. `Hydra` will examine the HTML code of the response page it gets after each attempt, looking for the string we provided.

A veces se puede usar el codigo del formulario porque lo mas probable es que no este si el intento es exitoso

ejemplo: 

```bash
/login.php:[user parameter]=^USER^&[password parameter]=^PASS^:F=<form name='login'
```

