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
### Lecture
Pour pouvoir afficher le fait que l'activité soit dans une wishlist ou pas, il faut adapter l'API des activities.
- `/activities/{id}` : doit retourner les sites pour lesquels l'activités est mise en favori.

Payload :
```
{
  "activity": {
       "id": 1,
       "name": "Escape Game - La Ligue Des Gentlemen",
       "category": "Adventure",
       "city": "Nantes",
       "duration": 60,
       "participants_count": 6,
       "price": 90,
       "photo_url": "https://laliguedesgentlemen.com/wp-content/uploads/2018/01/lu-920x500-c-center.jpg"
       "favorite_sites": {
         [
           {
            "id": 1,
            "name": "Ile de Nantes"
           },
           {
             "id": 2,
             "name": "Paris"
           }
        ]
       }
  }
}
```
- `/sites/{id}` : le endpoint n'existe pas encore. Il faudra le créer au préalable.

Payload :
```
site: {
       "id": 1,
       "name": "Escape Game - La Ligue Des Gentlemen",
       "address": "Adventure",
       "city": "Nantes",
       "zip_code": 60,
       "favorite_activities": {
         [
           {
              "id": 1,
              "name": "Escape Game - La Ligue Des Gentlemen",
              "category": "Adventure",
              "city": "Nantes",
              "duration": 60,
              "participants_count": 6,
              "price": 90,
              "photo_url": "https://laliguedesgentlemen.com/wp-content/uploads/2018/01/lu-920x500-c-center.jpg"
           },
           {
              "id": 11,
              "name": "Balade",
              "category": "Adventure",
              "city": "Paris",
              "duration": 5,
              "participants_count": 2,
              "price": 9,
              "photo_url": "https://laliguedesgentlemen.com/wp-content/uploads/2018/01/lu-920x500-c-center.jpg"
           }
        ]
       }
   }
```
### Ecriture
Conception de deux services : un pour l'ajout d'un favori et un pour la suppression d'un favori.
- Ajout : _POST_ `/services/favorite-addition`

Payload :
```
{
  activity_id: 1,
  site_id: 4
}
```
Reponse : 200

- Suppression : _POST_ `/services/favorite-deletion`

```
{
  activity_id: 1,
  site_id: 4
}
```
