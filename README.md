# Médiathèque - ECF2 Backend

Application de gestion de médiathèque municipale (livres, abonnés, emprunts).

## Prérequis

- PHP 8.2+
- Composer
- Symfony CLI
- MySQL (XAMPP)

## Installation

```bash
git clone https://github.com/Jules-95/mediatheque.git
cd mediatheque
composer install
```

## Configuration de la base de données

Modifier le fichier `.env` :

```env
DATABASE_URL="mysql://root:@127.0.0.1:3306/mediatheque"
```

Créer la base et exécuter les migrations :

```bash
php bin/console doctrine:database:create
php bin/console make:migration  
php bin/console doctrine:migrations:migrate
```

## Chargement des données de test

```bash
php bin/console doctrine:fixtures:load
```

Cela charge : 10 livres, 5 abonnés, 3 emprunts en cours.

## Lancement

```bash
symfony serve
```

L'application est accessible sur `http://127.0.0.1:8000`

## Identifiants de connexion (Feature Incomplète)

| Email | Mot de passe | Rôle |
|-------|-------------|------|
| admin@mediatheque.fr | admin123 | ROLE_ADMIN |
| biblio@mediatheque.fr | biblio123 | ROLE_BIBLIOTHECAIRE |

-> La sécurisation des routes est partiellement configurée et est donc désactivée pour permettre de tester les endepoints sans authentification. 

## Exemples d'appels API

- GET http://127.0.0.1:8000/api/livres ->  Lister les livres
- GET http://127.0.0.1:8000/api/livres/{id} -> Détail d'un livre
- POST http://127.0.0.1:8000/api/livres -> Ajouter un livre
Content-Type: application/json
 {
    "titre" : "...",
    "auteur" : "...",
    "isbn" : "...",
    "datePublication": "2026-05-20"
}
- PUT http://127.0.0.1:8000/api/livres/{id} -> Modifier un livre
{
    "titre": "Nouveau titre"
}
- DELETE http://127.0.0.1:8000/api/livres/{id} -> Supprimer un livre

## Accès à l'interface web

| Page | URL |
|------|-----|
| Accueil | http://127.0.0.1:8000 |
| Livres | http://127.0.0.1:8000/livre |
| Abonnés | http://127.0.0.1:8000/abonne |
| Emprunts | http://127.0.0.1:8000/emprunt |

Interface minimaliste de base de symfony.
