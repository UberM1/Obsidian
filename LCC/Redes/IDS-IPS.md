Siglas de **I**ntrusion **D**etection/**P**revention **S**ystem

Ambos son, como el [[firewall]] componentes de software.

# IDS
Escucha activamente el flujo en la red para detectar ataques potenciales, los analiza y reporta los ataques detectados al administrador. Es un sistema pasivo, es decir solo escucha.
>`IDS systems` alone are usually there to help administrators detect potential attacks on their network. They can then decide how to handle such connections. We can trigger certain security measures from an administrator, for example, by aggressively scanning a single port and its service. Based on whether specific security measures are taken, we can detect if the network has some monitoring applications or not.

# IPS
Este en base a un sistema de reglas configuradas por el administrador toma medidas especificas si un ataque es detectado.
>One method to determine whether such `IPS system` is present in the target network is to scan from a single host (`VPS`). If at any time this host is blocked and has no access to the target network, we know that the administrator has taken some security measures. Accordingly, we can continue our penetration test with another `VPS`.