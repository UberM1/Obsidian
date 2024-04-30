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