# Spécifications fonctionnelles
Ajout de la notion de wishlist liant une activité à un site.

## Fonctionnement

### Depuis l'activité

Définition d'un site intéressé par une activité depuis celle-ci. On ajoute une activité à la wishlist d'un site.

L'interface est déjà existante. Il faudra donc ajouter les boutons d'action permettant l'ajout sur celle-ci.
### Depuis les sites

On pourrait concevoir dans un second temps une nouvelle interface permettant de visualiser toutes les activités wishlistées pour un site donné.

Cette interface n'est pas encore développée et ne fait pas partie du cadre du travail de groupe. Cependant, les spécifications techniques prennent en compte cette possibilité dans un souci de scalabilité.

# Spécifications techniques
## Modèle de données
### Définition de la table
Reprise du modèle de donnée existant et ajout d'une table `sites-activities-favorites` supplémentaire.

- Relation n-n avec la table `activities`
- Relation n-n avec la tableau `sites`

### Définition des données figurant dans la table

- id (PK)
- activity_id (FK)
- site_id (FK)

![MDD](web-app/public/images/mdd.png)
## API
