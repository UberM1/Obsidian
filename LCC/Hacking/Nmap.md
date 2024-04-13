[Nmap](https://nmap.org/) es una herramienta de mapeo de redes.

Nmap te utiliza principalmente para hacer [[Enumeracion]]

>Network Mapper (`Nmap`) is an open-source network analysis and security auditing tool written in [[C]], [[C++]], [[Python]], and [[Lua]]. It is designed to scan networks and identify which hosts are available on the network using raw packets, and services and applications, including the name and version, where possible. It can also identify the operating systems and versions of these hosts. Besides other features, Nmap also offers scanning capabilities that can determine if packet filters, [[firewall]]s, or intrusion detection systems ([[IDS]]) are configured as needed.

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
- `-sV` procesa la infoo de los paquetes escaneados para poder identificar servicios o el sistema operativo corriendo en el target.
---
#### Options:
##### Puertos:
- `-p` esta bandera permite ecanear puertos especificos, por defecto se escanean los primeros 1000 pero tambien podemos hacer busquedas mas especificas:
	- `-p 22,25,139` lista
	- `-p 22-445` rango
	- `--top-ports=10` grupo de frecuencia
	- `-p-` todos los puertos
	- `-p -F` (no estoy seguro si el `-p va`) escanea los primeros 100
##### Escaneo:
- `-Pn` desactiva las `ICMP echo requests`.
- `-n` desactiva la resolucion `DNS`.
- `-sn` desactiva el escaneo de puertos.
- `--disable-arp-ping` desactiva el escaneo con pings arp.
- `--packet-trace` muestra todos los paquetes enviados y recibidos.

##### Output:
- `-oA tnet` Output en todos los formatos.
- `-oN <path/filename>` Output default, .nmap extension.
- `-oG <path/filename>` Output grepeable, .gnmap extension.
- `-oX <path/filename>` Output XML, .xml extension.
- `-v`/`-vv` El output se muestra a medida que va siendo escanesdo.
- `--stats-every=Xs` muestra el resultado del escaneo cada X segundos.
Se puede pasar de xml a html usando `xslproc file.xml -o file.html`

---
#### Target
- `IP` 192.168.0.4.
- `Mask` 192.168.0.0/24.
- `Range` 192.168.0.4-25.
- `list` 192.168.0.4,192.168.0.5,192.168.0.7.
- `-iL <file>` permite hacer escaneos a partir de listas.

# Host Enumeration
## Tecnicas de Scan
```shell
-sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans
  -sU: UDP Scan
  -sN/sF/sX: TCP Null, FIN, and Xmas scans
  --scanflags <flags>: Customize TCP scan flags
  -sI <zombie host[:probeport]>: Idle scan
  -sY/sZ: SCTP INIT/COOKIE-ECHO scans
  -sO: IP protocol scan
  -b <FTP relay host>: FTP bounce scan
``` 

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

el comando `-sV` saca informacion a partir de realizar conecciones TCP con three way handshake, a veces cuando ocurre esto, el host manda un bannner con información adicional, esta informacion adicional, puede o no ser parseada con `Nmap`, por lo que si se nos da una situacion del estilo, siempre conviene hacer una escucha con [[tcpdump]] y realizar la coneccion a mano con [[nc]]


