# MiDUNAB

**MiDUNAB: Sistema de Gestión de Dinero UNAB (DUNAB) para estudiantes de la Universidad Autónoma de Bucaramanga.**

Prototipo funcional de escritorio hecho en **Java con interfaz gráfica Swing**. Permite que cada estudiante vea cuántas DUNAB tiene, cuántas le faltan para las **10.000** que necesita para graduarse, sus promedios de acumulación, y que se inscriba en los encuentros que las otorgan. Un administrador gestiona los encuentros y registra las DUNAB ganadas o usadas.

Integrantes: **Sofía Castellanos** e **Isabella Suárez**.

![Página principal](docs/capturas/06_inicio.png)

---

## Resumen

MiDUNAB es un prototipo funcional de aplicación de escritorio en Java (Swing) para que los estudiantes de la UNAB gestionen sus DUNAB, la moneda institucional que se obtiene al participar en encuentros y actividades de la vida universitaria. Incluye registro e inicio de sesión, perfil, CRUD de DUNAB y de encuentros, saldo y faltante para el grado, promedios por semana, mes, semestre y año, encuentros y lugares donde se obtienen DUNAB, inscripción y retiro, y diez funcionalidades adicionales (historial, meta personal, ranking, buscador, filtro por categoría, favoritos, contador de encuentros, niveles, últimos encuentros y notificaciones). La información se guarda en archivos de texto, se modela con clases orientadas a objetos y se valida con excepciones.

## Introducción y problemática

Las DUNAB reconocen la participación en encuentros deportivos, culturales, académicos, de voluntariado y de recreación, y acumular 10.000 es requisito de grado. Hoy esa información está dispersa (correos, carteles, redes) y el estudiante no sabe con certeza cuántas lleva ni cuántas le faltan; muchos llegan a los últimos semestres sin completarlas y los encuentros tienen poca participación porque no se enteran a tiempo.

Resumen de las 5 Wh:

| Pregunta | Respuesta |
|---|---|
| **Who** | Estudiantes de pregrado de la UNAB (usuarios primarios) y Bienestar Universitario y organizadores de encuentros (secundarios). |
| **What** | No hay una herramienta centralizada para ver saldo, faltante, historial y encuentros disponibles. |
| **Where** | En la UNAB (Bucaramanga): espacios de encuentros y lugares donde se obtienen DUNAB. |
| **When** | Durante todo el semestre, y se agrava en los últimos semestres al revisar los requisitos de grado. |
| **Why** | Las DUNAB son requisito de grado y ver el progreso motiva a participar en la vida universitaria. |

## Objetivo

Desarrollar MiDUNAB, un prototipo funcional de escritorio en Java con interfaz Swing, programación orientada a objetos, estructuras de datos, validación con excepciones y persistencia en archivos de texto, para que el estudiante consulte y controle sus DUNAB, sepa cuántas le faltan para las 10.000 y participe de forma organizada en los encuentros que las otorgan.

---

## Cómo ejecutarlo

Solo necesitas el **JDK 17 o superior** (no hay librerías externas).

| Opción | Pasos |
|---|---|
| **Windows** | Doble clic en `ejecutar.bat` |
| **macOS / Linux** | En una terminal dentro de la carpeta: `bash ejecutar.sh` |
| **Maven** | `mvn compile exec:java` (o `mvn package` y luego `java -jar target/midunab-1.0.0.jar`) |
| **NetBeans / IntelliJ / Eclipse** | Abrir la carpeta como proyecto Maven (lee el `pom.xml`) y ejecutar la clase `co.edu.unab.midunab.Main` |

> Ejecuta siempre desde la carpeta del proyecto, porque la aplicación lee y guarda los datos en `data/`.

### Usuarios de prueba

| Rol | Correo | Contraseña |
|---|---|---|
| Estudiante | `isabella.suarez@unab.edu.co` | `DUNAB2026` |
| Estudiante | `sofia.castellanos@unab.edu.co` (y los otros 8 de `data/estudiantes.txt`) | `DUNAB2026` |
| Administrador | `admin@unab.edu.co` (elegir la pestaña **Administrador**) | `ADMIN2026` |

También puedes crear un usuario nuevo con **Crear usuario**; empieza con 0 DUNAB.

### Fecha de demostración y datos de ejemplo

- `data/fecha_demo.txt` fija el reloj de la aplicación en **11 de octubre de 2026, 10:30**, para que los datos de ejemplo (encuentros próximos, «Hace 5 minutos», promedios) se vean igual que en el diseño. **Si borras ese archivo, la aplicación usa la fecha real del computador.**
- Para **volver a los datos iniciales**, borra la carpeta `data/` completa: al abrir la aplicación se crea de nuevo con los datos de ejemplo.

---

## Funcionalidades

### Base

| Funcionalidad | Dónde está |
|---|---|
| Registro e inicio de sesión (estudiante y administrador) | `PanelRegistro`, `PanelLogin` |
| Perfil del usuario (ver y editar datos) | Mi perfil |
| Saldo y cuántas DUNAB faltan para las 10.000 | Inicio |
| Promedios por semana, mes, semestre y año, y tiempo estimado para graduarse | Mi perfil |
| Consulta de encuentros generales e inscripción / retiro | Encuentros |
| Lugares donde se obtienen DUNAB (Cafetería del L, Cafetería El Bosque, Banú, Biblioteca, Cafetería CSU) | Lugares e Inicio |
| CRUD de encuentros | Administrador → Encuentros |
| CRUD de DUNAB (registrar, editar y eliminar movimientos) | Administrador → Movimientos DUNAB / Registrar DUNAB |

### Las 10 adicionales

| # | Funcionalidad | Pantalla |
|---|---|---|
| 1 | Historial de movimientos DUNAB (fecha, cantidad, tipo y motivo) | Historial |
| 2 | Meta personal con barra de progreso, estimación e hitos | Meta personal |
| 3 | Ranking de estudiantes con más DUNAB (ordenado con `Comparator`) | Ranking |
| 4 | Buscador de encuentros por palabra clave (sin importar tildes) | Encuentros |
| 5 | Filtro de encuentros por categoría | Encuentros |
| 6 | Encuentros favoritos (`HashSet` por estudiante) | Encuentros y Favoritos |
| 7 | Contador de encuentros realizados y DUNAB obtenidas en ellos | Mi perfil |
| 8 | Nivel automático: Inicial, Activo, Destacado, Embajador DUNAB | Mi perfil, Inicio y barra superior |
| 9 | Últimos 5 encuentros disponibles | Inicio |
| 10 | Notificaciones internas (pila `Deque`: la más reciente arriba) | Notificaciones |

Las pantallas de las funcionalidades adicionales muestran una etiqueta punteada («Funcionalidad 1», «Funcionalidades 4, 5 y 6»…) junto al título, para ubicar rápidamente cada requisito.

---

## Requisitos del proyecto y cómo se cumplen

**Persistencia local (archivos de texto).** Todo se guarda en `data/` con `BufferedReader` / `BufferedWriter` (UTF-8). Cada archivo tiene una línea de encabezado que empieza por `#` y un registro por línea separado por `;`. Se guarda cada vez que hay un cambio (primero en un `.tmp` y luego se reemplaza, para no dañar el archivo si algo falla).

| Archivo | Contenido |
|---|---|
| `estudiantes.txt` | nombres, apellidos, correo, contraseña (SHA-256), programa, semestre, fecha de ingreso, meta |
| `administradores.txt` | administradores |
| `encuentros.txt` | id, nombre, categoría, lugar, fecha, DUNAB, cupo, inscritos, descripción, destacado |
| `movimientos.txt` | id, correo, fecha, tipo (GANADA/USADA), origen (ENCUENTRO/LUGAR), cantidad, motivo, lugar |
| `inscripciones.txt` | correo, id del encuentro, fecha |
| `favoritos.txt` | correo y los id de sus encuentros favoritos |
| `notificaciones.txt` | id, correo, fecha y hora, texto, ícono, leída |

**Clases modelo orientadas a objetos.** `Usuario` (abstracta) → `Estudiante` y `Administrador`; `Encuentro`, `MovimientoDunab`, `Inscripcion`, `Notificacion`, `MetaDunab`; enumeraciones `Categoria`, `TipoMovimiento`, `Origen` y `Nivel`. Todas con atributos privados y métodos get/set (`MetaDunab` es un objeto calculado de solo lectura, por eso solo tiene get). `Aplicacion` también expone sus servicios con getters.

**Estructuras de datos.**

| Estructura | Uso |
|---|---|
| `ArrayList` | encuentros, movimientos e inscripciones |
| `HashMap` | estudiantes indexados por correo (login y registro sin duplicados) |
| `HashSet` | favoritos de cada estudiante (sin repetidos) |
| `Deque` como pila | notificaciones: la última se apila arriba |
| `Comparator` | ranking por DUNAB, historial por fecha, próximos encuentros |
| `EnumMap` | participación por categoría (panel del administrador) |

**Validación con excepciones.** Excepciones propias `DatoInvalidoException` (guarda el campo que falló) y `SaldoInsuficienteException`. Si una línea de un archivo está dañada (por ejemplo una fecha mal escrita), se omite y se avisa en la consola, sin cerrar la aplicación. Se validan: campos obligatorios, correo `@unab.edu.co`, contraseña de mínimo 8 caracteres, números enteros positivos (`NumberFormatException`, por ejemplo «cien»), fechas `dd/mm/aaaa` reales (`DateTimeParseException`, por ejemplo 31/02/2026), que los textos no tengan `;` ni saltos de línea (son los separadores de los archivos), inscripciones repetidas, cupo, encuentros que ya pasaron y que no se usen más DUNAB de las disponibles. Cada error aparece en rojo debajo de su campo.

**Menú.** Menú lateral con todas las secciones. Si la ventana se hace angosta, el menú se vuelve una barra de íconos (tableta) y luego una barra inferior (celular), igual que el diseño responsive.

**Diagrama UML.** En `docs/uml/` (PNG, SVG, PDF y fuente `.dot` de Graphviz):
- `Diagrama_de_clases` — modelo, excepciones, servicios y persistencia, con atributos, métodos, modificadores, relaciones y cardinalidad.
- `Diagrama_de_clases_interfaz` — ventanas y pantallas Swing.

---

## Cómo se calculan los promedios

Un semestre calendario dura unos 182,5 días, pero las clases ocupan unas 17,4 semanas (≈ 4,32 meses). Por eso el promedio por semana y por mes se calcula sobre las semanas y meses **lectivos** del semestre:

- Semestres cursados = días desde la fecha de ingreso ÷ 182,5.
- **Por semestre** = DUNAB ganadas ÷ semestres cursados (redondeado a la decena).
- **Por año** = 2 × semestre · **Por mes** = semestre ÷ 4,32 · **Por semana** = semestre ÷ 17,4.
- **Tiempo para graduarse** = DUNAB que faltan ÷ promedio por año (en años y meses).
- **Meta personal**: meses = DUNAB que faltan para la meta ÷ promedio por mes.

Con los datos de ejemplo, Isabella tiene 3.250 DUNAB: 62 por semana, 250 por mes, 1.080 por semestre y 2.160 por año; completaría las 10.000 en unos 3 años y 1 mes, y su meta de 5.000 en unos 7 meses (mayo de 2027).

---

## Resultados y hallazgos

- Prototipo funcional con interfaz gráfica que cumple las funcionalidades base y las 10 adicionales, con información persistente en `data/` que se conserva al cerrar y volver a abrir.
- **Estructuras de datos:** el `HashMap` por correo hace que el inicio de sesión y la validación de correos repetidos sean inmediatos; el `HashSet` evita favoritos duplicados sin tener que revisarlos a mano; la pila (`Deque`) deja siempre la notificación más reciente arriba; los `Comparator` ordenan el ranking y el historial sin escribir algoritmos de ordenamiento.
- **Participación por categoría** (datos de ejemplo, panel del administrador): Cultura tiene más inscritos (141 en 4 encuentros); Deportes tiene más encuentros (5) y reparte más DUNAB (10.800 posibles); Académico tiene la mayor ocupación de cupos (81 de 150, 54 %).

---

## Estructura del proyecto

```
MiDUNAB/
├── pom.xml                  Proyecto Maven (Java 17, sin dependencias)
├── ejecutar.bat / .sh       Compilar y ejecutar sin Maven
├── data/                    Archivos .txt con la información (persistencia)
├── docs/
│   ├── uml/                 Diagramas de clases
│   └── capturas/            Capturas de todas las pantallas
└── src/main/
    ├── java/co/edu/unab/midunab/
    │   ├── Main.java            Punto de entrada
    │   ├── Aplicacion.java      Conecta repositorios y servicios
    │   ├── modelo/              Clases del dominio y enumeraciones
    │   ├── excepcion/           Excepciones propias
    │   ├── persistencia/        GestorArchivos, repositorios y datos de ejemplo
    │   ├── servicio/            Lógica: usuarios, encuentros, DUNAB, notificaciones
    │   ├── util/                Validador, Formato (números y fechas) y Reloj
    │   └── vista/               Interfaz Swing
    │       ├── componentes/     Botones, campos, tarjetas, medidor DUNAB, diálogos…
    │       └── pantallas/       Login, registro, pantallas del estudiante y del administrador
    └── resources/
        ├── fuentes/             Poppins y Roboto (Google Fonts, licencias libres)
        ├── iconos/              Íconos PNG
        └── logo.png             Logo UNAB
```

## Diseño

La interfaz sigue el diseño de alta fidelidad hecho en Figma (naranja UNAB `#FBA51A` y neutros, Poppins para títulos y Roboto para textos, medidor DUNAB de 10 segmentos inclinados inspirado en los triángulos de la marca). Todos los componentes están dibujados a mano con Java2D, sin librerías externas.

## Bibliografía

- Booch, G., Rumbaugh, J. y Jacobson, I. (2006). *El lenguaje unificado de modelado: guía del usuario* (2.ª ed.). Pearson Educación.
- Deitel, P. y Deitel, H. (2016). *Cómo programar en Java* (10.ª ed.). Pearson Educación.
- Oracle. (s. f.). *Basic I/O*. The Java Tutorials. https://docs.oracle.com/javase/tutorial/essential/io/
- Oracle. (s. f.). *Collections*. The Java Tutorials. https://docs.oracle.com/javase/tutorial/collections/
- Oracle. (s. f.). *Creating a GUI With Swing*. The Java Tutorials. https://docs.oracle.com/javase/tutorial/uiswing/
- Universidad Autónoma de Bucaramanga. (s. f.). *Portal institucional UNAB*. https://unab.edu.co
- Weiss, M. A. (2013). *Estructuras de datos en Java* (4.ª ed.). Pearson Educación.
