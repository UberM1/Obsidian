Stands for `Domain Name System`, es el encargado de transformar dominios en ips públicas. 

Es consultado cuando no se encuentra resolución para un dominio en el archivo `/etc/hosts`.


# Dominio
Se puede agregar la resolucion de un dominio por ejemplo mediante el siguiente comando:

```shell
sudo sh -c 'echo "SERVER_IP  SERVER_DOMAIN" >> /etc/hosts'
```

Esto puede ser util para hacer [[Fuzzing#Subdomain|Sub domain fuzzing]]
## Sub Dominio

### Vhosts
Es un `sub-dominio` que puede tener o no resoluciones en `DNS` públicos, tienen la particularidad de que son hosteados en el mismo servidor e IP, es decir esta ip hostearía mas de una web.

Solo podemos identificar los subdominios publicos de este tipo de hosting, pues de otro modo no sabremos como resolver a esos dominios.

Se alterna entre vhosts usando una cabecera, por ejemplo, www.google.com con la cabecera `'Host: asd.www.google.com'`

