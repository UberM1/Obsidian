# [Wfuzz](https://wfuzz.readthedocs.io/en/latest/index.html)
 Tiene varias funcionalidades de Fuzzing, el Fuzzing es una forma de "spamear" requests a direcciones y Wfuzz se encarga de filtrar todas las requests hechas y devolvernos las exitosas.

Un caso de uso comun es para realizar [[Enumeracion]] de paths dentro de una URL, por ejemplo: 

```bash
wfuzz -w wordlist/general/common.txt http://testphp.vulnweb.com/FUZZ
```

Donde `wordlist/general/common.txt` indica la dirección a un diccionario, y por cada palabra en el se hara una request a la direccion indicada reemplazando el campo ocupado por FUZZ. Esta funcionalidad se puede extender poe ejemplo para buscar imagenes o algun tipo especifico de archivo.

# Ffuf
`-ic` Para eliminar comentarios.
`-t <number>` marca la cantidad de intentos.
`-recursion` para habilitar recursion cuando se encuentra un directorio.
	`-recursion-depth <number>` para tener un limite en la recursion.
	`-e` para indicar tipo de extension y que se haga fuzzing sobre archivos en la recursion.
	`-v` Para que durante la recursion se haga output de las url completas.
`-H` para hacer fuzz sobre [[DNS#Vhosts|Vhosts]]
`-fs <number>` para filtrar responses de largo `<number>`

## Ejemplos de uso:
### Basic
```shell
ffuf -w <wordlist.txt> -u http://SERVER_IP:PORT/FUZZ
```
### Recursive
```shell
ffuf -w <wordlist>:FUZZ -recursion -u http://<SERVER_IP>/FUZZ -e .php -v
```
### Subdomain
```shell
ffuf -w /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt:FUZZ -u http://FUZZ.academy.htb/
```
### Vhosts
```shell
ffuf -w /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt:FUZZ -u http://academy.htb:PORT/ -H 'Host: FUZZ.academy.htb'
```
### GET - Parameter Fuzzing
```bash
ffuf -w /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt:FUZZ -u "http://admin.academy.htb:57040/admin/admin.php?FUZZ=key" -fs 798
```
### POST - Parameter Fuzzing
```shell
curl http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=key' -H 'Content-Type: application/x-www-form-urlencoded'
```
`-X` para indicar el tipo de request
```BASH
ffuf -w wordlist.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'FUZZ=key' -H 'Content-Type: application/x-www-form-urlencoded' -fs xxx
```

---
|**List**|**4what**|
|---|---|
|`/usr/share/secLists/Discovery/Web-Content/directory-list-2.3-small.txt`|Directory/Page Wordlist|
|`/usr/share/secLists/Discovery/Web-Content/web-extensions.txt`|Extensions Wordlist|
|`/usr/share/secLists/Discovery/DNS/subdomains-top1million-5000.txt`|Domain Wordlist|
|`/usr/share/secLists/Discovery/Web-Content/burp-parameter-names.txt`|Parameters Wordlist|