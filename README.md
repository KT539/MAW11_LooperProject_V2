# ExerciseLooper

ExerciseLooper est une application web permettant de créer, compléter et gérer des exercices sous forme de formulaires personnalisés.

Le site servant de modèle au projet est disponible ici : https://exercice-looper.mycpnv.ch

Le projet est développé en **Ruby avec Sinatra**, utilise une base de données **MySQL** et suit une architecture **MVC**.

## Technologies utilisées

- **Backend :** Ruby 3.3+, Sinatra 4
- **Frontend :** HTML, CSS, ERB
- **Base de données :** MySQL
- **Dépendances et configuration :** Bundler, dotenv
- **Serveur :** Rack / Puma

## Fonctionnalités

- Création et suppression d'exercices personnalisés.
- Ajout, modification et suppression des champs d'un exercice en cours de création.
- Trois types de champs : texte sur une ligne (`single_line`), liste de lignes (`single_line_list`) et texte multiligne (`multi_line`).
- Gestion des exercices selon trois statuts :
  - `Building` : exercice en cours de création, dont les champs peuvent être modifiés ;
  - `Answering` : exercice accessible pour la saisie des réponses ;
  - `Closed` : exercice clôturé, dont les résultats restent consultables.
- Liste des exercices regroupés par statut.
- Saisie et enregistrement des réponses pour les exercices au statut `Answering`, y compris les réponses laissées vides.
- Consultation des résultats des exercices `Answering` et `Closed`, sous forme d'un tableau par soumission et par question.
- Affichage d'indicateurs distinguant les réponses vides, courtes et longues (plus de 100 caractères).
- Validation des données saisies et stockage dans MySQL.


## Installation

### 1. Prérequis

- Ruby 3.3 ou supérieur
- Bundler
- MySQL

### 2. Installer les dépendances

Depuis la racine du projet :

```bash
bundle config set --local path vendor/bundle
bundle install
```

### 3. Configurer la base de données

Exécuter le script SQL suivant dans MySQL :

`docs/db/db_create.sql`

**Attention :** ce script supprime puis recrée la base `MAW11_Looper_RGK`. Il efface donc les données déjà présentes dans cette base.

Créer ensuite un fichier `.env` à la racine du projet :

```env
DB_HOST=localhost
DB_USERNAME=root
DB_PASSWORD=your_password
DB_DATABASE=MAW11_Looper_RGK
```

Adapter les valeurs à la configuration locale de MySQL.

### 4. Démarrer l'application

Depuis la racine du projet :

```bash
rerun rackup
```

L'application est accessible par défaut à l'adresse : **http://localhost:9292**.

Il est également possible de la lancer sans rechargement automatique :

```bash
rackup
```

## Structure du projet

```text
.
├── backend/
│   ├── config/              # Configuration, connexion MySQL et constantes
│   ├── controller/          # Contrôleurs Sinatra et routes HTTP
│   ├── helpers/             # Fonctions utilitaires
│   ├── models/              # Modèles Form, Field et Answer
│   └── views/               # Vues HTML/ERB
├── docs/
│   ├── data_models/         # Documents de modélisation
│   ├── db/                  # Script de création de la base de données
│   └── project_management/  # Documents de gestion de projet
├── src/
│   └── assets/              # CSS, images et polices
├── config.ru                # Point d'entrée Rack de l'application
├── Gemfile                  # Dépendances Ruby
└── README.md
```

## Architecture

L'application suit une architecture **MVC** :

- **Models :** `Form`, `Field` et `Answer` gèrent les données et les opérations sur MySQL.
- **Views :** les fichiers ERB génèrent les pages HTML affichées dans le navigateur.
- **Controllers :** `FormsController`, `FieldsController` et `PagesController` gèrent les routes HTTP et coordonnent les modèles avec les vues. `ParentController` rassemble des comportements communs.

## État du projet

Le projet est **en cours de développement**, et ne dispose pas encore de pré-release.
