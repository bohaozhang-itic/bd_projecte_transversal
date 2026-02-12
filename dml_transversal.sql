-- UPDATE
-- 1. TAULES MESTRES
INSERT INTO CICLE (id_cicle, nom_cicle) VALUES 
(1, 'ASIR'), (2, 'DAM'), (3, 'DAW');

INSERT INTO TECNOLOGIA (id_tec, nom_tec) VALUES 
(1, 'Linux'), (2, 'SQL'), (3, 'Java'), (4, 'React'), (5, 'Docker'), 
(6, 'AWS'), (7, 'Python'), (8, 'C#'), (9, 'PHP'), (10, 'JavaScript');

INSERT INTO ESTAT_ENVIAMENT (id_estat_env, descripcio) VALUES 
(1, 'Enviat'), (2, 'Vist'), (3, 'Entrevista'), (4, 'Rebutjat'), (5, 'Acceptat');

-- 2. EMPRESES
INSERT INTO EMPRESA (id_empresa, cif, nom_empresa, sector, ubicacio, contacte, dual_intensiva, dual_general) VALUES 
(1, 'A12345678', 'T-Systems', 'Tecnologia', '22@ Barcelona', 'rrhh@t-systems.com', TRUE, FALSE),
(2, 'B87654321', 'Indra', 'Consultoria', 'Barcelona', 'talento@indra.es', FALSE, TRUE),
(3, 'C99887766', 'Bitpanda', 'Fintech', 'Poblenou', 'jobs@bitpanda.com', TRUE, TRUE),
(4, 'D11111111', 'Seidor', 'IT Services', 'Vic', 'hr@seidor.com', TRUE, TRUE),
(5, 'E22222222', 'Accenture', 'Consultoria', 'Sabadell', 'recruitment@accenture.com', FALSE, TRUE),
(6, 'F33333333', 'Privalia', 'Ecommerce', 'Barcelona', 'it-jobs@privalia.com', TRUE, FALSE),
(7, 'G44444444', 'Glovo', 'Logistica', 'Barcelona', 'careers@glovo.com', TRUE, TRUE),
(8, 'H55555555', 'SocialPoint', 'Videojocs', 'Barcelona', 'talent@socialpoint.com', TRUE, FALSE),
(9, 'I66666666', 'GFT', 'Banca', 'Sant Cugat', 'hr@gft.com', FALSE, TRUE),
(10, 'J77777777', 'Wallapop', 'Ecommerce', 'Barcelona', 'jobs@wallapop.com', TRUE, TRUE);

-- 3. ALUMNES
INSERT INTO ALUMNE (id_alumne, nom, cognoms, email, telefon, nass, promocio, id_cicle) VALUES 
(1, 'Miquel', 'Molina', 'miquel@iticbcn.cat', '600111222', 'NASS01', '2023-2024', 1),
(2, 'Tarek', 'Haddad', 'tarek@iticbcn.cat', '600333444', 'NASS02', '2023-2024', 3),
(3, 'Adam', 'Sba', 'adam@iticbcn.cat', '600555666', 'NASS03', '2023-2024', 2),
(4, 'Eric', 'Grau', 'eric@iticbcn.cat', '600777888', 'NASS04', '2023-2024', 1),
(5, 'Sonia', 'Perez', 'sonia@iticbcn.cat', '600000005', 'NASS05', '2023-2024', 2),
(6, 'Joan', 'Rius', 'joan@iticbcn.cat', '600000006', 'NASS06', '2023-2024', 3),
(7, 'Maria', 'Gisbert', 'maria@iticbcn.cat', '600000007', 'NASS07', '2023-2024', 1),
(8, 'Pau', 'Lopez', 'pau@iticbcn.cat', '600000008', 'NASS08', '2023-2024', 2),
(9, 'Laia', 'Sanz', 'laia@iticbcn.cat', '600000009', 'NASS09', '2023-2024', 3),
(10, 'Marc', 'Vila', 'marc@iticbcn.cat', '600000010', 'NASS10', '2023-2024', 2),
(11, 'Anna', 'Duran', 'anna@iticbcn.cat', '600000011', 'NASS11', '2023-2024', 1),
(12, 'Jordi', 'Cases', 'jordi@iticbcn.cat', '600000012', 'NASS12', '2023-2024', 3),
(13, 'Carla', 'Bosch', 'carla@iticbcn.cat', '600000013', 'NASS13', '2023-2024', 2),
(14, 'Oriol', 'Mas', 'oriol@iticbcn.cat', '600000014', 'NASS14', '2023-2024', 1),
(15, 'Marta', 'Font', 'marta@iticbcn.cat', '600000015', 'NASS15', '2023-2024', 3),
(16, 'Albert', 'Roig', 'albert@iticbcn.cat', '600000016', 'NASS16', '2023-2024', 2),
(17, 'Elena', 'Soler', 'elena@iticbcn.cat', '600000017', 'NASS17', '2023-2024', 1),
(18, 'Pol', 'Serra', 'pol@iticbcn.cat', '600000018', 'NASS18', '2023-2024', 3),
(19, 'Eva', 'Gual', 'eva@iticbcn.cat', '600000019', 'NASS19', '2023-2024', 2),
(20, 'Ramon', 'Pons', 'ramon@iticbcn.cat', '600000020', 'NASS20', '2023-2024', 1);

-- 4. AVALUACIONS
INSERT INTO AVALUACIO (id_avaluacio, puntuacio_global, actitud, autonomia, comunicacio, treball_equip, puntualitat, nivell_tecnic, ipo_aprovat, moduls_troncals, id_alumne) VALUES 
(1, 9.8, 10, 10, 9, 10, 10, 10, TRUE, TRUE, 1),
(2, 8.5, 9, 8, 9, 8, 9, 8, TRUE, TRUE, 2),
(3, 7.2, 7, 7, 8, 7, 7, 7, TRUE, TRUE, 3),
(4, 4.5, 5, 4, 5, 4, 5, 4, FALSE, FALSE, 4),
(5, 9.2, 9, 9, 10, 9, 9, 9, TRUE, TRUE, 5),
(6, 6.0, 6, 6, 6, 6, 6, 6, TRUE, TRUE, 6),
(7, 8.8, 9, 8, 9, 9, 9, 9, TRUE, TRUE, 7),
(8, 9.5, 10, 9, 10, 9, 10, 9, TRUE, TRUE, 8),
(9, 3.0, 3, 3, 4, 3, 3, 2, FALSE, FALSE, 9),
(10, 7.9, 8, 8, 8, 8, 7, 8, TRUE, TRUE, 10),
(11, 8.1, 8, 8, 8, 8, 8, 8, TRUE, TRUE, 11),
(12, 5.5, 5, 6, 5, 6, 5, 6, TRUE, FALSE, 12),
(13, 9.9, 10, 10, 10, 10, 10, 9, TRUE, TRUE, 13),
(14, 6.8, 7, 6, 7, 7, 7, 6, TRUE, TRUE, 14),
(15, 7.5, 8, 7, 8, 7, 8, 7, TRUE, TRUE, 15),
(16, 8.3, 8, 9, 8, 8, 8, 8, TRUE, TRUE, 16),
(17, 9.0, 9, 9, 9, 9, 9, 9, TRUE, TRUE, 17),
(18, 4.0, 4, 4, 4, 4, 4, 4, FALSE, FALSE, 18),
(19, 7.1, 7, 7, 7, 7, 7, 7, TRUE, TRUE, 19),
(20, 6.5, 6, 7, 6, 7, 6, 6, TRUE, TRUE, 20);

-- 5. CURRICULUMS
INSERT INTO CURRICULUM (id_cv, resum, ruta_enllac, id_alumne) VALUES 
(1, 'CV Miquel - Linux', '/cv/m1.pdf', 1), 
(2, 'CV Tarek - Fullstack', '/cv/t1.pdf', 2),
(3, 'CV Tarek - Frontend', '/cv/t2.pdf', 2), 
(4, 'CV Adam - DAM', '/cv/a1.pdf', 3),
(5, 'CV Sonia - Java', '/cv/s1.pdf', 5), 
(6, 'CV Maria - Cloud', '/cv/m2.pdf', 7),
(7, 'CV Pau - SQL', '/cv/p1.pdf', 8), 
(8, 'CV Marc - Android', '/cv/m3.pdf', 10),
(9, 'CV Anna - Networking', '/cv/a2.pdf', 11), 
(10, 'CV Carla - React', '/cv/c1.pdf', 13),
(11, 'CV Elena - DevOps', '/cv/e1.pdf', 17), 
(12, 'CV Pol - Systems', '/cv/p2.pdf', 18);

-- 6. ENVIAMENTS
INSERT INTO ENVIAMENT (id_enviament, id_cv, id_empresa, id_estat_env, data_enviament, notes) VALUES 
(1, 1, 1, 5, '2024-02-01', 'Acceptat ràpid'), 
(2, 2, 2, 3, '2024-02-05', 'Pendent entrevista'),
(3, 3, 3, 1, '2024-02-10', 'Enviat inicial'), 
(4, 4, 4, 2, '2024-02-12', 'Vist'),
(5, 5, 2, 5, '2024-02-15', 'Acceptada Sonia'), 
(6, 6, 5, 4, '2024-02-16', 'Rebutjat per distància'),
(7, 7, 1, 5, '2024-02-18', 'Pau acceptat'), 
(8, 8, 6, 1, '2024-02-20', 'Sense resposta'),
(9, 9, 7, 3, '2024-02-21', 'Cita dimarts'), 
(10, 10, 3, 5, '2024-02-22', 'Carla acceptada'),
(11, 1, 4, 1, '2024-01-05', 'Enviat antic'), 
(12, 2, 1, 4, '2024-01-06', 'Rebutjat per T-Systems'),
(13, 4, 8, 3, '2024-01-10', 'Interès en DAM'), 
(14, 5, 9, 1, '2024-01-12', 'Enviat a GFT'),
(15, 6, 10, 5, '2024-01-15', 'Maria a Wallapop'), 
(16, 7, 2, 1, '2024-01-18', 'Sense resposta Indra'),
(17, 8, 3, 1, '2024-01-20', 'Candidatura activa'), 
(18, 9, 4, 5, '2024-01-22', 'Anna acceptada'),
(19, 10, 5, 1, '2024-01-25', 'Pendent de revisar'), 
(20, 11, 1, 5, '2024-01-28', 'Elena seleccionada'),
(21, 1, 8, 1, '2024-01-15', 'Enviat a SocialPoint'), 
(22, 2, 6, 1, '2024-01-16', 'Sense noticies Privalia'),
(23, 4, 7, 1, '2024-01-17', 'Sense noticies Glovo'), 
(24, 5, 10, 1, '2024-01-18', 'Interès futur'),
(25, 6, 8, 1, '2024-01-19', 'Enviat'), 
(26, 7, 9, 1, '2024-01-20', 'GFT pendent'),
(27, 8, 2, 1, '2024-01-21', 'Indra pendent'), 
(28, 9, 3, 1, '2024-01-22', 'Bitpanda pendent'),
(29, 10, 1, 1, '2024-01-23', 'T-Systems pendent'), 
(30, 11, 4, 1, '2024-01-24', 'Seidor pendent');

-- 7. ASSIGNACIONS
INSERT INTO ASSIGNACIO (id_assignacio, data_inici, data_fi, tutor_empresa, estat_conveni, id_alumne, id_empresa) VALUES 
(1, '2024-03-01', '2024-06-30', 'Laura G.', 'Confirmada', 1, 1),
(2, '2024-03-15', '2024-07-15', 'Marc S.', 'Confirmada', 5, 2),
(3, '2024-04-01', '2024-08-01', 'Anna B.', 'Confirmada', 8, 1),
(4, '2024-04-01', '2024-08-01', 'Jordi X.', 'Proposada', 13, 3),
(5, '2024-03-01', '2024-06-30', 'Elena M.', 'Confirmada', 7, 10),
(6, '2024-04-15', '2024-08-15', 'Lluc P.', 'Confirmada', 11, 4),
(7, '2024-03-10', '2024-07-10', 'Rosa F.', 'Finalitzada', 17, 1),
(8, '2024-05-01', '2024-09-01', 'Pere T.', 'Proposada', 3, 4),
(9, '2024-03-01', '2024-06-01', 'Carla R.', 'Cancel·lada', 2, 2),
(10, '2024-03-20', '2024-07-20', 'Santi V.', 'Confirmada', 10, 3);

-- 8. TAULES INTERMÈDIES
INSERT INTO DOMINA (id_alumne, id_tec, nivell) VALUES 
(1, 1, 'Avançat'), (1, 5, 'Mitjà'), (2, 3, 'Avançat'), (2, 10, 'Avançat'), (3, 3, 'Mitjà');

INSERT INTO SOLLICITA (id_empresa, id_tec) VALUES (1, 1), (1, 6), (2, 3), (3, 4), (10, 10);

INSERT INTO PREFEREIX (id_empresa, id_cicle) VALUES (1, 1), (2, 2), (3, 3);




-- UPDATE
UPDATE ALUMNE SET telefon = '699887766', email = 'miquel.molina.new@iticbcn.cat' WHERE id_alumne = 1;
UPDATE AVALUACIO SET puntuacio_global = 7.5, nivell_tecnic = 7, moduls_troncals = TRUE WHERE id_alumne = 12;
UPDATE EMPRESA SET dual_intensiva = TRUE WHERE sector = 'Tecnologia';

-- DELETE
DELETE FROM DOMINA WHERE id_alumne = 3 AND id_tec = 3;
DELETE FROM HISTORIAL_CONTACTE WHERE id_enviament = 11;
DELETE FROM ALUMNE WHERE id_alumne = 18;