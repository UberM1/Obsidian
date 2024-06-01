El proceso de convertir datos de modo que el contenido original no sea accesible. A diferencia del [[Hashing|hashing]], los algoritmos se desarrollan con la finalidad de que esta ofuscación se pueda revertir.

Hay dos tipos de algoritmos de cifrado o encriptado, el simétrico, y el asimétrico.

> Para cifrar facilmente algo en la consola se puede usar: 
> ```shell
echo -n 'secretpassword' | md5sum | cut -f1 -d' '  > combination_md5 
 

# Cifrado Simétrico
Se usa una key para encriptar los datos, y esa misma key es la que sirve para desencriptarlos. 
Algunos ejemplos son [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard), [DES](https://en.wikipedia.org/wiki/Data_Encryption_Standard), [3DES](https://en.wikipedia.org/wiki/Triple_DES) and [Blowfish](https://en.wikipedia.org/wiki/Blowfish_(cipher)#The_algorithm). Estos algoritmos son suceptibles a [analisis de frecuencias](https://en.wikipedia.org/wiki/Frequency_analysis),[ataques de padding oracle](https://en.wikipedia.org/wiki/Padding_oracle_attack) y [[Brute Forcing|fuerza bruta]].

# Cifrado Asimétrico
Se divide la clave en dos partes, una pública y una privada, la publica es otorgada a cualquiera que quiera realizar un cifrado antes de enviar información al destinatario, el destinatario luego utiliza la clave privada, que solo esta a su disposición para des-cifrar este mensaje.
Algunos ejemplos son: [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)), [ECDSA](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm) y [Diffie-Hellman](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange).

Se utilican en protocolos como [[Http, Https|HTTPS]], siempre que implementen [[SSL]]