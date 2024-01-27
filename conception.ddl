-- Généré par Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   à :        2024-01-27 19:11:36 CET
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dossier_medical (
    id                 number
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    historique_medical text 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    allergies          text 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    groupe_sanguin     varchar2(10) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    patient_id         number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE dossier_medical ADD CONSTRAINT dossier_medical_pk PRIMARY KEY ( id );

CREATE TABLE evenement_hospitalier (
    id              number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    type            varchar(25) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    dateheure_debut timestamp 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    dateheure_fin   timestamp 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    patient_id      number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE evenement_hospitalier ADD CONSTRAINT evenement_hospitalier_pk PRIMARY KEY ( id );

CREATE TABLE medecin (
    id         number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    nom        varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    prenom     varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    specialite varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 

);

ALTER TABLE medecin ADD CONSTRAINT medecin_pk PRIMARY KEY ( id );

CREATE TABLE patient (
    id              number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    nom             varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    prenom          varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    date_naissance  DATE 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    adresse         varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    num_sec_sociale varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 

);

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( id );

CREATE TABLE prescription (
    id                 number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    date_heure             timestamp
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    description        text 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    dossier_medical_id number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE prescription ADD CONSTRAINT prescription_pk PRIMARY KEY ( id );

CREATE TABLE rapport (
    id                       number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    contenu                  text 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    date_heure                timestamp 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    evenement_hospitalier_id number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE rapport ADD CONSTRAINT rapport_pk PRIMARY KEY ( id );

CREATE TABLE rendez_vous (
    id         number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    date_heure timestamp 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    motif      text 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    medecin_id number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    patient_id number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE rendez_vous ADD CONSTRAINT rendez_vous_pk PRIMARY KEY ( id );

CREATE TABLE traitement (
    id              number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    nom_medicament  varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    dosage          varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    frequence       varchar2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    prescription_id number 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE traitement ADD CONSTRAINT traitement_pk PRIMARY KEY ( id );

ALTER TABLE prescription
    ADD CONSTRAINT iddossiermedical_fk FOREIGN KEY ( dossier_medical_id )
        REFERENCES dossier_medical ( id )
            ON DELETE CASCADE;

ALTER TABLE rapport
    ADD CONSTRAINT idevenementhospitalier_fk FOREIGN KEY ( evenement_hospitalier_id )
        REFERENCES evenement_hospitalier ( id )
            ON DELETE CASCADE;

ALTER TABLE rendez_vous
    ADD CONSTRAINT idmedecin_fk FOREIGN KEY ( medecin_id )
        REFERENCES medecin ( id )
            ON DELETE CASCADE;

ALTER TABLE dossier_medical
    ADD CONSTRAINT idpatient_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( id )
            ON DELETE CASCADE;

ALTER TABLE rendez_vous
    ADD CONSTRAINT idpatient_fkv2 FOREIGN KEY ( patient_id )
        REFERENCES patient ( id )
            ON DELETE CASCADE;

ALTER TABLE evenement_hospitalier
    ADD CONSTRAINT idpatient_fkv3 FOREIGN KEY ( patient_id )
        REFERENCES patient ( id )
            ON DELETE CASCADE;

ALTER TABLE traitement
    ADD CONSTRAINT idprescription_fk FOREIGN KEY ( prescription_id )
        REFERENCES prescription ( id )
            ON DELETE CASCADE;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
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
