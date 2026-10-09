
USE MAW11_Looper_RGK;

-- ==========================================
-- 1. FORMS
-- ==========================================

INSERT INTO forms (id, name, status) VALUES
                                         (1, 'Satisfaction cafeteria', 'Building'),
                                         (2, 'Inscription evenement', 'Building'),
                                         (3, 'Evaluation des cours', 'Building'),

                                         (4, 'Sondage transports', 'Answering'),
                                         (5, 'Retour formation', 'Answering'),
                                         (6, 'Habitudes numeriques', 'Answering'),

                                         (7, 'Satisfaction entreprise', 'Closed'),
                                         (8, 'Evaluation restaurant', 'Closed'),
                                         (9, 'Enquete teletravail', 'Closed');


-- ==========================================
-- 2. FIELDS
-- ==========================================

-- BUILDING : champs sans aucune reponse

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (1, 'Votre nom', 'single_line', 1),
                                                  (2, 'Qualite des repas', 'single_line_list', 1),
                                                  (3, 'Suggestions', 'multi_line', 1),

                                                  (4, 'Nom du participant', 'single_line', 2),
                                                  (5, 'Adresse email', 'single_line', 2),
                                                  (6, 'Nombre de participants', 'single_line', 2),

                                                  (7, 'Nom du cours', 'single_line', 3),
                                                  (8, 'Note du cours', 'single_line', 3),
                                                  (9, 'Commentaires', 'multi_line', 3);


-- ANSWERING : formulaires en cours de remplissage

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (10, 'Moyen de transport', 'single_line_list', 4),
                                                  (11, 'Distance quotidienne en km', 'single_line', 4),
                                                  (12, 'Avis sur les transports', 'multi_line', 4),

                                                  (13, 'Nom de la formation', 'single_line', 5),
                                                  (14, 'Note sur 10', 'single_line', 5),
                                                  (15, 'Points a ameliorer', 'multi_line', 5),

                                                  (16, 'Heures ecran par jour', 'single_line', 6),
                                                  (17, 'Application favorite', 'single_line', 6),
                                                  (18, 'Impact du numerique', 'multi_line', 6);


-- CLOSED : formulaires termines

INSERT INTO fields (id, label, type, form_id) VALUES
                                                  (19, 'Departement', 'single_line_list', 7),
                                                  (20, 'Satisfaction generale', 'single_line', 7),
                                                  (21, 'Commentaires', 'multi_line', 7),

                                                  (22, 'Plat commande', 'single_line', 8),
                                                  (23, 'Note du repas', 'single_line', 8),
                                                  (24, 'Avis sur le restaurant', 'multi_line', 8),

                                                  (25, 'Jours a domicile', 'single_line', 9),
                                                  (26, 'Productivite ressentie', 'single_line_list', 9),
                                                  (27, 'Avantages du teletravail', 'multi_line', 9);


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
