# TODO 

## Bugs non résolus en attente de fix 
- Affichage du message d'erreur 'Livre déja emprunté' sur le formulaire d'ajout d'emprunt n'apparrait pas. 

## Interface web - Reste à faire

- **Ajout de style + Tailwind**

- **Suppression d'un livre** : 
La suppression via l'interface web ne vérifie pas si le livre a des emprunts liés contrairement à l'API qui gère ce cas correctement. 
Il faudrait ajouter la même logique dans LivreController -> vérifier la disponibilité et supprimer les emprunts historiques avant de supprimer le livre.

- **Message d'erreur emprunt** : 
Le message d'erreur "livre déjà emprunté" ne s'affiche pas correctement sur le formulaire web (Apparement conflit avec Turbo JS). 
Fonctionne correctement via l'API REST.
