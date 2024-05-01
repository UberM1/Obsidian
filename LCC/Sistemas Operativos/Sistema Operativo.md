---
tags:
  - SOIIEX1
---

# Definición:
==Es un programa== que se ejecuta en toda computadora de uso general, no poseen una definición fuerte pues se los puede encontrar en lógica y tamaños muy variados. 
> Se estudian para evitar errores comunes de programación que resulten en perdida de información o de rendimiento. Esto ayuda a ajustar a nuestros programas al SO, para que al momento de ejecutarse puedan tener un mejor rendimiento.

## Funciones y Objetivos
1. **Abstracción**: Se encarga de proporcionar abstracciones para que los programadores puedan enfocarse en resolver las necesidades particulares de sus usuarios.
2. **Administración de recursos**: Al tener el control total sobre el hardware(recursos) debe gestionar e implementar políticas para asignarlos de forma efectiva y acorde a las necesidades establecidas para dicho sistema.
3. **Aislamiento**: Idealmente debe brindar la experiencia, a cada usuario y proceso, de que el sistema esta exclusivamente dedicado a ellos. Para brindar esta protección se necesita hardware especializado. 

# Historia 

## Batch processing:

*Allá por los años 50...* aparecieron los dispositivos perforadores/lectores de tarjetas de papel, se programaba y se le entregaba a los operadores baches de tarjetas perforadas que cargaban en estos dispositivos.
estos dispositivos no tenían mucho de SO, tenian un ***sistema monitor***, que en un inicio era una forma de asistir al operador en la carga del programa. Luego se implementaron protecciones para evitar que un trabajo corrompa a otros, establecieron timers que interrumpian la ejecucion de los procesos si duraba mas de lo estipulado(se necesitaron mejoras de hardware).

> En estos sistemas la mayor parte del tiempo se perdia en la carga de los programas, debido a la necesidad de cargar manualmente las tarjetas.

### Carga spool
Implementa una mejora con respecto a los sitemas Batch, es un sistema de entrada salida que permite que mientras se leen las targetas se graban cintas magnéticas mientras otros programas estan en ejecucuion y despues son cargados via cinta magnética a la computadora.

## Sistema multiprogramados
Un programa normalmente a lo largo de su ejecucion para por dos etapas donde se encuentra limitado:
- Limitado por CPU, que mucho no se le puede hacer.
- Limitado por I/O, *long story short, se empezaron a correr varios programas a la vez para no perder tiempo de computo.*
> Esto forzo la solucion a problemas de concurrencia, se precisaba ofrecer acceso exclusivo a cintas e impresoras. Se usaron mas spools para guardar las salidas de programa y mas mecanismos de bloqueo.

## Sistemas de tiempo compartido
Las computadoras se modificaron para ser mas interactivos y soportar multiusuario, se empezaron a utilizar terminales y se implementaron dos tipos de miltitarea:[^1] 

- ***Cooperativa***: Cada proceso tenia el control del cpu hasta que realice una llamada al sistema o haga un `yield` (ceda su tiempo de computo), ese va a ser el momento en el que el SO ocupe tiempo de computo.

- ***Apropiativa***: Se interrumpe de manera forzada la ejecución de los procesos y se le transfiere *forzosamente* el control al sistema operativo y este elige quien sera el siguiente proceso en ejecutarse.

En los sistemas de uso compartido se considera que aparece el primer sistema operativo, donde ademas de la aparicion de un ""scheduler"" tambien comenzaron a agregarse abstracciones como sistemas de archivos y directorios a las bibliotecas del sistema.

Se mejora la velocidad de cambio de contexto entre una tarea y otra, aparece por primera vez esta ilusión de que los programas tranquilamente podrían estar ejecutándose solos. Esto gracias en los sistemas apropiativos a la interrupción periódica de la ejecución que les permitía a todos los programas avanzar con sus tareas.

## Computadoras Personales
- La primera evolucion para hacerlas mas accesibles fue que ahora se programaba con switches pero seguian siendo mas un juguete caro, por su elevado precio.

- Aparece la salida de video, usaban modem, impresoras unidades de disco y cintas. Popularizaron el lenguage `BASIC`, tenian un proto-sistema operativo(1977).

- Se provee una interfaz que separa el espacio de ejecucion de el de programacion, el SO daba una interfaz sencilla para administrar archivos y aplicaciones con comandos (`IBM PC` 1981).

- Aparecen las primeras GUIs, que permitian la interaccion con varios programas simultaneamente. Los programas se tenian que programar con la conciencia de que los recursos debian compartirse, pues podian estar ejecutandose en sistemas que no tenian el hardware dedicado a esta proteccion. Todavia no habia niveles de ejecucion ni MMU, un programa fallido podia corromper todo el equipo(1985~).
> Commodore Amiga o la Atari ST hacían un multitasking apropiativo verdadero
- De aca hasta el 2003 estuvieron compitiendo a ver quien daba mejor suite de programas para la computadora y empezaron a ganar fuerza los sistemas de tarea apropiativa. Tambien se comenzaron a comercializar los SO como se los conece hoy dia, con suites de programas ya integrados.
## Dispositivos moviles
Empezaron como calculadoras o agendas personales, tambien telefonos celulares de 25k, hasta la aparicion del iphone que daba la primera interfaz multitouch.

- IOS exclusivo a su hardware
- Android generalizado basado en Linux con vm de java y bibliotecas comunes.
- Windows Phone zZz otro intento de Microsoft de hacerse la super hiper mega archi corporacion mundial (compraron nokia y la arruinaron)
- Symbian: Oficialmente muerto.
- Firefox OS, tambien basado en linux, intentando ofrecer interfaz para programacion coneccion prermantente a la red de datos?.
### Caracteristicas Diferenciadoras
- Usan SSDs poruqe los HDDs son muy grandes pesados y mas faciles de romper.
- Multitarea pero monocontexto: No pueden emular memoria virtual por usar ssds y por ende hay poca memoria disponible, ademas no hay mucha pantalla para permitir interacción con el usuario en mas de un proceso que digamos.
- Consumo: se busca que estos dispositivos tengan el menor consumo posible, porque la batería en los dispositivos móviles también es un bien escaso. Aparecen imprementaciones donde el SO tiene el control del consumo energético
para mas info ver [[Fundamentos de los sistemas operativos.pdf#page=34&selection=0,0,0,2| lo que queda de capitulo]]





[^1]: https://youtu.be/YRLFNkGktZg?t=160




