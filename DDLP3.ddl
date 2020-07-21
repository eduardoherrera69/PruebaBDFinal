-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-18 16:25:44 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE alternativa (
    idalternativa        NUMBER(4) NOT NULL,
    descalt              VARCHAR2(30 CHAR) NOT NULL,
    valorlogico          CHAR(1) NOT NULL,
    pregunta_idpregunta  NUMBER(4) NOT NULL,
    pregunta_idprueba    NUMBER(4) NOT NULL
);

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalternativa,
                                                pregunta_idpregunta,
                                                pregunta_idprueba );

CREATE TABLE alumno (
    idalumno       NUMBER(4) NOT NULL,
    nombre         VARCHAR2(30 CHAR) NOT NULL,
    curso_idcurso  NUMBER(4) NOT NULL,
    idalumno1      NUMBER NOT NULL
);

ALTER TABLE alumno ADD CONSTRAINT alumno_pk PRIMARY KEY ( idalumno,
                                                          curso_idcurso );

CREATE TABLE curso (
    idcurso   NUMBER(4) NOT NULL,
    nomcurso  VARCHAR2(30 CHAR)
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

CREATE TABLE pregunta (
    idpregunta       NUMBER(4) NOT NULL,
    enunciado        VARCHAR2(30 CHAR) NOT NULL,
    puntaje          NUMBER(4),
    prueba_idprueba  NUMBER(4) NOT NULL
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta,
                                                              prueba_idprueba );

CREATE TABLE prueba (
    idprueba    NUMBER(4) NOT NULL,
    descprueba  VARCHAR2(30) NOT NULL,
    nomprueba   VARCHAR2(30 CHAR) NOT NULL,
    programa    VARCHAR2(10 CHAR),
    unidad      VARCHAR2(10 CHAR)
);

ALTER TABLE prueba ADD CONSTRAINT prueba_pk PRIMARY KEY ( idprueba );

CREATE TABLE respalt (
    idrespalt              NUMBER(4) NOT NULL,
    verfalso               CHAR(1),
    alternativaid          NUMBER(4) NOT NULL,
    respuesta_idrespuesta  NUMBER(4) NOT NULL,
    respuesta_idtest       NUMBER(4) NOT NULL,
    respuesta_idalumno     NUMBER(4) NOT NULL,
    respuesta_idcurso      NUMBER(4) NOT NULL,
    respuesta_preguntaid   NUMBER(4) NOT NULL
);

ALTER TABLE respalt ADD CONSTRAINT respalt_pk PRIMARY KEY ( idrespalt );

CREATE TABLE respuesta (
    idrespuesta           NUMBER(4) NOT NULL,
    descresp              VARCHAR2(30 CHAR) NOT NULL,
    truefalse             CHAR(1) NOT NULL,
    omitida               CHAR(1),
    preguntaid            NUMBER(4) NOT NULL,
    test_idtest           NUMBER(4) NOT NULL,
    test_alumno_idalumno  NUMBER(4) NOT NULL,
    test_alumno_idcurso   NUMBER(4) NOT NULL,
    test_idalumno1        NUMBER NOT NULL
);

ALTER TABLE respuesta ADD CONSTRAINT respuesta_pk PRIMARY KEY ( idrespuesta );

CREATE TABLE test (
    idtest           NUMBER(4) NOT NULL,
    pruebaid         NUMBER(4) NOT NULL,
    alumno_idalumno  NUMBER(4) NOT NULL,
    alumno_idcurso   NUMBER(4) NOT NULL,
    idalumno1        NUMBER NOT NULL
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( idtest );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta,
                                                         pregunta_idprueba )
        REFERENCES pregunta ( idpregunta,
                              prueba_idprueba );

ALTER TABLE alumno
    ADD CONSTRAINT alumno_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_prueba_fk FOREIGN KEY ( prueba_idprueba )
        REFERENCES prueba ( idprueba );

ALTER TABLE respalt
    ADD CONSTRAINT respalt_respuesta_fk FOREIGN KEY ( respuesta_idrespuesta )
        REFERENCES respuesta ( idrespuesta );

ALTER TABLE respuesta
    ADD CONSTRAINT respuesta_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE test
    ADD CONSTRAINT test_alumno_fk FOREIGN KEY ( alumno_idalumno,
                                                alumno_idcurso )
        REFERENCES alumno ( idalumno,
                            curso_idcurso );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
