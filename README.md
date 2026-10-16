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
ROM: Para diseñar la memoria ROM, declaré el módulo en el que define la entrada de DirL de 4 bits y la salida de Data de 32 bits. La memoria ROM consta de 16 espacios y su ancho o palabra es de 12 bits. Su componente interno es el srom donde declaré el espacio por ancho de la memoria. Para poder leer archivos externos de los 16 datos de ROMa y ROMina que están en formato binario de 12 bits utilicé la función o palabra reservada “$readmemb” que permite la lectura de los dos archivos de texto externos. Con la memoria ROM hecha, ahora se pueden hacer dos instancias llamadas “ROMa” y “ROMina”.


ROM_INSTRUC.v
Este modulo lee el archivo de instrucciones.txt y lo almacena en una memomria de 16 posiciones y cada posicion de 12 bits de esta manera
OP[11:8] 4 bits significativos define la operacion(2 para suma 6 para resta y 7 para stl), R1[7:4] 4 bits en medio, funciona como selector para ROMA, R2[3:0] 4 bits menos significativos funciona como selector de ROMina.
segun la tabla de pruebas cada linea se construyo juntanto los campos en binario


Conclusión.

Referencias bibliográficas 
Equipo editorial, Etecé. (19 de noviembre de 2023). Memoria ROM. Concepto. https://concepto.de/memoria-rom/ 
Equipo editorial, Etecé. (7 de febrero de 2025). Memoria RAM. Concepto. https://concepto.de/memoria-ram/ 
Sy Corvo, H. (6 de septiembre de 2024). ALU (unidad aritmética lógica). Lifeder. https://www.lifeder.com/unidad-aritmetica-logica/ 
