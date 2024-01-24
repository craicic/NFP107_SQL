/**
  Schéma de la base
    Film (idFilm, titre, année, genre, résumé, idRéalisateur, codePays)
    Pays (code, nom, langue)
    Artiste (idArtiste, nom, prénom, annéeNaiss)
    Rôle (idFilm, idActeur, nomRôle)
    Internaute (email, nom, prénom, région)
    Notation (email, idFilm, note)

 */

--Suggestions de requêtes.

-- Nom et année de naissance des artistes né́s avant 1950.
select a
from artiste as a
where annéenaiss < 1950;

-- Titre de tous les drames
select f.titre
from film as f
where f.genre = 'Drame';

-- Quels rôles a joué Bruce Willis
select distinct r.nomrôle
from rôle as r
         join artiste as a on r.idacteur = a.idartiste
where a.nom = 'Willis'
  and a.prénom = 'Bruce';

-- Qui est le réalisateur de Memento
select a.prénom, a.nom
from artiste as a
         join film as f on a.idartiste = f.idréalisateur
where f.titre = 'Memento';

-- Quelles sont les notes obtenues par le film Fargo
select n.note
from notation as n,
     film as f
where n.idfilm = f.idfilm
  and f.titre = 'Fargo';

-- Qui a joué le rôle de Chewbacca?
select distinct a.prénom, a.nom
from artiste as a, rôle as r
where a.idartiste = r.idacteur and r.nomrôle = 'Chewbacca';

-- Dans quels films Bruce Willis a-t-il joué́ le role de John McClane ?
select f.titre
    from film as f, artiste as a, rôle as r
where f.idfilm = r.idfilm and r.idacteur = a.idartiste and r.nomrôle = 'John McClane';
-- Nom des acteurs de 'Sueurs froides'
select

-- Quelles sont les films notés par l'internaute Prénom1 Nom1

-- Films dont le réalisateur est Tim Burton, et l’un des acteurs Jonnhy Depp.
-- Titre des films dans lesquels a joué́ Woody Allen. Donner aussi le rôle.
-- Quel metteur en scène a tourné́ dans ses propres films ? Donner le nom, le rôle et le titre des films.
-- Titre des films de Quentin Tarantino dans lesquels il n’a pas joué
-- Quel metteur en scène a tourné́ en tant qu’acteur ? Donner le nom, le rôle et le titre des films dans lesquels cet artiste a joué.
-- Donnez les films de Hitchcock sans James Stewart
-- Dans quels films le réalisateur a-t-il le même pré́nom que l’un des interprètes ? (titre, nom du réalisateur, nom de l’interprète). Le réalisateur et l’interprète ne doivent pas être la même personne.
-- Les films sans rôle
-- Quelles sont les films non notés par l'internaute Prénom1 Nom1
-- Quels acteurs n’ont jamais réalisé de film ?
-- Quelle est la moyenne des notes de Memento
-- id, Nom et prénom des réalisateurs, et nombre de films qu’ils ont tournés.
-- Nom et prénom des réalisateurs qui ont tourné au moins deux films.
-- Quels films ont une moyenne des notes supérieure à 7

