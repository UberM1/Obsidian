# Http
## Basic Auth

> The HTTP specification provides two parallel authentication mechanisms:
> 1. `Basic HTTP AUTH` is used to authenticate the user to the HTTP server.
> 2. `Proxy Server Authentication` is used to authenticate the user to an intermediate proxy server.

Son tipos de autenticaciones muy similares, se basan en request, status codes de respuesta y headers. La diferencia principal entre uno y el otro es como se componen los headers. 

### Basic HTTP
La autenticación basica de `HTTP` se lleva a cabo con la siguiente metodologia:
- El cliente envia una request sin autenticar.
- El servidor responde con un header de `WWW-Authenticate`[^1] que indica la peticion de credenciales y se le pide al cliente que suba los datos necesarios para la autenticación.
- El servidor tambien provee al cliente un string llamado *realm* que le indica quien es el que pide estos datos.
- El cliente usa `Base64` para codificar el Id y la password y se transmite al servidor en el header de `Autorization`.

[^1]: Este header ademas de solicitar la autenticacion es como que tiene las pautas de como se va a llevar a cabo dicha autenticación

# HTTPS
Cuando alguien se conecta ocurre un intercambio de claves, pública y privada para que estos puedan tener un canal de comunicación cifrado.
