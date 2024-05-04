---
excalidraw-plugin: 
cssclasses: []
---
Las contraseñas por lo general se guardan hasheadas, en los SO por lo general guardadas en los siguientes archivos.


**Windows**:
- unattend.xml
- sysprep.inf
- SAM
**Linux**:
- shadow
- shadow.bak
- password
## Cracking
Como no se puede revertir el hash de una contraseña lo que se hace es hashear palabras aleatorias hasta que los hashes coinciden.

### Tipos de Ataques
Como de [[Dictionary Attacks]], [[Brute Forcing]], Intercepcion de Trafico, Man in the Middle, Key Logging, Social Engieneering.
### Login Brute Forcing
A veces si no se tiene acceso al hash es mas facil hacer bruteforce en el formulario del login, se pueden usar herramientas como `Ncrack`, `wfuzz`, `medusa`, `patator`, [[Hydra]], etc.



