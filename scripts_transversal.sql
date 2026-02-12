
-- 1. Llistat d’alumnes amb puntuació global, ordenat descendent (rànquing).
SELECT 
    a.nom, 
    a.cognoms, 
    ev.puntuacio_global
FROM ALUMNE a
JOIN AVALUACIO ev ON a.id_alumne = ev.id_alumne
ORDER BY ev.puntuacio_global DESC;


-- 2. Top 5 alumnes per puntuació que encara no tenen assignació.
SELECT 
    a.nom, 
    a.cognoms, 
    ev.puntuacio_global
FROM ALUMNE a
JOIN AVALUACIO ev ON a.id_alumne = ev.id_alumne
WHERE a.id_alumne NOT IN (
    SELECT id_alumne 
    FROM ASSIGNACIO 
    WHERE estat_conveni != 'Cancel·lada'
)
ORDER BY ev.puntuacio_global DESC
LIMIT 5;


-- 3. Per cada empresa: nombre de currículums rebuts, i quants estan en estat “entrevista/acceptat”.
SELECT 
    e.nom_empresa,
    COUNT(env.id_enviament) AS total_cvs_rebuts,
    COUNT(CASE WHEN env.id_estat_env IN (3, 5) THEN 1 END) AS cvs_entrevista_o_acceptat
FROM EMPRESA e
LEFT JOIN ENVIAMENT env ON e.id_empresa = env.id_empresa
GROUP BY e.id_empresa, e.nom_empresa
ORDER BY total_cvs_rebuts DESC;


-- 4. Historial d’enviaments d’un alumne (totes les empreses, dates, estat, última versió de CV).
SELECT 
    a.nom,
    e.nom_empresa,
    env.data_enviament,
    est.descripcio AS estat_actual,
    cv.ruta_enllac AS fitxer_cv
FROM ALUMNE a
JOIN CURRICULUM cv ON a.id_alumne = cv.id_alumne
JOIN ENVIAMENT env ON cv.id_cv = env.id_cv
JOIN EMPRESA e ON env.id_empresa = e.id_empresa
JOIN ESTAT_ENVIAMENT est ON env.id_estat_env = est.id_estat_env
WHERE a.id_alumne = 2
ORDER BY env.data_enviament DESC;


-- 5. Alumnes amb més de X enviaments sense resposta (estat “enviat” i han passat N dies), N=15 dies.
SELECT 
    a.nom, 
    a.cognoms, 
    COUNT(env.id_enviament) AS enviaments_sense_resposta
FROM ALUMNE a
JOIN CURRICULUM cv ON a.id_alumne = cv.id_alumne
JOIN ENVIAMENT env ON cv.id_cv = env.id_cv
WHERE env.id_estat_env = 1 -- ID 1 = 'Enviat' segons el DML
  AND env.data_enviament < CURRENT_DATE - 15
GROUP BY a.id_alumne, a.nom, a.cognoms
HAVING COUNT(env.id_enviament) > 0;


-- 6. Informe d’assignacions actives: alumne + empresa + dates + tutor.
SELECT 
    a.nom AS alumne,
    e.nom_empresa AS empresa,
    ass.data_inici,
    ass.data_fi,
    ass.tutor_empresa,
    ass.estat_conveni
FROM ASSIGNACIO ass
JOIN ALUMNE a ON ass.id_alumne = a.id_alumne
JOIN EMPRESA e ON ass.id_empresa = e.id_empresa
WHERE ass.estat_conveni NOT IN ('Cancel·lada', 'Finalitzada')
ORDER BY ass.data_inici ASC;


-- 7. Consulta que detecti inconsistències: alumnes amb assignació però sense cap enviament “acceptat” prèviament.
SELECT 
    a.nom, 
    a.cognoms, 
    e.nom_empresa AS empresa_assignada
FROM ASSIGNACIO ass
JOIN ALUMNE a ON ass.id_alumne = a.id_alumne
JOIN EMPRESA e ON ass.id_empresa = e.id_empresa
WHERE NOT EXISTS (
    SELECT 1 
    FROM ENVIAMENT env
    JOIN CURRICULUM cv ON env.id_cv = cv.id_cv
    WHERE cv.id_alumne = ass.id_alumne 
      AND env.id_empresa = ass.id_empresa
      AND env.id_estat_env = 5 -- ID 5 = 'Acceptat' segons el DML
);


-- 8. Alumnes actius amb puntuació global superior a 7, mostrant també la mitjana global.
SELECT 
    a.nom, 
    a.cognoms, 
    ev.puntuacio_global,
    (SELECT AVG(puntuacio_global) FROM AVALUACIO) AS mitjana_global
FROM ALUMNE a
JOIN AVALUACIO ev ON a.id_alumne = ev.id_alumne
WHERE a.estat_actiu = TRUE 
  AND ev.puntuacio_global > 7.0;


-- 9. Empreses d’un sector concret (per exemple, ‘Tecnologia’) que no han rebut cap enviament.
SELECT 
    e.nom_empresa, 
    e.sector, 
    e.contacte
FROM EMPRESA e
LEFT JOIN ENVIAMENT env ON e.id_empresa = env.id_empresa
WHERE e.sector = 'Tecnologia' 
  AND env.id_enviament IS NULL;