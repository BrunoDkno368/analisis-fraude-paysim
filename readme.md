🔍 Fraude en pagos móviles: ¿dónde ocurre y qué conviene revisar primero?

💡 En una frase: analicé 6,3 millones de operaciones y encontré una regla simple que detecta el 97,6 % del fraude revisando menos de 1 de cada 5 operaciones.

Dashboard de fraude en pagos móviles

Análisis de datos de fraude con Python, SQL y Power BI · Dataset PaySim (simulado) · 6.362.620 operaciones

🎯 El problema

Un equipo de prevención de fraude no puede revisar todas las operaciones: son millones. Si revisa al azar, se le escapan casos. Si revisa todo, no alcanza el tiempo.

Es como un aeropuerto: no se puede registrar a todos los pasajeros, así que hay que decidir a quién mirar primero.

La pregunta de este proyecto: ¿en qué tipo de operaciones ocurre el fraude y qué señal permite detectarlo revisando lo mínimo posible?

📊 Lo que encontré, en cuatro números
Dato	Qué significa
0,13 %	El fraude es muy raro: 8.213 casos entre 6.362.620 operaciones, unos 13 cada 10.000.
2 de 5	Solo hay fraude en dos tipos de operación: transferencias y retiros en efectivo. En los otros tres no hay ni un caso.
97,6 %	Casi todo el fraude ocurre cuando la operación deja la cuenta de origen en cero.
18,7 %	Revisando solo esas operaciones se cubre el 97,6 % de los casos y el 87,5 % del dinero defraudado.
✅ Mi recomendación

Priorizar la revisión de las transferencias y retiros en efectivo que dejan la cuenta de origen vacía.

Con eso se revisa menos de 1 de cada 5 operaciones (18,7 %) y se cubre el 97,6 % del fraude.
Prioridad máxima: las transferencias que vacían la cuenta. Son solo el 3,6 % de las operaciones, pero concentran casi la mitad de los fraudes (47,9 %).
🧠 Cómo lo pensé
Miré la tasa, no la cantidad. Dos tipos de operación tenían casi los mismos casos de fraude, pero uno tenía una cuarta parte de las operaciones, así que era unas 4 veces más riesgoso. Es como los accidentes de tránsito: en la hora pico hay más accidentes porque hay más autos, y lo que dice si un lugar es peligroso es cuántos accidentes hay por cada auto que pasa.
Corregí un error mío. Mi primera versión de la señal "cuenta vaciada" también contaba las cuentas que ya estaban en cero antes de la operación (casi la mitad), y por eso no mostraba nada. Al separarlas, apareció el patrón. Lo dejo escrito porque detectar y corregir ese error fue lo que más me enseñó del proyecto.
Medí en casos y en dinero. La regla cubre el 97,6 % de los casos pero el 87,5 % del dinero: los 201 fraudes que se escapan son pocos, pero en promedio unas 5,7 veces más grandes.
La probé en dos momentos distintos. Dividí los 30 días de datos en dos períodos y medí la regla en cada uno: cubrió el 97,8 % y el 97,0 % de los casos. En dinero bajó de 89,2 % a 84,0 %.
Validé los números en tres herramientas. Los mismos resultados salieron en Python, en SQL y en Power BI.
⚠️ Lo que no hay que sobreinterpretar

Prefiero decirlo yo antes que lo encuentre otro:

Los datos son simulados. Que tres tipos de operación no tengan ningún fraude es una señal de eso: en la realidad no se esperaría una separación tan limpia. Es un ejercicio de análisis, no un resultado aplicable a un banco real.
Los montos no tienen moneda. Están en unidades de la simulación.
La cobertura es optimista. La regla se eligió mirando los mismos datos con los que se mide. Mi prueba en dos períodos mide si se mantiene en el tiempo, no es una validación estricta.
Casi todo lo que se revisa es legítimo. Cerca de 99 de cada 100 operaciones marcadas por la regla no son fraude. Una regla simple ayuda a priorizar, pero no reemplaza el criterio de un analista.
Los períodos no son parejos. El segundo tiene el 4,7 % de las operaciones y el 32 % de los fraudes, así que la comparación entre ambos tiene límites.
🛠️ Herramientas y qué hice con cada una
Herramienta	Para qué la usé
Python (pandas)	Leer y verificar los datos, crear la regla y cargarlos a la base de datos
SQL (MySQL)	Calcular tasas de fraude por tipo de operación, por estado de la cuenta y la cobertura de la regla
Power BI	Armar un dashboard de una página con los resultados
📁 Contenido del repositorio
├── README.md          Esta página
├── imagenes/          Captura del dashboard
├── python/            Preparación de los datos y carga a MySQL
├── sql/               Creación de la tabla y consultas comentadas
├── power_bi/          Dashboard (.pbix)
└── datos/             Fuente del dataset
<details> <summary><b>🔁 Cómo reproducirlo (para quien quiera repetir el análisis)</b></summary>
Descargar el archivo CSV desde Kaggle (PaySim), del autor Edgar Lopez-Rojas, y guardarlo en la carpeta del proyecto. No está en el repositorio porque pesa unos 470 MB.
Crear la base en MySQL: CREATE DATABASE fraude_paysim;
Ejecutar el archivo de creación de la tabla de la carpeta sql/.
Instalar las librerías: pip install pandas numpy sqlalchemy pymysql
Completar el nombre del archivo y la contraseña en el script de python/ y ejecutarlo (la carga tarda varios minutos).
Ejecutar las consultas de sql/. Conviene hacerlo desde la línea de comandos de MySQL, porque MySQL Workbench corta las consultas largas a los 30 segundos.
Abrir el archivo .pbix de power_bi/ en Power BI Desktop. Los datos de resumen ya están dentro del archivo.
</details> <details> <summary><b>📚 Datos utilizados</b></summary>
Fuente: Synthetic Financial Datasets For Fraud Detection (PaySim), de Edgar Lopez-Rojas, en Kaggle.
Contenido: 6.362.620 operaciones de dinero móvil simuladas durante unas 743 horas (alrededor de 30 días), con la etiqueta de fraude incluida.
Columnas usadas: hora de la simulación, tipo de operación, monto, saldos de la cuenta de origen antes y después, y la marca de fraude.
Columnas descartadas: los nombres de las cuentas y los saldos del destino, que no aportan a la pregunta y pesan mucho.
</details>
👤 Sobre mí

Bruno Argañaraz · Analista de datos junior, en formación, con foco en fraude y riesgos. Trabajo hace 14 años en atención al cliente, y este proyecto es parte de mi portfolio para dar el salto al análisis de datos.

📎 LinkedIn · 💻 GitHub

fraud detection · mobile payments fraud · fraud analytics · risk analytics · data analysis · Python · SQL · MySQL · Power BI · DAX · data visualization · business intelligence · prevención de fraude · análisis de riesgos