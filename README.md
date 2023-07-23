# Academia
Base de datos  - MySQL 


Este repositorio contiene los scripts SQL que definen la estructura de la base de datos "ACADEMIA", que se utiliza para gestionar información relacionada con cursos, ciclos, asignaturas, profesores, alumnos y notas en una academia educativa.

## Estructura de la Base de Datos

La base de datos "ACADEMIA" está compuesta por las siguientes tablas:

1. **CURSOS**: Almacena información sobre los cursos ofrecidos por la academia, incluyendo su código, descripción, número de semestres, año de inicio y año de finalización.

2. **CICLOS**: Contiene información sobre los ciclos de estudio, como su código, descripción y tipo de grado.

3. **ASIGNATURAS**: Guarda los detalles de las asignaturas ofrecidas, como su código, descripción, código de ciclo al que pertenecen, número de semestres, número de horas, y precio. Esta tabla tiene una relación con la tabla "CICLOS".

4. **PROVINCIAS**: Almacena información sobre las provincias, con su código y nombre.

5. **PROFESORES**: Contiene datos de los profesores, como su código, nombre y código de provincia donde están ubicados. Esta tabla tiene una relación con la tabla "PROVINCIAS".

6. **ALUMNOS**: Guarda información de los alumnos, como su código, nombre, fecha de nacimiento y código de provincia donde residen. Esta tabla tiene una relación con la tabla "PROVINCIAS".

7. **UFS**: Almacena detalles de las Unidades Formativas (UF) de las asignaturas, incluyendo su código de asignatura, número de UF, descripción, número de horas y número de PACs. Esta tabla tiene una relación con la tabla "ASIGNATURAS".

8. **CURSO_ASIGNA_PROFE**: Relación de cursos, asignaturas y profesores, donde se especifican los cursos que ofrecen asignaturas y los profesores asignados a dichas combinaciones. Esta tabla tiene relaciones con las tablas "CURSOS", "ASIGNATURAS" y "PROFESORES".

9. **NOTAS**: Almacena las notas de los alumnos en las asignaturas de cada curso. Esta tabla tiene relaciones con las tablas "ALUMNOS", "ASIGNATURAS" y "CURSOS".
