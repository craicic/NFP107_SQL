/* Sur notre base des voyageurs en ligne (ou sur la vôtre, après installation d’un SGBD et chargement de nos scripts),
   vous devez exprimer les requêtes suivantes: */

-- Nom des villes
select v.ville from voyageur as v;

-- Nom des logements en Bretagne
select l.nom
from logement as l
where l.lieu = 'Bretagne';

-- Nom des logements dont la capacité est inférieure à 20
select l.nom from logement as l where l.capacité < 20;

-- Description des activités de plongée
select a.description from activité as a where a.codeactivité = 'Plongée';

-- Nom des logements avec piscine
select l.nom from logement as l, activité as a
where l.code = a.codelogement and a.codeactivité = 'Piscine';

-- Nom des voyageurs qui sont allés en Corse
select distinct v.nom from voyageur as v, logement as l, séjour as s
where s.idvoyageur = v.idvoyageur and s.codelogement = l.code
and l.lieu = 'Corse';

-- Les voyageurs qui sont allés ailleurs qu’en Corse
select distinct v.nom from voyageur as v, logement as l, séjour as s
where s.idvoyageur = v.idvoyageur and s.codelogement = l.code
and l.lieu != 'Corse';

-- Nom des logements visités par un auvergnat
select l.nom from logement as l, voyageur as v, séjour as s
where s.idvoyageur = v.idvoyageur and s.codelogement = l.code
and v.ville = 'Aurillac';

-- Nom des logements et des voyageurs situés dans la même région
select distinct l.nom from logement as l, voyageur as v, séjour as s
where s.idvoyageur = v.idvoyageur and s.codelogement = l.code
and v.région = l.lieu;

-- Les paires de voyageurs (donner les noms) qui ont séjourné dans le même logement
select distinct v1.nom, v2.nom from logement as l, voyageur as v1, voyageur as v2, séjour as s1, séjour as s2
where s1.idvoyageur = v1.idvoyageur and s2.idvoyageur = v2.idvoyageur and s1.codelogement = l.code and s2.codelogement = l.code;
-- Les voyageurs qui sont allés (au moins) deux fois dans le même logement

-- Les logements qui ont reçu (au moins) deux voyageurs différents

/* Contrainte: n’utilisez pas l’imbrication, pour aucune requête ( et forcez-vous à utiliser la forme déclarative,
même si vous connaissez d’autres options que nous étudierons dans le prochain chapitre). */

-- Pour les requêtes suivantes, en revanche, vous avez droit à l’imbrication (il serait difficile de faire autrement).

-- Nom des voyageurs qui ne sont pas allés en Corse

-- Noms des voyageurs qui ne vont qu’en Corse s’ils vont quelque part.

-- Nom des logements sans piscine

-- Nom des voyageurs qui ne sont allés nulle part

-- Les logements où personne n’est allé

-- Les voyageurs qui n’ont jamais eu l’occasion de faire de la plongée

-- Les voyageurs et les logements où ils n’ont jamais séjourné

-- Les logements où tout le monde est allé

/* Vous pouvez finalement reprendre quelques-unes de requêtes précédentes et les exprimer avec l’imbrication. */