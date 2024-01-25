-- Liste des cours de l’étudiant Philippe (on suppose qu’il n’y en a qu’un), en indiquant le nom du professeur et la date.
SELECT prof.nom, c.date
FROM Cours as c,
     Personne as stud,
     Personne as prof
WHERE c.idetudiant = stud.id
  AND stud.nom = 'Philippe'
  AND c.idprofesseur = prof.id;

-- Les personnes qui sont professeur et étudiant
SELECT DISTINCT p.nom
FROM Cours as c1,
     Personne as p
WHERE c1.idetudiant = p.id
  AND EXISTS(SELECT 1 FROM Cours as c2 WHERE c2.idprofesseur = p.id);

-- Les professeurs qui donnent des cours dans une autre langue que leur langue natale
SELECT DISTINCT p.nom
FROM Cours as c,
     Personne as p
WHERE c.idprofesseur = p.id
  AND EXISTS(SELECT 1 WHERE c.codelangue != p.codelanguenatale);

-- Les professeurs qui ne donnent jamais cours dans une autre langue que leur langue natale
SELECT DISTINCT p.nom
FROM Personne as p,
     Cours as c
WHERE c.idprofesseur = p.id
  AND NOT EXISTS(SELECT 1 WHERE c.codelangue != codelanguenatale);

-- Les personnes et les langues qu’elles n’apprennent pas
SELECT DISTINCT p.nom, l.intitulé
FROM personne as p,
     cours as c,
     langue as l
WHERE p.id = c.idetudiant
EXCEPT
SELECT p.nom, l.intitulé
FROM personne as p,
     langue as l,
     cours as c
WHERE p.id = c.idetudiant
  AND c.codelangue = l.code;

-- Donner, pour chaque personne, le nombre de langues qu’elle apprend
SELECT p.nom, count(distinct l)
FROM personne as p,
     langue as l,
     cours as c
WHERE p.id = c.idetudiant
  AND l.code = c.codelangue
GROUP BY p.nom;

-- Donner les langues pour lesquelles on trouve au moins trois personnes dont c’est la langue natale.
SELECT natale.intitulé
FROM (SELECT l.intitulé as intitulé, count(p) as count
      FROM langue as l,
           personne as p
      WHERE p.codelanguenatale = l.code
      GROUP BY l.intitulé) as natale
WHERE natale.count > 2;

-- Test pour la vue Inscription
SELECT p.nom, NULL as codeLangue
FROM personne as p
WHERE p.id NOT IN (SELECT etu.id
                   FROM personne as etu
                            JOIN cours as c ON etu.id = c.idetudiant)
UNION
SELECT p.nom, l.code as codeLangue
FROM personne as p
         JOIN cours as c ON p.id = c.idetudiant JOIN langue as l on c.codelangue = l.code;

-- Manipulation de la vue
SELECT * FROM inscription;
SELECT DISTINCT nom FROM inscription WHERE codelangue IS NULL;
