-- ======================================================
-- PRÀCTICA TRANSVERSAL: GESTIÓ DE PRÀCTIQUES ITICBCN
-- SCRIPT 01: DEFINICIÓ DE DADES (DDL) - NOMS SINGULARS
-- ======================================================

-- 0. CREACIÓ DE LA BASE DE DADES 
DROP DATABASE IF EXISTS gestio_practiques_itic;
CREATE DATABASE gestio_practiques_itic;
\c gestio_practiques_itic;

-- 1. NETEJA DE TAULES (ORDRE INVERS A LES FK)
DROP TABLE IF EXISTS ASSIGNACIO;
DROP TABLE IF EXISTS HISTORIAL_CONTACTE;
DROP TABLE IF EXISTS ENVIAMENT;
DROP TABLE IF EXISTS PREFEREIX;
DROP TABLE IF EXISTS SOLLICITA;
DROP TABLE IF EXISTS DOMINA;
DROP TABLE IF EXISTS CURRICULUM;
DROP TABLE IF EXISTS AVALUACIO;
DROP TABLE IF EXISTS ALUMNE;
DROP TABLE IF EXISTS EMPRESA;
DROP TABLE IF EXISTS ESTAT_ENVIAMENT;
DROP TABLE IF EXISTS TECNOLOGIA;
DROP TABLE IF EXISTS CICLE;

-- 2. TAULES MESTRES (SENSE FK)
CREATE TABLE CICLE (
    id_cicle SERIAL PRIMARY KEY,
    nom_cicle VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE TECNOLOGIA (
    id_tec SERIAL PRIMARY KEY,
    nom_tec VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ESTAT_ENVIAMENT (
    id_estat_env SERIAL PRIMARY KEY,
    descripcio VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EMPRESA (
    id_empresa SERIAL PRIMARY KEY,
    cif VARCHAR(15) NOT NULL UNIQUE,
    nom_empresa VARCHAR(150) NOT NULL,
    sector VARCHAR(100),
    ubicacio VARCHAR(200),
    contacte VARCHAR(100),
    dual_intensiva BOOLEAN DEFAULT FALSE,
    dual_general BOOLEAN DEFAULT FALSE
);

-- 3. ALUMNE I AVALUACIÓ
CREATE TABLE ALUMNE (
    id_alumne SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefon VARCHAR(20),
    nass VARCHAR(20) NOT NULL UNIQUE,
    promocio VARCHAR(20) NOT NULL,
    estat_actiu BOOLEAN DEFAULT TRUE,
    ipo_aprovat BOOLEAN DEFAULT FALSE,
    moduls_troncals BOOLEAN DEFAULT FALSE,
    id_cicle INT NOT NULL,
    CONSTRAINT fk_alumne_cicle FOREIGN KEY (id_cicle) 
        REFERENCES CICLE(id_cicle) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE AVALUACIO (
    id_avaluacio SERIAL PRIMARY KEY,
    puntuacio_global DECIMAL(4,2) NOT NULL CHECK (puntuacio_global BETWEEN 0 AND 10),
    actitud INT NOT NULL CHECK (actitud BETWEEN 0 AND 10),
    autonomia INT NOT NULL CHECK (autonomia BETWEEN 0 AND 10),
    comunicacio INT NOT NULL CHECK (comunicacio BETWEEN 0 AND 10),
    treball_equip INT NOT NULL CHECK (treball_equip BETWEEN 0 AND 10),
    puntualitat INT NOT NULL CHECK (puntualitat BETWEEN 0 AND 10),
    nivell_tecnic INT NOT NULL CHECK (nivell_tecnic BETWEEN 0 AND 10),
    observacions TEXT,
    id_alumne INT NOT NULL UNIQUE,
    CONSTRAINT fk_avaluacio_alumne FOREIGN KEY (id_alumne) 
        REFERENCES ALUMNE(id_alumne) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CURRICULUM (
    id_cv SERIAL PRIMARY KEY,
    data_creacio DATE NOT NULL DEFAULT CURRENT_DATE,
    resum TEXT,
    ruta_enllac VARCHAR(255) NOT NULL,
    estat_actiu BOOLEAN DEFAULT TRUE,
    id_alumne INT NOT NULL,
    CONSTRAINT fk_cv_alumne FOREIGN KEY (id_alumne) 
        REFERENCES ALUMNE(id_alumne) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 4. TAULES INTERMÈDIES (RELACIONS N:M)
CREATE TABLE DOMINA (
    id_alumne INT NOT NULL,
    id_tec INT NOT NULL,
    nivell VARCHAR(50) CHECK (nivell IN ('Bàsic', 'Mitjà', 'Avançat')),
    PRIMARY KEY (id_alumne, id_tec),
    CONSTRAINT fk_domina_alumne FOREIGN KEY (id_alumne) 
        REFERENCES ALUMNE(id_alumne) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_domina_tec FOREIGN KEY (id_tec) 
        REFERENCES TECNOLOGIA(id_tec) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SOLLICITA (
    id_empresa INT NOT NULL,
    id_tec INT NOT NULL,
    PRIMARY KEY (id_empresa, id_tec),
    CONSTRAINT fk_sollicita_empresa FOREIGN KEY (id_empresa) 
        REFERENCES EMPRESA(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_sollicita_tec FOREIGN KEY (id_tec) 
        REFERENCES TECNOLOGIA(id_tec) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PREFEREIX (
    id_empresa INT NOT NULL,
    id_cicle INT NOT NULL,
    PRIMARY KEY (id_empresa, id_cicle),
    CONSTRAINT fk_prefereix_empresa FOREIGN KEY (id_empresa) 
        REFERENCES EMPRESA(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_prefereix_cicle FOREIGN KEY (id_cicle) 
        REFERENCES CICLE(id_cicle) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 5. FLUX DE GESTIÓ (ENVIAMENT I ASSIGNACIÓ)
CREATE TABLE ENVIAMENT (
    id_enviament SERIAL PRIMARY KEY,
    data_enviament DATE NOT NULL DEFAULT CURRENT_DATE,
    data_entrevista DATE,
    data_resposta_final DATE,
    notes TEXT,
    id_cv INT NOT NULL,
    id_empresa INT NOT NULL,
    id_estat_env INT NOT NULL,
    CONSTRAINT fk_enviament_cv FOREIGN KEY (id_cv) 
        REFERENCES CURRICULUM(id_cv) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_enviament_empresa FOREIGN KEY (id_empresa) 
        REFERENCES EMPRESA(id_empresa) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_enviament_estat FOREIGN KEY (id_estat_env) 
        REFERENCES ESTAT_ENVIAMENT(id_estat_env) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_data_entrevista CHECK (data_entrevista IS NULL OR data_entrevista >= data_enviament),
    CONSTRAINT chk_data_resposta CHECK (data_resposta_final IS NULL OR data_resposta_final >= data_enviament)
);

CREATE TABLE HISTORIAL_CONTACTE (
    id_contacte SERIAL PRIMARY KEY,
    data_contacte DATE NOT NULL DEFAULT CURRENT_DATE,
    mitja_contacte VARCHAR(50),
    resum TEXT NOT NULL,
    id_enviament INT NOT NULL,
    CONSTRAINT fk_historial_enviament FOREIGN KEY (id_enviament) 
        REFERENCES ENVIAMENT(id_enviament) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ASSIGNACIÓ (
    id_assignacio SERIAL PRIMARY KEY,
    data_inici DATE NOT NULL,
    data_fi DATE NOT NULL,
    tutor_empresa VARCHAR(100),
    estat_conveni VARCHAR(50) NOT NULL DEFAULT 'Proposada',
    id_alumne INT NOT NULL,
    id_empresa INT NOT NULL,
    CONSTRAINT fk_assignacio_alumne FOREIGN KEY (id_alumne) 
        REFERENCES ALUMNE(id_alumne) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_assignacio_empresa FOREIGN KEY (id_empresa) 
        REFERENCES EMPRESA(id_empresa) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_dates CHECK (data_fi >= data_inici)
);