-- BASE DE DATOS ACADEMIA cademia
DROP DATABASE IF EXISTS ACADEMIA;


CREATE DATABASE ACEDEMIA;

USE ACEDEMIA;

-- TABLA CURSOS

CREATE TABLE CURSOS (
    cod_curso VARCHAR(6) PRIMARY KEY,
    des_curso VARCHAR(60),
    num_semes INT,
    any_inici INT,
    any_final INT
);

-- TABLA CICLOS

CREATE TABLE CICLOS (
    cod_ciclo VARCHAR(3) PRIMARY KEY,
    des_ciclo VARCHAR(60),
    tip_grado VARCHAR(20)
);

-- TABLA ASIGNAUTRAS

CREATE TABLE ASIGNATURAS (
    cod_asigna VARCHAR(10) PRIMARY KEY,
    des_asigna VARCHAR(60),
    cod_ciclo VARCHAR(3),
    num_semes INT,
    num_horas INT,
    precio INT,
    CONSTRAINT cod_ciclo_fk FOREIGN KEY (cod_ciclo)
        REFERENCES CICLOS (cod_ciclo)
        ON UPDATE CASCADE ON DELETE CASCADE
);
       
-- TABLA PROVINCIAS

CREATE TABLE PROVINCIAS (
    cod_provi INT PRIMARY KEY,
    nom_provi VARCHAR(100)
);
    
-- TABLA PROFESORES

CREATE TABLE PROFESORES (
    cod_profe INT PRIMARY KEY,
    nom_profe VARCHAR(100),
    cod_provi INT,
    CONSTRAINT cod_provi_pro_fk FOREIGN KEY (cod_provi)
        REFERENCES PROVINCIAS (cod_provi)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- TABLA ALUMNOS

CREATE TABLE ALUMNOS (
    cod_alumno INT PRIMARY KEY,
    nom_alumno VARCHAR(100),
    fec_nacim DATE,
    cod_provi INT,
    CONSTRAINT cod_provi_alu_fk FOREIGN KEY (cod_provi)
        REFERENCES PROVINCIAS (cod_provi)
		ON UPDATE CASCADE ON DELETE SET NULL
);

-- TABLA UFS

CREATE TABLE UFS (
    cod_asigna VARCHAR(10),
    num_uf VARCHAR(4),
    des_uf VARCHAR(100),
    num_horas INT,
    num_pacs INT,
    PRIMARY KEY (cod_asigna , num_uf),
    CONSTRAINT cod_asigna_uf_fk FOREIGN KEY (cod_asigna)
        REFERENCES ASIGNATURAS (cod_asigna)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- TABLA CURSO ASIGNATYRA Y PROFESOR

CREATE TABLE CURSO_ASIGNA_PROFE (
    cod_curso VARCHAR(6),
    cod_asigna VARCHAR(10),
    cod_profe INT,
    PRIMARY KEY (cod_curso , cod_asigna),
    CONSTRAINT cod_curso_cap_fk FOREIGN KEY (cod_curso)
        REFERENCES CURSOS (cod_curso)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT cod_asigna_cap_fk FOREIGN KEY (cod_asigna)
        REFERENCES ASIGNATURAS (cod_asigna)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT cod_profe_cap_fk FOREIGN KEY (cod_profe)
        REFERENCES PROFESORES (cod_profe)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- TABLA DE NOTAS

CREATE TABLE NOTAS (
    cod_alumno INT,
    cod_asigna VARCHAR(10),
    cod_curso VARCHAR(6),
    fin_nota INT,
    PRIMARY KEY (cod_alumno , cod_asigna),
    CONSTRAINT cod_alumno_nota_fk FOREIGN KEY (cod_alumno)
        REFERENCES ALUMNOS (cod_alumno)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT cod_asigna_nota_fk FOREIGN KEY (cod_asigna)
        REFERENCES ASIGNATURAS (cod_asigna)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT cod_curso_nota_fk FOREIGN KEY (cod_curso)
        REFERENCES CURSOS (cod_curso)
        ON UPDATE CASCADE ON DELETE CASCADE
);


