Estos intentan adivinar con la ayuda de una lista de palabras, este metodo sirve solo cuando se usa una combinacion razonable de palabras, porque en caso contrario se complica porque no vas a tener un fwbtgayhbavjukjkullsy en el diccionario champ. 

La ventaja es que los diccionarios se construyen a partir de contraseñas comunes en los leaks y contraseñas por defecto.[^1]

[^1]: Un repo util con un montooon de diccioarios https://github.com/danielmiessler/SecLists, en HTB estan guardados en `/otp/useful/SecLists/`

**Clasificación de ataques segun HTB:**

| **Attack**                 | **Description**                                                                                                             |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Online Brute Force Attack  | Attacking a live application over the network, like HTTP, HTTPs, SSH, FTP, and others                                       |
| Offline Brute Force Attack | Also known as Offline Password Cracking, where you attempt to crack a hash of an encrypted password.                        |
| Reverse Brute Force Attack | Also known as username brute-forcing, where you try a single common password with a list of usernames on a certain service. |
| Hybrid Brute Force Attack  | Attacking a user by creating a customized password wordlist, built using known intelligence about the user or the service.  |
# Login Brute Forcing
La idea en la gran parte de los ataques de diccionario es intentar saber un user que exista e iterar passwords desde ahi, sino se van a tener que iterar sobre todas las combinaciones y esto es muy costoso.
Usar passwords default implica probar sobre pares de usuario y contraseña que comúnmente van de la mano, por lo general en ataques de este tipo conviene comenzar con estos. Una herramienta comun para esto es [[Hydra]].

# Personalized Wordlists
Se utiliza información del usuario que es el target para crear listas de palabras específicas que usar en ataques de fuerza bruta. Una herramienta común para esto es [[Cupp]], [[rsmangler]] o [[The Mentalist]].

En específico para usuarios podemos utilizar herramientas como [[username-anarchy]]. 

Hay que tener en cuenta que algunos servicios piden requisitos minimos para las contraseñas, y como no queremos perder tiempo en contraseñas que no van a tener efecto entonces podemos usar algunos scripts de [[Bash]] para poder filtrar estas contraseñas de nuestra wordlist.