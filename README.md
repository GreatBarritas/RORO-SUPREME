# RORO-SUPREME
Asignatura: Arquitectura de computadoras.
Integrantes: 
Xavier Alejandro Rodríguez Ramírez
Diego Arian Molina Anaya
Angel Isaac Vazquez Romero
Equipo: Barritas
Profesor: Jorge Ernesto Lopez Arce Delgado
Fecha: 17/09/2026
Número de actividad: 03.
Título de actividad: Mux 6 a 1 y Operaciones comportamentales instanciadas.

Introducción
Jim Keller es un arquitecto muy importante en la creación de procesadores, empezando en DEC (Digital Equipment Corporation), ayudando con el desarrollo del VAXstation 100, una terminal gráfica programable, luego se unió a Apple durante la adquisición de una pequeña startup (P.A Semi). Durante ese periodo colaboró en el desarrollo del procesador H6 de Apple, el cual posteriormente se llamaría A7. Posteriormente en 2016 se unió al equipo de Tesla para dirigir la ingeniería de hardware del Autopilot.Luego en 2020 se unió a Tenstorrent donde ahora es director ejecutivo, donde TT es un procesador tensorial, conformado por procesadores tensoriales más pequeños, con  esto planean crear la workstation de IA mas rapida que se pueda fabricar.

¿Qué es una GPU (Graphics Processing Unit)?

Es un circuito electrónico que permite el procesamiento de imágenes y videos implementado arquitecturas many-cores, las GPU  fueron diseñadas como computadoras especializadas en cómputo numérico, en contraparte las CPU (Central Processing Unit) están especializadas en el trabajo de aplicaciones secuenciales, contar con ambas permite disfrutar de sus respectivas ventajas, es así como surge CUDA (Compute Unified Device Architecture) presentado por NVIDIA en 2007, la cual nos permite el desarrollo de aplicaciones a través de una arquitectura CPU-GPU, pero también es importante tomar en cuenta que el puerto PCI-E puede constituir un cuello de botella entre la GPU y CPU, provocando un menor rendimiento, se implementa la tecnología DDR para mejorar las velocidades de la memoria en las GPU, hablando de memoria, en una GPU existen varios tipos de memoria las cuales se dividen en on-chip y off-chip, la que más destaca de ellas es la memoria VRAM que permite almacenar datos graficos a una velocidad demasiada alta.

¿Por qué usar una GPU?

Es recomendable usar una GPU dedicada si se planea realizar actividades que demanden una alta procesamiento de imágenes, como edición de video, diseño 3D, o  para realizar operaciones matemáticas a altas velocidades que lo requieran como el entrenamiento de IA, también se puede optar por el uso de una GPU si deseas jugar juegos a una buena calidad de imagen sin sufrir caídas en rendimiento.

ALU vs GPU (Aritmético)

La ALU (Arithmetic Logic Unit) en una arquitectura CISC (Complex Instruction Set Computer) permite resolver operaciones complejas lo más rápido posible con una excelente precisión, mientras que una GPU permite realizar miles operaciones  al mismo tiempo, pero de menor complejidad, por lo que si lo que buscas es realizar miles de operaciones en paralelo y no son tan complejas es mejor usar una GPU, pero si lo que buscas es una mayor precisión y vas a realizar operaciones complejas es mejor usar una ALU en arquitectura CISC.

Objetivo

Desarrollar un módulo que tenga 5 entradas, las cuales 3 de ellas son de 4 bits, y las otras dos son de 8 y 3 bits respectivamente, además de implementar dos salidas, una de ellas deberá mostrar el resultado de una de las 6 opciones que se desarrollaran y la otra mostrará salida 1 si se selecciona una determinada salida, así mismo, se deberá hacer un test bench de dicho módulo en el cual se deberá realizar 5 veces cada operación.

Desarrollo

op1.v

En este módulo realizaremos la operación A + B - C, el cual tendrá 3 entradas, todas de 4 bits y una salida de 8 bits. Este módulo no necesita de registros ni de cables, solo se harán asignaciones, para dicha asignación se usarán los operandos de suma y resta.

op2.v

El propósito de este módulo es multiplicar dos entradas de 4 bits (A y C), y se tendrá una salida de 8 bits, lo cual es perfecto para esta operación y no nos limitara a la hora de realizar operaciones como 15 * 15, ya que no sobrepasa el límite de los 8 bits (255).

op3.v

Para este modulo se realizara la operación de corrimiento a la izquierda, lo que hace a nivel de bits es agregar n ceros al bit menos significativo (el que está más a la derecha), ejemplo si tenemos; 1011 y le hacemos corrimiento 2 hacia la izquierda, el resultado será 101100, para poder implementarlo en nuestro módulo, se usa el operador “<<” en verilog, dicho módulo tendrá una entrada de 8 bits y una salida de 8 bits, por lo que es probable que se pierdan datos a la hora de hacer la operación. También es importante mencionar que en base decimal se multiplica por 2 a la n, n siendo la cantidad de bits que queramos recorrer), ejemplo; 10 << 2 = 10 * 2^2 = 40



op4.v

Este módulo es similar al segundo módulo, con la diferencia de que se multiplican dos entradas de distinto tamaño una de 4 bits y otra de 8 bits, por lo que lo ideal sería tener una salida de 12 bits para evitar truncamientos, pero para este módulo usaremos una salida de 8 bits, lo que aumenta la probabilidad de truncar resultados, es decir, no siempre serán correctos los resultados ya que puede que no sea posible mostrar los bits más importantes (los que están más a la izquierda). 

op5.v

En este módulo implementaremos el módulo, el módulo es el residuo que se obtiene de dividir un valor entre otro, en este caso sería entre el número 2. En verilog el operador para el módulo es “%”, una vez dicho esto pasemos a las entradas y salidas, nuestro módulo tendrá una entrada de 8 bits y una salida de 8 bits, dicha salida nos devolverá el residuo de dividir el valor de nuestra entrada entre dos.

op6.v

Para este módulo necesitaremos dos entradas, ambas de 4 bits, asi como una salida de 8 bits, dicha salida mostrará el resultado de sumar nuestras dos entradas.

MUX61.v

Aquí implementaremos un módulo llamado mux6_1 el cual tendrá 5 entradas: un selector el cual se determinó que será de 3 bits ya que con esta cantidad de bits podemos representar hasta 8 opciones distintas, pero en este módulo solo ocuparemos 6, también se tendrá una entrada de 8 bits, el resto será de 4 bits, también tendremos 2 salidas que serán registros, una de 8 bits y otra de 1 bit, la primera mostrará el resultado de la opción que seleccionemos, la otra mostrará 1 cuando se seleccionen las salidas 1, 3 o 6. En este módulo también haremos las instancias de nuestras 6 opciones, así como la creación de 6 cables los cuales serán de 8 bits, dichos cables representan las salidas de cada una de nuestras opciones, ya con los cables y las instancias listas procedemos a crear un bloque secuencial always en este always condicionamos a nuestra salida de 1 bit para que muestre 1 solo cuando se seleccionan las opciones 1, 3 o 6, esto lo haremos con ayuda del operador or “||” después dentro de nuestro always implementaremos un case de nuestro selector, el cual nos servirá para mostrar una única salida según la opción que escoja, si no se encuentra la opción por defecto definimos una salida de 0, y finalizamos tanto el case como  el always.




MUX61_tb.v

En este módulo no se tienen entradas ni salidas, por lo que pasaremos a definir nuestros cables y registros, para el módulo ocuparemos dos cables uno de 8 bits para nuestra primera salida,y otro de 1 bit para nuestra segunda salida, las cuales ya fueron explicadas, también tendremos 5 registros: uno de 3 bits para nuestro selector, otros 3 de 4 bits para 3 de nuestras entradas y otro de 8 bits para otra de nuestras entradas, una vez creadas pasemos a instanciar cada cable y registro con su respectiva entrada o salida de nuestro módulo mux6_1 creado con anterioridad, después de hacer las instancias, pasamos a las pruebas con un bloque secuencial initial, aquí le damos valores a nuestro selector y a las demás entradas según sea necesario para la opción que estemos seleccionando, para estas pruebas se asignan valores sin signo en base decimal, esto debemos hacerlo un total de 5 veces por opción, también es importante mencionar que las pruebas se realizarán cada 100 ns, luego finalizamos el initial y el módulo.


ROM_INSTRUC.v
Este modulo lee el archivo de instrucciones.txt y lo almacena en una memomria de 16 posiciones y cada posicion de 12 bits de esta manera
OP[11:8] 4 bits significativos define la operacion(2 para suma 6 para resta y 7 para stl), R1[7:4] 4 bits en medio, funciona como selector para ROMA, R2[3:0] 4 bits menos significativos funciona como selector de ROMina.
segun la tabla de pruebas cada linea se construyo juntanto los campos en binario

Pruebas de simulación:

Aquí se ven los resultados de hacer 5 veces la opción 1 (A + B - C):

Los valores de A para esta prueba son: 4, 10, 8, 9, 12.
Los valores de B para esta prueba son: 7, 15, 2, 6, 14.
Los valores de C para esta prueba son: 3, 5, 10, 4, 5.

Los resultados esperados son: 8, 20, 0, 11, 21. 


Resultados de la opción 2 (A * C):

Los valores de A en esta prueba son: 5, 7, 3, 9, 15.
Los valores de C en esta prueba son: 2, 3, 4, 15, 11.
Los resultados esperados son: 10, 21, 12, 135, 165. 


Resultados de la opción 3 (corrimiento 2 en D):

Los valores de D en esta prueba son: 34, 5, 46, 19, 21.
Los resultados esperados son: 136, 20, 184, 76, 84.



Resultados de la opción 4(C * D), nota es posible que haya resultados truncados en esta prueba:

Los valores de C en esta prueba son: 5, 7, 3, 7, 12.
Los valores de D en esta prueba son: 24, 10, 15, 20, 13.
Los resultados esperados son: 120, 70, 45, 140, 156., 


Resultados de la opción 5(D módulo 2):

Los valores de D en esta prueba son: 10, 15, 22, 255, 128.
Los resultados esperados son: 0, 1, 0, 1, 0.



Resultado de la opción 6 (B + C):

Los valores de B en esta prueba son: 11, 10, 5, 7, 12.
Los valores de C en esta prueba son: 15, 8, 3, 9, 8.
Los resultados esperados son: 26, 18, 8, 16, 20.



Conclusión
Fue muy buena actividad, gracias a esto aprendimos qué límites pueden tener ciertas operaciones, como el producto entre una entrada de 4 bits y otra de 8 bits, ya que si no se tiene una salida que pueda representar bien todas los resultados que se puedan obtener se pueda dar un truncamiento lo que nos quita exactitud en los resultados, también se aprendió nuevas operaciones como el corrimiento, por lo que concluyo lo concluido como una excelente actividad, GOD 10/10 obra maestra.

Referencias

Keller, J., Dominici, F. y Archerman, H. (2026, 09, julio).From Silicon to Intelligence: The Future of AI Compute—A Fireside Chat With Jim Keller, CEO of Tenstorrent. HDSR. Recuperado de https://hdsr.mitpress.mit.edu/pub/n7la10vt/release/4

Piccoli, M. (2011). Computación de alto desempeño en GPU.
https://sedici.unlp.edu.ar/bitstream/handle/10915/18404/Documento_completo__.pdf?sequence=1&isAllowed=y

Vega, J., Sanchez, R. y Salgado, G. (1992). Arquitectura RISC vs CISC. (UNIVERSIDAD AUTÓNOMA METROPOLITANA). Repositorio Institucional: https://triton.astroscu.unam.mx/fruiz/introduccion/introduccion_computacion/Arquitectura%20RISC%20vs%20CISC.pdf


tarea
