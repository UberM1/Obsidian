El proceso de mapear un input en un output, la idea de los `algoritmos de hashing` es que por lo general siempre se retornan strings del mismo largo, es un proceso unidireccional y con perdida, es decir, que no se pueden recuperar los datos una vez son hasheados.[^1]

La unica forma de adivinar cual es la palabra detrás de un hash, es utilizando posibles entradas, y comparando con el mismo.

Hay distintos tiops de algirirmos y con distintos tipos de aplicación, por ejemplo `SHA-512`, `Blowfish`, `BCript` y `Argon2` son algorimpos que se usan para proteger contraseñas en los sistemas basados en Unix, BSD y Solaris.

`SHA-512` convierte un string largo en una cadena hash, pero es suceptible ataques donde el atacante usa una tabla de hashes pre-hechos para reconstruir la password origninal.

`Blowfish` un algoritmo de `cifrado simetrico` para encriptar las [[passwords]] con una key, es mucho mas seguro que `SHA-512` pero a su vez es mas lento.

`Bcript` Es lento pero es poco suceptible a rainbow table attaks.

`Argon2` Es el mas moderno de los mencionados, que se diseño especificamente para hashear contraseñas. Usa multiples etapas de funciones de hash, y mucha memoria, para que sea mas dificil de adivinar las contraseñas. Es considerado uno de los algoritmos mas seguros, por el tiempo y la cantidad de recursos requeridos.

## Identificadores
```shell
$1$  : MD5
$2a$ : Blowfish
$2y$ : Blowfish, with correct handling of 8 bit characters
$5$  : SHA256
$6$  : SHA512
```

## Salting

El proceso de agregar a la contraseña a hashear un string adicional para prevenir fuerza bruta, sin embargo sigue sin impedirlo.

> Sometimes, hashes are stored in certain formats. For example, `hash:salt` or `$id$salt$hash`.

# Recovering 
No siempre es posible lograr un recovery ni identificar el tipo de hash con [[Hashcat#Hashid|hashid]], pues puede haber pasado por varias instancias de cifrado con distintos salts. 

[^1]: > Some hash functions such as MD5 have also been vulnerable to collisions, where two sets of plaintext can produce the same hash.