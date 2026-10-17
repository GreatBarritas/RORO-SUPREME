Asignatura: Arquitectura de computadoras.
Equipo: Barritas.
Integrantes: 
Xavier Alejandro Rodríguez Ramírez
Diego Arian Molina Anaya
Angel Isaac Vazquez Romero
Profesor: Jorge Ernesto Lopez Arce Delgado
Fecha: 16/10/2026
Título de actividad: Act4. Memorias e Instrucciones.

Introducción 
Memoria ROM:
ROM significa (Read-Only Memory) es un tipo de memoria de almacenamiento que es empleado en computadoras y dispositivos electrónicos.
Su característica principal es que es una memoria de sólo lectura de datos que lo implementan en la fabricación y que no permite escribir información nueva a la memoria. Los datos introducidos por el fabricante suelen ser primitivos, básicos u operativos.
La memoria como es sólo lectura no necesita una fuente de energía y no es volátil porque no hay forma de modificar los datos de la memoria, además de que es muy lenta para ejecutarse.

Memoria RAM:
RAM significa (Random Access Memory) es un tipo de memoria operativa de las computadoras y sistemas informáticos, donde se ejecuta la mayor parte del software, desde el propio sistema operativo hasta el software de aplicación y otros programas que son semejantes.
A diferencia de la ROM, la RAM es una memoria que lee datos agregados por el fabricante y permite escribir o recuperar información a la memoria sin la necesidad de un orden secuencial y es más veloz para ejecutarse. Es volátil porque su forma de memoria es temporal ya que si se desconecta o pierde energía el sistema vuelve a estar blanco y pierde la información. Como es memoria aleatoria tiene libre acceso a las direcciones de la memoria sin necesidad de ser secuencial y por lo tanto garantiza más eficiencia al trabajar con los datos.

ALUMIPS:
Significa (Unidad aritmética lógica) es un circuito electrónico cuya función es ejecutar todos los procesos relacionados con los procedimientos de lógica y cálculo numérico. Es un componente indispensable de la unidad central de procesamiento (CPU) de las computadoras.
En algunas estructuras de CPU, la ALU se divide en una unidad aritmética y una unidad lógica. La mayoría de las operaciones de una CPU son realizadas por una o más ALU, cuando se cargan los datos desde los registros de entrada.
La unidad de control de la CPU indica a la ALU qué operación debe realizar con esa información, y guarda el resultado en el registro de salida. La unidad de control es quien hace la transferencia de información entre los registros, la ALU y la memoria.

Objetivos.
El objetivo de está actividad consiste en diseñar el módulo RORO Supreme para poder ejecutar una secuencia de 16 instrucciones de 12 bits. Podemos reutilizar los módulos ROM, ALUMIPS y RORO que están proporcionados, creando la ROM de instrucciones y desarrollar lo que serían los testbenches de RORO y del sistema completo para así realizar pruebas en la simulación de RORO Supreme y el sistema completo para obtener los resultados esperados.

Desarrollo.

ROM: Para diseñar la memoria ROM, declaré el módulo en el que define la entrada de DirL de 4 bits y la salida de Data de 32 bits. La memoria ROM consta de 16 espacios y su ancho o palabra es de 32 bits. Su componente interno es el srom donde declaré el espacio por ancho de la memoria. Para poder leer archivos externos de los 16 datos de ROMa y ROMina que están en formato binario de 32 bits utilicé la función o palabra reservada “$readmemb” que permite la lectura de los dos archivos de texto externos. Con la memoria ROM hecha, ahora se pueden hacer dos instancias llamadas “ROMa” y “ROMina”.


ROM_INSTRUC.v
Este modulo lee el archivo de instrucciones.txt y lo almacena en una memomria de 16 posiciones y cada posicion de 12 bits de esta manera
OP[11:8] 4 bits significativos define la operacion(2 para suma 6 para resta y 7 para stl), R1[7:4] 4 bits en medio, funciona como selector para ROMA, R2[3:0] 4 bits menos significativos funciona como selector de ROMina.
segun la tabla de pruebas cada linea se construyo juntanto los campos en binario

RORO_tb:
En este modulo no se reciben entradas ni salidas, pero se crean los registros y los cables que se van a conectar con la instancia de RORO DUV donde su instruccion esta conectada con "instruccion_tb" que es de 12 bits de tipo registro y las salidas "resultado" de 32 bitss y "ZF" de 1 bit las cuales van conectadas con los wires "resultado_tb" y "ZF_tb" respectivamente. Luego pasamos a las inicializaciones de la instruccion que recorre las 16 direcciones de ROMa y ROMina, en dichas instrucciones hacemos las operaciones de la MIPSALU; SUMA(0010), RESTA(0110) Y SLT(0111). Tambien implementamos las comprobaciones PASS/FAIL con condicionales simples que comprueban si las salidas son identicas a las salidas esperadas.

RORO_SUPREME:
Es un modulo con una entrada de 4 bits "direccion" la cual nos sirve para decirle a la ROM de instrucciones que instruccion queremos leer. Tambien se tienen dos salidas una de 32 bits "resultado" y ZF de 1 bit. Luego creamos nuestro cable que va a conectar la ROM de instrucciones con RORO este cable es de 12 bits, por que de 12 bits? porque va conectado con la data de la ROM de instrucciones que tambien es de 12 bits. En cuanto a las instancias haremos dos una para conectar la ROM de instrucciones con nuestro cable y otra de RORO para conectar tanto el cable que sale de la ROM de instrucciones como las salidas de la MIPSALU. El conjunto de todo esto se puede entender de esta manera; hace de cuenta que quieres pasarle una instruccion a RORO entonces le dices a la ROM de instrucciones que instruccion pasarle a RORO, una vez se lo pasa a RORO, RORO la lee y reparte la instruccion entre la operacion que se va a hacer, y las direcciones que se van a tomar tanto de ROMa y de ROMina, de ahi se toman esos datos y se van pa la ALU y esta los procesa, hace la operacion correspondiente y nos da el resultado.

RORO_SUPREME_tb:
Aqui creamos un registro "direccion_tb" de 4 bits y dos wires "resultado_tb" de 32 y "ZF_tb" de 1 bit, los cuales van ir conectados con la RORO_SUPREME DUV, luego hacemos un entero "i" que nos servira para recorrer cada una de las direcciones de la ROM de instrucciones, asi mismo, creamos dos arreglos de tipo reg que van a almacenar los valores esperados de la simulacion esto para luego hacer las comprobaciones PASS/FAIL. En el bloque initial llenamos los arreglos que creamos y hacemos un for donde usaremos nuestro entero "i", para que un for? pues para recorrer todas las direcciones de la ROM de instrucciones, esto nos permite ahorrar una gran cantidad de codigo, aqui mismo en este for hacemos las comprobaciones PASS/FAIL con un if else.

Conclusión.

Es divertido ver como nomas no jala el testbench y te das cuenta que es porque pusiste `timescale 100ns/100ns en lugar de 1ns/1ns, pero de ahi en mas, estuvo entretenido hacer esta actividad ya que me permitio entender mejor como se conectan la ROM y la ALU. En conclusion es GOTY.

Referencias bibliográficas 
Equipo editorial, Etecé. (19 de noviembre de 2023). Memoria ROM. Concepto. https://concepto.de/memoria-rom/ 
Equipo editorial, Etecé. (7 de febrero de 2025). Memoria RAM. Concepto. https://concepto.de/memoria-ram/ 
Sy Corvo, H. (6 de septiembre de 2024). ALU (unidad aritmética lógica). Lifeder. https://www.lifeder.com/unidad-aritmetica-logica/ 
