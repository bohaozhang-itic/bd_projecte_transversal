
/*
INSERT
*/

-- TAULES PRINCIPALS
INSERT INTO CICLES (nom_cicle) VALUES 
('ASIR'), 
('DAM'), 
('DAW');

INSERT INTO TECNOLOGIES (nom_tec) VALUES 
('Linux (Debian/Ubuntu)'), 
('SQL'), 
('Java'), 
('React'), 
('Docker'), 
('AWS / Cloud');

INSERT INTO ESTATS_ENVIAMENT (descripcio) VALUES 
('Enviat'), 
('Entrevista programada'), 
('Rebutjat'), 
('Acceptat per empresa');

INSERT INTO EMPRESES (cif, nom_empresa, sector, ubicacio, contacte, dual_intensiva, dual_general) VALUES 
('A12345678', 'T-Systems', 'Tecnologia', 'C/ de la Llacuna, 166 (22@)', 'rrhh@t-systems.com', TRUE, FALSE),
('B87654321', 'Indra', 'Consultoria', 'C/ de Roc Boronat, 133', 'talento@indra.es', FALSE, TRUE),
('C99887766', 'Bitpanda', 'Fintech', 'C/ de Badajoz, 60', 'jobs@bitpanda.com', TRUE, TRUE);

-- ALUMNES
INSERT INTO ALUMNES (nom, cognoms, email, telefon, nass, promocio, id_cicle) VALUES 
('Miquel', 'Molina', 'miquel.molina@iticbcn.cat', '600111222', '1234567890', '2023-2024', 1),
('Tarek', 'Haddad', 'tarek.haddad@iticbcn.cat', '600333444', '0987654321', '2023-2024', 3),
('Adam', 'Sba', 'adam.sba@iticbcn.cat', '600555666', '1122334455', '2023-2024', 2),
('Eric', 'Grau', 'eric.grau@iticbcn.cat', '600777888', '5544332211', '2023-2024', 1);

-- AVALUACIONS
INSERT INTO AVALUACIONS (puntuacio_global, actitud, autonomia, comunicacio, treball_equip, puntualitat, nivell_tecnic, ipo_aprovat, moduls_troncals, id_alumne) VALUES 
(9.5, 4, 4, 4, 4, 4, 4, TRUE, TRUE, 1),   
(8.2, 4, 3, 4, 3, 4, 4, TRUE, TRUE, 2),   
(6.0, 3, 2, 3, 3, 3, 2, TRUE, FALSE, 3),  
(4.5, 2, 2, 3, 2, 2, 1, FALSE, FALSE, 4); 

-- CURRICULUMS
INSERT INTO CURRICULUMS (resum, ruta_enllac, id_alumne) VALUES 
('CV Miquel Molina - Perfil SysAdmin Linux', '/docs/cv/miquel.pdf', 1),
('CV Tarek Haddad - Fullstack React', '/docs/cv/tarek_react.pdf', 2),
('CV Tarek Haddad - Perfil Genèric', '/docs/cv/tarek.pdf', 2),
('CV Adam Sba - Junior DAM', '/docs/cv/adam.pdf', 3),
('CV Eric Grau - Sistemas', '/docs/cv/eric.pdf', 4);

-- TAULES INTERMÈDIES
INSERT INTO DOMINA (id_alumne, id_tec, nivell) VALUES 
(1, 1, 'Avançat'), (1, 6, 'Mitjà'), 
(2, 4, 'Avançat'), (2, 2, 'Mitjà'), 
(3, 3, 'Bàsic');                    

INSERT INTO SOL_LICITA (id_empresa, id_tec) VALUES 
(1, 1), (1, 6), 
(2, 3), (2, 4), 
(3, 5);         

-- FLUX DE GESTIÓ
INSERT INTO ENVIAMENTS (id_cv, id_empresa, id_estat_env, notes) VALUES 
(1, 1, 4, 'Candidat seleccionat per T-Systems'),
(2, 2, 2, 'Entrevista técnica pendent'),
(4, 3, 3, 'Rebutjat per falta de nivell en troncals');

INSERT INTO HISTORIAL_CONTACTES (mitja_contacte, resum, id_enviament) VALUES 
('Email', 'Enviament inicial del CV de Tarek a Indra', 2),
('Telèfon', 'Convocatòria d''entrevista per al proper dimarts', 2);

-- ASSIGNACIONS
INSERT INTO ASSIGNACIONS (data_inici, data_fi, tutor_empresa, estat_conveni, id_alumne, id_empresa) VALUES 
('2024-03-01', '2024-06-30', 'Laura Gómez', 'Signat', 1, 1), 
('2024-04-15', '2024-07-15', 'Marc Sala', 'Pendent', 4, 3);


/*
UPDATE
*/

UPDATE ALUMNES SET telefon = '699000111' WHERE id_alumne = 1;
UPDATE AVALUACIONS SET moduls_troncals = TRUE, puntuacio_global = 7.5 WHERE id_alumne = 3;
UPDATE ENVIAMENTS SET id_estat_env = 4 WHERE id_enviament = 2;
UPDATE ASSIGNACIONS SET estat_conveni = 'Signat' WHERE id_assignacio = 2;


/*
DELETE
*/

DELETE FROM HISTORIAL_CONTACTES WHERE id_contacte = 1;
DELETE FROM DOMINA WHERE id_alumne = 3 AND id_tec = 3;

DELETE FROM ALUMNES WHERE id_alumne = 4; -- DONARIA ERROR 
