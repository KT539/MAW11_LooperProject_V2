
USE MAW11_Looper_RGK;

-- ==========================================
-- 1. FORMS
-- ==========================================

INSERT INTO forms (id, name, status) VALUES
                                         (1, 'Satisfaction cafeteria', 'building'),
                                         (2, 'Inscription evenement', 'building'),
                                         (3, 'Evaluation des cours', 'building'),

                                         (4, 'Sondage transports', 'answering'),
                                         (5, 'Retour formation', 'answering'),
                                         (6, 'Habitudes numeriques', 'answering'),

                                         (7, 'Satisfaction entreprise', 'closed'),
                                         (8, 'Evaluation restaurant', 'closed'),
                                         (9, 'Enquete teletravail', 'closed');


-- ==========================================
-- 2. FIELDS
-- ==========================================

-- BUILDING : champs sans aucune reponse

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (1, 'Votre nom', 'text', 1),
                                                  (2, 'Qualite des repas', 'select', 1),
                                                  (3, 'Suggestions', 'textarea', 1),

                                                  (4, 'Nom du participant', 'text', 2),
                                                  (5, 'Adresse email', 'email', 2),
                                                  (6, 'Nombre de participants', 'number', 2),

                                                  (7, 'Nom du cours', 'text', 3),
                                                  (8, 'Note du cours', 'number', 3),
                                                  (9, 'Commentaires', 'textarea', 3);


-- ANSWERING : formulaires en cours de remplissage

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (10, 'Moyen de transport', 'select', 4),
                                                  (11, 'Distance quotidienne en km', 'number', 4),
                                                  (12, 'Avis sur les transports', 'textarea', 4),

                                                  (13, 'Nom de la formation', 'text', 5),
                                                  (14, 'Note sur 10', 'number', 5),
                                                  (15, 'Points a ameliorer', 'textarea', 5),

                                                  (16, 'Heures ecran par jour', 'number', 6),
                                                  (17, 'Application favorite', 'text', 6),
                                                  (18, 'Impact du numerique', 'textarea', 6);


-- CLOSED : formulaires termines

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (19, 'Departement', 'select', 7),
                                                  (20, 'Satisfaction generale', 'number', 7),
                                                  (21, 'Commentaires', 'textarea', 7),

                                                  (22, 'Plat commande', 'text', 8),
                                                  (23, 'Note du repas', 'number', 8),
                                                  (24, 'Avis sur le restaurant', 'textarea', 8),

                                                  (25, 'Jours a domicile', 'number', 9),
                                                  (26, 'Productivite ressentie', 'select', 9),
                                                  (27, 'Avantages du teletravail', 'textarea', 9);


-- ==========================================
-- 3. ANSWERS : ANSWERING
-- ==========================================

-- FORM 4 : Sondage transports

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('Train', '2026-10-01 08:30:00', 10),
                                                ('Voiture', '2026-10-01 09:15:00', 10),
                                                ('Velo', '2026-10-02 10:00:00', 10),

                                                ('25', '2026-10-01 08:30:00', 11),
                                                ('12', '2026-10-01 09:15:00', 11),
                                                (NULL, NULL, 11),

                                                ('Les transports publics sont pratiques.', '2026-10-01 08:30:00', 12),
                                                ('Je trouve que les transports publics sont souvent trop chers et que les correspondances ne sont pas toujours adaptees aux horaires de travail.', '2026-10-01 09:15:00', 12),
                                                (NULL, NULL, 12);


-- FORM 5 : Retour formation

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('Developpement web', '2026-10-02 11:00:00', 13),
                                                ('Bases de donnees', '2026-10-02 14:00:00', 13),
                                                ('Reseaux informatiques', '2026-10-03 09:00:00', 13),

                                                ('9', '2026-10-02 11:00:00', 14),
                                                ('7', '2026-10-02 14:00:00', 14),
                                                (NULL, NULL, 14),

                                                ('Davantage de travaux pratiques.', '2026-10-02 11:00:00', 15),
                                                ('Le contenu est interessant mais certains sujets sont presentes trop rapidement. Il serait utile de consacrer plus de temps aux exercices et aux demonstrations.', '2026-10-02 14:00:00', 15),
                                                ('', NULL, 15);


-- FORM 6 : Habitudes numeriques

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('6', '2026-10-03 10:00:00', 16),
                                                ('8', '2026-10-03 10:30:00', 16),
                                                ('4', '2026-10-04 11:00:00', 16),

                                                ('YouTube', '2026-10-03 10:00:00', 17),
                                                ('Discord', '2026-10-03 10:30:00', 17),
                                                (NULL, NULL, 17),

                                                ('Le numerique facilite mon travail.', '2026-10-03 10:00:00', 18),
                                                ('Les outils numeriques permettent de communiquer rapidement et de travailler efficacement, mais ils peuvent aussi devenir une source de distraction importante au quotidien.', '2026-10-03 10:30:00', 18),
                                                (NULL, NULL, 18);


-- ==========================================
-- 4. ANSWERS : CLOSED
-- ==========================================

-- FORM 7 : Satisfaction entreprise

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('Informatique', '2026-09-15 08:00:00', 19),
                                                ('Marketing', '2026-09-15 09:00:00', 19),
                                                ('Ressources humaines', '2026-09-16 10:00:00', 19),

                                                ('9', '2026-09-15 08:00:00', 20),
                                                ('7', '2026-09-15 09:00:00', 20),
                                                ('8', '2026-09-16 10:00:00', 20),

                                                ('Tres bonne ambiance de travail.', '2026-09-15 08:00:00', 21),
                                                ('Les conditions de travail sont globalement satisfaisantes, mais une meilleure communication entre les differents departements permettrait de simplifier les projets communs.', '2026-09-15 09:00:00', 21),
                                                ('Entreprise agreable et dynamique.', '2026-09-16 10:00:00', 21);


-- FORM 8 : Evaluation restaurant

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('Pizza margherita', '2026-09-18 12:30:00', 22),
                                                ('Burger vegetarien', '2026-09-18 13:00:00', 22),
                                                ('Risotto aux champignons', '2026-09-19 19:30:00', 22),

                                                ('9', '2026-09-18 12:30:00', 23),
                                                ('8', '2026-09-18 13:00:00', 23),
                                                ('10', '2026-09-19 19:30:00', 23),

                                                ('Repas excellent et service rapide.', '2026-09-18 12:30:00', 24),
                                                ('Le restaurant propose des plats de bonne qualite et le personnel est accueillant. Les prix restent cependant assez eleves pour une visite reguliere.', '2026-09-18 13:00:00', 24),
                                                ('Tres bonne experience, je recommande.', '2026-09-19 19:30:00', 24);


-- FORM 9 : Enquete teletravail

INSERT INTO answers
(answer_content, answer_datetime, field_id) VALUES
                                                ('2', '2026-09-20 09:00:00', 25),
                                                ('3', '2026-09-20 10:00:00', 25),
                                                ('4', '2026-09-21 11:00:00', 25),

                                                ('Meilleure', '2026-09-20 09:00:00', 26),
                                                ('Identique', '2026-09-20 10:00:00', 26),
                                                ('Meilleure', '2026-09-21 11:00:00', 26),

                                                ('Moins de temps dans les transports.', '2026-09-20 09:00:00', 27),
                                                ('Le teletravail permet de mieux organiser sa journee et de reduire les deplacements. Il offre aussi un environnement calme qui facilite la concentration sur les taches complexes.', '2026-09-20 10:00:00', 27),
                                                ('Meilleur equilibre entre vie privee et travail.', '2026-09-21 11:00:00', 27);
