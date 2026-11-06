-- MAW11 Looper : données fictives pour une démonstration
-- Exécuter APRÈS le schéma fourni, sur la même connexion pour tout ce fichier.
-- Ce script ajoute des données : aucune suppression, aucun changement du schéma.
-- Exécuter UNE SEULE FOIS : une nouvelle exécution ajoutera un autre jeu de démo.
-- Les identifiants sont récupérés par LAST_INSERT_ID(), même si la base contient déjà des données.
-- Types utilisés : single_line et multi_line (à faire correspondre aux types reconnus par l'application).
-- answers.status est généré : il ne doit jamais être renseigné dans les INSERT.
--
-- Convention de démonstration : les réponses d'une même tentative ont exactement
-- le même answer_datetime ; chaque tentative reçoit une date/heure distincte.
-- Le schéma ne contient pas de take_id : cette convention ne crée pas de vraie
-- relation de tentative et doit correspondre au regroupement utilisé dans l'application.
--
-- Parcours suggéré :
-- 1. Ruby : afficher plusieurs tentatives, puis les réponses à un même champ.
-- 2. Ruby : ouvrir une réponse existante et modifier son contenu.
-- 3. Ruby : comparer une réponse courte, longue et vide.
-- 4. SQL : consulter un exercice Closed.
-- 5. Bilan : compléter un exercice Answering.
-- 6. HTML : compléter les champs d'un exercice Building sans réponse.
--
SET NAMES utf8mb4;
USE MAW11_Looper_RGK;
START TRANSACTION;

-- Exercice 1 : Révision Ruby et MVC (Answering)
INSERT INTO forms (name, status) VALUES ('Révision Ruby et MVC', 'Answering');
SET @demo_form_1 = LAST_INSERT_ID();

INSERT INTO fields (label, type, form_id) VALUES ('Quel mot-clé définit une fonction ?', 'single_line', @demo_form_1);
SET @demo_field_1_1 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Citer deux responsabilités du modèle', 'single_line', @demo_form_1);
SET @demo_field_1_2 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Expliquer le rôle du contrôleur', 'multi_line', @demo_form_1);
SET @demo_field_1_3 = LAST_INSERT_ID();

-- Tentative 1 de cet exercice : 2026-10-29 09:01:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('def', '2026-10-29 09:01:00', @demo_field_1_1),
    ('Accès aux données et règles métier', '2026-10-29 09:01:00', @demo_field_1_2),
    ('Le contrôleur reçoit la requête, récupère les paramètres, appelle les fonctions du modèle et transmet les données nécessaires à la vue pour construire la réponse.', '2026-10-29 09:01:00', @demo_field_1_3);

-- Tentative 2 de cet exercice : 2026-10-29 09:02:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('def', '2026-10-29 09:02:00', @demo_field_1_1),
    ('Lire et enregistrer les données', '2026-10-29 09:02:00', @demo_field_1_2),
    ('Il fait le lien entre la requête et le modèle.', '2026-10-29 09:02:00', @demo_field_1_3);

-- Tentative 3 de cet exercice : 2026-10-29 09:03:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('function', '2026-10-29 09:03:00', @demo_field_1_1),
    ('Afficher le HTML et choisir les couleurs', '2026-10-29 09:03:00', @demo_field_1_2),
    ('Le contrôleur contient toute la mise en page.', '2026-10-29 09:03:00', @demo_field_1_3);

-- Tentative 4 de cet exercice : 2026-10-29 09:04:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('def', '2026-10-29 09:04:00', @demo_field_1_1),
    ('Validation et accès à la base de données', '2026-10-29 09:04:00', @demo_field_1_2),
    ('Il analyse la demande de l''utilisateur, déclenche le traitement adapté et fournit à la vue les données à afficher, sans construire lui-même la présentation HTML.', '2026-10-29 09:04:00', @demo_field_1_3);

-- Tentative 5 de cet exercice : 2026-10-29 09:05:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('def', '2026-10-29 09:05:00', @demo_field_1_1),
    ('', '2026-10-29 09:05:00', @demo_field_1_2),
    (NULL, '2026-10-29 09:05:00', @demo_field_1_3);

-- Tentative 6 de cet exercice : 2026-10-29 09:06:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('def', '2026-10-29 09:06:00', @demo_field_1_1),
    ('Lire les données', '2026-10-29 09:06:00', @demo_field_1_2),
    ('Je confonds encore les responsabilités du modèle et du contrôleur.', '2026-10-29 09:06:00', @demo_field_1_3);

-- Exercice 2 : Révision SQL (Closed)
INSERT INTO forms (name, status) VALUES ('Révision SQL', 'Closed');
SET @demo_form_2 = LAST_INSERT_ID();

INSERT INTO fields (label, type, form_id) VALUES ('Quel mot-clé filtre les lignes ?', 'single_line', @demo_form_2);
SET @demo_field_2_1 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Quel JOIN garde toute la table de gauche ?', 'single_line', @demo_form_2);
SET @demo_field_2_2 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Expliquer le rôle d''une clé étrangère', 'multi_line', @demo_form_2);
SET @demo_field_2_3 = LAST_INSERT_ID();

-- Tentative 1 de cet exercice : 2026-10-29 09:07:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('WHERE', '2026-10-29 09:07:00', @demo_field_2_1),
    ('LEFT JOIN', '2026-10-29 09:07:00', @demo_field_2_2),
    ('Une clé étrangère relie une ligne à une ligne existante d''une autre table. Elle assure la cohérence des références et empêche de créer des relations vers des données inexistantes.', '2026-10-29 09:07:00', @demo_field_2_3);

-- Tentative 2 de cet exercice : 2026-10-29 09:08:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('WHERE', '2026-10-29 09:08:00', @demo_field_2_1),
    ('LEFT JOIN', '2026-10-29 09:08:00', @demo_field_2_2),
    ('Elle assure le lien avec une autre table.', '2026-10-29 09:08:00', @demo_field_2_3);

-- Tentative 3 de cet exercice : 2026-10-29 09:09:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('HAVING', '2026-10-29 09:09:00', @demo_field_2_1),
    ('INNER JOIN', '2026-10-29 09:09:00', @demo_field_2_2),
    ('Elle identifie chaque ligne de manière unique.', '2026-10-29 09:09:00', @demo_field_2_3);

-- Tentative 4 de cet exercice : 2026-10-29 09:10:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('WHERE', '2026-10-29 09:10:00', @demo_field_2_1),
    ('LEFT JOIN', '2026-10-29 09:10:00', @demo_field_2_2),
    ('Dans cette base, fields.form_id référence forms.id : chaque champ appartient à un formulaire existant. La suppression du formulaire supprime aussi ses champs grâce à ON DELETE CASCADE.', '2026-10-29 09:10:00', @demo_field_2_3);

-- Exercice 3 : Bilan de la séance (Answering)
INSERT INTO forms (name, status) VALUES ('Bilan de la séance', 'Answering');
SET @demo_form_3 = LAST_INSERT_ID();

INSERT INTO fields (label, type, form_id) VALUES ('Sujet préféré', 'single_line', @demo_form_3);
SET @demo_field_3_1 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Difficulté ressentie sur 5', 'single_line', @demo_form_3);
SET @demo_field_3_2 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Commentaire et piste d''amélioration', 'multi_line', @demo_form_3);
SET @demo_field_3_3 = LAST_INSERT_ID();

-- Tentative 1 de cet exercice : 2026-10-29 09:11:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('Ruby', '2026-10-29 09:11:00', @demo_field_3_1),
    ('2', '2026-10-29 09:11:00', @demo_field_3_2),
    ('Les exemples étaient clairs. J''aimerais maintenant travailler sur un exercice complet avec une route, un modèle et une vue pour mieux comprendre le passage des données entre les fichiers.', '2026-10-29 09:11:00', @demo_field_3_3);

-- Tentative 2 de cet exercice : 2026-10-29 09:12:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('SQL', '2026-10-29 09:12:00', @demo_field_3_1),
    ('3', '2026-10-29 09:12:00', @demo_field_3_2),
    ('Prévoir un exemple supplémentaire sur les jointures.', '2026-10-29 09:12:00', @demo_field_3_3);

-- Tentative 3 de cet exercice : 2026-10-29 09:13:00
INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES
    ('MVC', '2026-10-29 09:13:00', @demo_field_3_1),
    ('4', '2026-10-29 09:13:00', @demo_field_3_2),
    ('', '2026-10-29 09:13:00', @demo_field_3_3);

-- Exercice 4 : Prochain exercice HTML (Building)
INSERT INTO forms (name, status) VALUES ('Prochain exercice HTML', 'Building');
SET @demo_form_4 = LAST_INSERT_ID();

INSERT INTO fields (label, type, form_id) VALUES ('Balise utilisée pour un lien', 'single_line', @demo_form_4);
SET @demo_field_4_1 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Rôle de l''attribut alt', 'multi_line', @demo_form_4);
SET @demo_field_4_2 = LAST_INSERT_ID();
INSERT INTO fields (label, type, form_id) VALUES ('Expliquer une media query', 'multi_line', @demo_form_4);
SET @demo_field_4_3 = LAST_INSERT_ID();

COMMIT;

-- Contrôle limité aux formulaires insérés par cette exécution.
-- Attendu : 4 formulaires, 12 champs, 13 tentatives conventionnelles, 39 réponses.
SELECT f.name, f.status,
       COUNT(DISTINCT fld.id) AS nombre_champs,
       COUNT(DISTINCT a.answer_datetime) AS nombre_tentatives,
       COUNT(a.id) AS nombre_reponses
FROM forms AS f
LEFT JOIN fields AS fld ON fld.form_id = f.id
LEFT JOIN answers AS a ON a.field_id = fld.id
WHERE f.id IN (@demo_form_1, @demo_form_2, @demo_form_3, @demo_form_4)
GROUP BY f.id, f.name, f.status
ORDER BY f.id;

-- Statuts générés attendus : empty = 3, answered = 31, answered_long = 5.
SELECT a.status, COUNT(*) AS nombre
FROM answers AS a
JOIN fields AS fld ON fld.id = a.field_id
WHERE fld.form_id IN (@demo_form_1, @demo_form_2, @demo_form_3, @demo_form_4)
GROUP BY a.status;
