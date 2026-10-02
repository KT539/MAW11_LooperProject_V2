# MAW11_LooperProject_V2

Application Ruby/Sinatra avec une base MySQL. Installer les gems dans le projet
(sans droits administrateur), depuis sa racine :

```sh
bundle config set --local path vendor/bundle
bundle install
```

Configurer ensuite `DB_HOST`, `DB_USERNAME`, `DB_PASSWORD` et `DB_DATABASE` dans
`.env` avec les paramètres de la base MySQL existante, puis lancer :

```sh
bundle exec rackup
```

La configuration locale `.bundle/` et les gems `vendor/bundle/` sont ignorées par Git.

Les six vues sont dans `backend/views/*.html.erb`. Les contrôleurs transmettent
les données des modules `Form` et `Field` aux vues ; les contenus issus de la base
sont échappés avec le helper `h`. Les fichiers CSS, polices et images restent dans
`src/assets`, servis par `Rack::Static`.

Les URL existantes sont conservées : `/index.html`, `/exercises.html`,
`/exercises/new.html`, `/exercises/answering.html` et
`/exercises/:form_id/fields.html`. Leur extension `.html` désigne une route,
pas un fichier généré. L'édition d'un champ reste accessible à
`/exercises/:form_id/fields/:field_id/edit`.

Les listes affichent les exercices enregistrés selon leur statut. La page des
champs relit la base à chaque consultation et n'est affichée que pour un exercice
en construction (`Building`). La finalisation passe son statut à `Answering`.
Aucun fichier HTML ni dossier par exercice n'est créé, modifié ou supprimé.
Le formulaire de réponse et les actions sur les exercices fermés ne sont pas
implémentés dans cette version.
