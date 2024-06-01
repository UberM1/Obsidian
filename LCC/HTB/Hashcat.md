The folder contains 64-bit binaries for both Windows and Linux. The `-a` and `-m` arguments are used to specify the type of attack mode and hash type. `Hashcat` supports the following attack modes:

| **#** | **Mode**               |
| ----- | ---------------------- |
| 0     | Straight               |
| 1     | Combination            |
| 3     | Brute-force            |
| 6     | Hybrid Wordlist + Mask |
| 7     | Hybrid Mask + Wordlist |
Con el comando 
```bash
hashcat --example-hashes | less
```
podemos ver ejemplos de los distintos hashes y el modo que hay que utilizar en cada uno.

con la flag `-b` se activa un modo benchmark.
## Hashcat optimizations
| Option            | Description                                                                                                                                                                                                                                                                                                                                                                                    |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Optimized Kernels | This is the `-O` flag, which according to the documentation, means `Enable optimized kernels (limits password length)`. The magical password length number is generally 32, with most wordlists won't even hit that number. This can take the estimated time from days to hours, so it is always recommended to run with `-O` first and then rerun after without the `-O` if your GPU is idle. |
| Workload          | This is the `-w` flag, which, according to the documentation, means `Enable a specific workload profile`. The default number is `2`, but if you want to use your computer while Hashcat is running, set this to `1`. If you plan on the computer only running Hashcat, this can be set to `3`.                                                                                                 |
> **BAJO NINGUNA CIRCUNSTANCIA USAR `--force`**

# Hashid
El comando `hashid '<hash>'` devuelve el tipo de hash, si es que puede ser identificado, con -m tambien nos provee el modo de hashcat con la flag   `-m`.

Este programa esta escrito en python y se instala con [[Pip|pip]]

`hashid` funciona con [[Rejex|rejex]], para intentar determinar el hash provisto, ocacionalmente las respuestas pueden no ser unicas, sin embargo el lugar de donde extraemos el hash nos puede ayudar a achicar este scope, si salio de un windos o sql etc. Adicionalmente, `hashcat` provee una [tabla de ejemplos](https://hashcat.net/wiki/doku.php?id=example_hashes) que puede ser útil.

# Ejemplos de uso

```shell
hashcat -a 0 -m <hash_id> <hash/file> <wordlist>
hashcat -a 1 --stdout <file1> <file2> # Printea el resultado de la lista de ataque combinado
hashcat -a 1 -m <hash_id> <hash/file> <wordlist1> <wordlist2> # crack combinado
hashcat -a 3 -m 0 md5_mask_example_hash -1 01 'ILFREIGHT?l?l?l?l?l20?1?d' # crack con mask
hashcat -a 6 -m 0 hybrid_hash /opt/useful/SecLists/Passwords/Leaked-Databases/rockyou.txt '?d?s' # hybrid wordlist + mask
hashcat -a 7 -m 0 hybrid_hash_prefix -1 01 '20?1?d' /opt/useful/SecLists/Passwords/Leaked-Databases/rockyou.txt # hybrid mask + wordlist.

```

# [Mask Attacks](https://hashcat.net/wiki/doku.php?id=mask_attack)
Se usan cuando se sabe que la contraseña cumple con ciertas condiciones, tiene un largo determinado, hay cierta cantidad minima de caracretes especiales etc.

| **Placeholder** | **Meaning**                                             |
| --------------- | ------------------------------------------------------- |
| ?l              | lower-case ASCII letters (a-z)                          |
| ?u              | upper-case ASCII letters (A-Z)                          |
| ?d              | digits (0-9)                                            |
| ?h              | 0123456789abcdef                                        |
| ?H              | 0123456789ABCDEF                                        |
| ?s              | special characters («space»!"#$%&'()*+,-./:;<=>?@[]^_`{ |
| ?a              | ?l?u?d?s                                                |
| ?b              | 0x00 - 0xff                                             |
Los placeholders pueden ser combinados en placeholders custom con las opcines de -1 a -4, ver doc para mas info.
Con `--increment` se activa para que la mascara seteada se incremente automaticamente y con `--increment-max` se setearia el maximo.


**`-1`**: La opción `-1` sirve para reemplazar los placeholders con 1 o 0 caracteres del tipo indicados.

# Modulos adicionales
- [maskprocessor](https://github.com/hashcat/maskprocessor)


