[Nmap](https://nmap.org/) es una herramienta de mapeo de redes.

Nmap te utiliza principalmente para hacer [[Enumeracion]]

>Network Mapper (`Nmap`) is an open-source network analysis and security auditing tool written in [[C]], [[C++]], [[Python]], and [[Lua]]. It is designed to scan networks and identify which hosts are available on the network using raw packets, and services and applications, including the name and version, where possible. It can also identify the operating systems and versions of these hosts. Besides other features, Nmap also offers scanning capabilities that can determine if packet filters, [[firewall]]s, or intrusion detection systems ([[IDS-IPS]]) are configured as needed.

# Casos de uso:
Es muy usada por sysadmins & IT security specialiists, sirve para: 
- Auditar los aspectos de seguridad en una red.
- Simular [[pentests]].
- Chequear conficuraciones de firewalls e IDS.
- Chequea distontos posibles tipos de coneccion.
- Network mapping(mapa de la red).
- Analiza respuestas de los hosts en la red.
- Identifica [[puerto]]s abiertos.
- Evalúa vulnerabilidades.
# Arquitectura de Nmap
Nmap tiene distintos tipos de escaneos que se pueden hacer sobre una red:
- Descubrimiento de Hosts.
- Escaneo de puertos.
- Servicios de enumeracion y detección
- Deteccion de OS 
- Interaccion automatizada con scripts con los target.

# Sintaxis

```Bash
Ubr@htb[/htb]$ nmap <scan types> <options> <target>
```
#### Scan types:
- `-sS` es una configuracion por defecto, es la configuracion que hace posible que el escaneo de puertos sea rapido, lo que hace es un escaneo TCP, con [[paquete]]s que llevan la `SYN` flag, y que por lo tanto, hace que no se complete la coneccion con el puerto, pues nunca completa el three-way handshake.
	- Si nmap luego de la consulta a dicho puerto recive un paquete de `SYN-ACK` entonces considera a dicho puerto abierto.
	- si recibe un paquete de `RTS`, es un indicador de que el puerto esta cerrado.
	- si no recibe ningun tipo de confirmacion se considera al puerto filtrado, dependiendo de la configuracion del firewall, algunos paquetes pueden ser descartados o ignorados.
	- Esta bandera necesita permisos de root pues necesita acceso a crear paquetes TCP de 0 utilizando el socket.
- `-sT` Realiza un escaneo TCP completando el three-way handshake. El escaneo primero envia un paquete `SYN`, luego recuve un `SYN-ACK` en caso de que el puerto este abierto, y por ultimo, cierra la coneccion enviando un paquete `RTS`. Al completar una coneccion este escaneo es un poco mas lento pero a su vez es el que menos ruido genera en la red, pues por no dejar conecciones abiertas es menos probable que sea detectado por un posible `IDS` o `IPS`. En caso de que el ==firewall== del host dropee paquetes entrantes pero permita los salientes, este metodo permite determinar de mejor forma el estado de un puerto que el de escaneo `SYN`.
- `-sU` Realiza un escaneo `UDP`, debido a que este es un protocolo `stateless` los tiempos de timeout son mucho mas lentos, en caso de que un puerto este abierto conseguiremos respuesta solo si la aplicación  alli hosteada esta configurada para que se comporte asi, pues en caso contrario `UDP` no tiene `ACKs`.
- `-sV` procesa la info de los paquetes escaneados para poder identificar servicios o el sistema operativo corriendo en el target.
- `-O` Similar al `-sV` pero con la finalidad de conseguir informacion acerca del SO.
- `-sC` Scaneo con grupo de scripts por defecto.
- `-sA` ARP scan
---
#### Options:
##### Puertos:
- `-p` esta bandera permite ecanear puertos especificos, por defecto se escanean los primeros 1000 pero tambien podemos hacer busquedas mas especificas:
	- `-p 22,25,139` lista
	- `-p 22-445` rango
	- `--top-ports=10` grupo de frecuencia
	- `-p-` todos los puertos
	- `-F` escanea los primeros 100
##### Escaneo:
- `-Pn` desactiva las `ICMP echo requests`.
- `-n` desactiva la resolucion `DNS`.
- `-sn` desactiva el escaneo de puertos.
- `--disable-arp-ping` desactiva el escaneo con pings arp.
- `--packet-trace` muestra todos los paquetes enviados y recibidos.
- `-A` hace un scan agresivo, se saca toda la data posible, setea las flags `-sV` `-O` `--traceroute` y `-sC`
- `-T <0-5>` velocidad de escaneo 
- `--min-parallelism <number>
- `--initial-rtt-timeout <time>` tiempo maximo de respuesta antes de un retry
- `--max-rtt-timeout <time>` 
- `--min-rate <number>` minimo de paquetes simultaneos.
- `--max-retries <number>`
- `-D RND:<number>` Envia los paquetes de una lista de ips aleatorias, es importante que las ips existan sino el target no va a poder resolver a la ip host que estamos usando para firmar las cabeceras de los paquetes 
- `-S` Sirve para especificar directamente una ip con la que firmar los paquetes, sirve para bypassear reglas de firewall.
- `--dns-server <ns>,<ns>` sirve para especificar el servidor dns
- `--source-port` podemos especificar de que puerto queremos que se hagan las requests, a veces sirve usar el puerto 53 de source que es el de resoluciones de dominio[^1].


[^1]:  `ncat -nv --source-port 53 10.129.2.28 <puerto>` lo podemos usar para probar la coneccion al puerto. revisar porque no anda el nc desde el puerto 53 en la pc local.


### Scan Network Range:
```bash
 sudo nmap 10.129.2.0/24 -sn -oA tnet | grep for | cut -d" " -f5
```
 
Con el /24 inficamos que queremos todos los host que tengan esa mascara de red.

Este tipo de escaneo funciona solamente si el firewall del host lo permite.

Nmap  usando la bandera , tambien se puede hacer separando los hosts a escanear con un espacio o proviendo un rango.

En caso que deshabilitemos el escaneo de puertos con `-sn` nmap sabrá si un host esta activo mediante paquetes de `ping ARP`, se le puede especificar que utilice requests de `Echo ICMP` si le pasamos la bandera `-PE`, se pueden desactivar todos los mensajes `ARP` con la bandera `--disable-arp-ping`.

Para mas operaciones de descubrimiento de host ver [documentacion de NMAP](https://nmap.org/book/host-discovery-strategies.html](https://nmap.org/book/host-discovery-strategies.html).

# Host And Port Scanning

Al momento de hacer un scan de puertos, nmap los clasifica segun las respuestas que obtenga, puede tener los siguientes casos

| **Estado**         | Descripcion                                                                                                                                                             |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `closed`           | Nmap marca un puerto como cerrado cuando recibe como respuesta un paquete que contiene la flag `RTS`.                                                                   |
| `filtered`         | Este estado se asigna cuando no hay respuesta o no se puede obtener un codigo de error.                                                                                 |
| `unfiltered`       | Este estado se asigna unicamente en un escaneo de tipo `TCP-ACK`, este estado implica que el puerto es accesible pero no se puede determinar si esta abierto o cerrado. |
| `open\|filtered`   | Si no se obtiene respuesta especifica de ese puerto, es decir puede que responda el host desde otro, se marca como abierto o filtrado                                   |
| `closed\|filtered` | Este estado se asigna unicamente en los escaneos **IP ID idle**, indica que no se pudo determinar si el puerto esta filtrado o cerrado.                                 |

Para bypasear firewalls usar arp scans:
```shell
sudo nmap 10.129.2.28 -p 21,22,25 -sA -Pn -n --disable-arp-ping
```

el comando `-sV` saca informacion a partir de realizar conecciones TCP con three way handshake, a veces cuando ocurre esto, el host manda un bannner con información adicional, esta informacion adicional, puede o no ser parseada con `Nmap`, por lo que si se nos da una situacion del estilo, siempre conviene hacer una escucha con [[tcpdump]] y realizar la coneccion a mano con [[nc]]
# Scripting Engine
Admite la creacion de scripts en [[lua]] para manejar la interaccion con algunos dispositivos. Hay 14 categorias de estos scripts:

| Category    | Description                                                                                                                             |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `auth`      | Determination of authentication credentials.                                                                                            |
| `broadcast` | Scripts, which are used for host discovery by broadcasting and the discovered hosts, can be automatically added to the remaining scans. |
| `brute`     | Executes scripts that try to log in to the respective service by brute-forcing with credentials.                                        |
| `default`   | Default scripts executed by using the `-sC` option.                                                                                     |
| `discovery` | Evaluation of accessible services.                                                                                                      |
| `dos`       | These scripts are used to check services for denial of service vulnerabilities and are used less as it harms the services.              |
| `exploit`   | This category of scripts tries to exploit known vulnerabilities for the scanned port.                                                   |
| `external`  | Scripts that use external services for further processing.                                                                              |
| `fuzzer`    | This uses scripts to identify vulnerabilities and unexpected packet handling by sending different fields, which can take much time.     |
| `intrusive` | Intrusive scripts that could negatively affect the target system.                                                                       |
| `malware`   | Checks if some malware infects the target system.                                                                                       |
| `safe`      | Defensive scripts that do not perform intrusive and destructive access.                                                                 |
| `version`   | Extension for service detection.                                                                                                        |
| `vuln`      | Identification of specific vulnerabilities.                                                                                             |
## Sintaxis
Scripts default:
```bash
sudo nmap <target> -sC
```
De una categoría especifica:
```shell
sudo nmap <target> --script <category>
```
Scripts especificos:
`--script http-enum` puede servir para descubrir algunos archivos por defecto(esta en discover).
```shell
sudo nmap <target> --script <script-name>,<script-name>,...
```


