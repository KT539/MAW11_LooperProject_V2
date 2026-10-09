# ExerciseLooper

ExerciseLooper est une application web permettant de créer et de gérer des exercices sous forme de formulaires personnalisés.  
Le site-modèle est disponible ici : https://exercice-looper.mycpnv.ch

Le projet est développé en **Ruby avec Sinatra**, avec une base de données **MySQL** et une architecture **MVC**.

## Technologies utilisées

- **Backend :** Ruby 3.3+, Sinatra
- **Frontend :** HTML, CSS, ERB
- **Base de données :** MySQL
- **Dépendances :** Bundler (RubyGems)
- **Serveur :** Rack / Puma

## Fonctionnalités

- Création d'exercices personnalisés
- Ajout, modification et suppression de champs
- Trois types de champs : texte simple, liste de lignes et texte multiligne
- Gestion des exercices selon leur statut :
  - `Building` : exercice en cours de création
  - `Answering` : exercice disponible pour les réponses
  - `Closed` : exercice terminé
- Stockage des exercices et de leurs champs dans une base MySQL

**Note :** La saisie des réponses et la gestion des exercices terminés ne sont pas encore implémentées.

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

Créer la base MySQL en exécutant le script :

`docs/db/db_create.sql`

Créer ensuite un fichier `.env` à la racine du projet :

```env
DB_HOST=localhost
DB_USERNAME=root
DB_PASSWORD=your_password
DB_DATABASE=MAW11_Looper_RGK
```

Adapter les paramètres à votre configuration MySQL.

### 4. Démarrer l'application

Depuis la racine du projet :

```bash
bundle exec rerun rackup
```

L'application est ensuite accessible à l'adresse :

**http://localhost:9292**

## Structure du projet

```text
.
├── backend/
│   ├── config/          # Configuration
│   ├── controller/      # Contrôleurs Sinatra
│   ├── helpers/         # Fonctions utilitaires
│   ├── models/          # Accès à la base de données
│   └── views/           # Templates HTML/ERB
├── docs/
│   ├── data_models/
│   ├── db/              # Scripts SQL
│   └── project_management/
├── src/
│   └── assets/          # CSS, images et polices
├── config.ru            # Point d'entrée de l'application
├── Gemfile              # Dépendances Ruby
└── README.md
```

## Architecture

L'application suit une architecture MVC :

- **Models :** communication avec la base de données MySQL.
- **Views :** affichage des pages HTML à l'aide de templates ERB.
- **Controllers :** gestion des routes HTTP et des interactions entre les modèles et les vues.

## État du projet

Projet en cours de développement. Les fonctionnalités de création et de gestion des exercices sont partiellement implémentées.
