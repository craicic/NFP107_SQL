DROP TABLE IF EXISTS Cours;
DROP TABLE IF EXISTS Personne;
DROP TABLE IF EXISTS Langue;


CREATE TABLE Langue
(
    code     integer not null,
    intitulé varchar not null,
    primary key (code)
);


CREATE TABLE Personne
(
    id               integer not null,
    nom              varchar not null,
    codeLangueNatale integer not null,
    primary key (id),
    foreign key (codeLangueNatale) references Langue (code)
);

CREATE TABLE Cours
(
    id           integer not null,
    idProfesseur integer not null,
    idEtudiant   integer not null,
    date         varchar not null,
    codeLangue   integer not null,
    primary key (id),
    foreign key (idProfesseur) references Personne (id),
    foreign key (idEtudiant) references Personne (id),
    foreign key (codeLangue) references Langue (code)
);

INSERT INTO Langue
VALUES (1, 'FRANCAIS'),
       (2, 'ANGLAIS'),
       (3, 'ITALIEN'),
       (4, 'ALLEMAND');


INSERT INTO Personne
VALUES (1, 'Luca', 2),
       (2, 'Philippe', 1),
       (3, 'Lydia', 1),
       (4, 'Jon', 2),
       (5, 'Felix', 1);

INSERT INTO Cours
VALUES (1, 1, 2, '14-03-2023', 3),
       (2, 2, 3, '15-03-2023', 1),
       (3, 1, 3, '120-03-2023', 3),
       (4, 2, 3, '02-04-2023', 1),
       (5, 1, 3, '06-04-2023', 3),
       (6, 3, 2, '12-04-2023', 2),
       (7, 3, 2, '13-04-2023', 4),
       (8, 4, 1, '17-04-2023', 2);

CREATE OR REPLACE VIEW Inscription AS (
SELECT p.nom, NULL as codeLangue
FROM personne as p
WHERE p.id NOT IN (SELECT etu.id
                   FROM personne as etu
                            JOIN cours as c ON etu.id = c.idetudiant)
UNION
SELECT p.nom, l.code as codeLangue
FROM personne as p
         JOIN cours as c ON p.id = c.idetudiant JOIN langue as l on c.codelangue = l.code);
