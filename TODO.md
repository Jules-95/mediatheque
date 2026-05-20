# TODO 

## Interface web - Reste à faire

- **Ajout de style + Tailwind**

- **Suppression d'un livre** : 
La suppression via l'interface web ne vérifie pas si le livre a des emprunts liés contrairement à l'API qui gère ce cas correctement. 
Il faudrait ajouter la même logique dans LivreController -> vérifier la disponibilité et supprimer les emprunts historiques avant de supprimer le livre.

- **Message d'erreur emprunt** : 
Le message d'erreur "livre déjà emprunté" ne s'affiche pas correctement sur le formulaire web (Apparement conflit avec Turbo JS). 
Fonctionne correctement via l'API REST.

## Sécurité 
- Manque une page de login et systeme de logout 
- Manque une vraie sécurisation des routes selon les rôles
- L'entité User est créée avec deux utilisateurs en base  :
  - admin@mediatheque.fr / admin123 → ROLE_ADMIN
  - biblio@mediatheque.fr / biblio123 → ROLE_BIBLIOTHECAIRE
- Pour activer la sécurisation (partielle) il faut décommenter dans security.yaml :
  `- { path: ^/api, roles: ROLE_BIBLIOTHECAIRE }`

## Autre
- J'aurais aimé utilisé Foundry mais manque de temps 
- Règle d'unicité du isbn non respecté. Même si hors consigne on aurait pu faire attention à la validation des données. (isbn standardisé, toujours un meme nombre de chiffres, identifiant du livre,...)