# stage_data_science

Q: Que contiennent les tables dans les schéma louis_v004? Expliquer la structure relationelle et la fonction de chaque table.

A: louis_v004 contient les tables `ada_002`, `chunk`, `crawl`, `link`, `query` et `score`.
- ada_002: Cette table est l'enfant de la table `token`. Elle a une clé étrangère de `token`.
- token: Cette table est le parent de la table `ada_002` et est l'enfant de `chunk`. On peut voir que la table `token` a une clé primaire `id` et qu'`ada_002` possède la clé étrangère de `token`.
- chunk: Cette table contient les sections de la page html tels que son title et le contenu. Elle est l'enfant de crawl. Dans cette table, on y trouve crawl_id pour faire la jointure.
- crawl: Sauvegarde l'url de la page web et le contenue de la page em html. Un `crawl` peut contenir plusieurs `chunk`.
- link: Dans le diagramme, on peut voir qu'il y a une relation entre `crawl` et `link`. La fonction de cette table est de rediriger un lien source vers le lien destination.
- query: Cette table est indépendante. Sa fonction est de stocker des requêtes SQL.
- score: Cette table est indépendante. Sa fonction est de stocker les unités de temps.


Q: Quelle distribution prennent les valeurs de longueur du contenu?

A: Je prends la somme de tous les longueurs `html_content` de la table `crawl` comme distribution.

Q: Expliquer le calcul en fonction de la distribution spécifique des valeurs de longueurs de html_content script

A: Pour chaque ligne dans la table `crawl`, je calcule la longueur de la colonne `html_content` et je divise par la distribution pour trouver le score.

Q: Expliquer et discuter de la performance de votre fonction recherche

A: Je crée une fonction qui se nomme `recherche` et qui prend en paramètre un `mot_cle` d'une chaine de caractères de 255 de longueurs.
Elle retourne un ensemble de documents.
Elle retourne une requête et afficher toutes les colonnes de la table `documents` et prend une condition si le `content` contient le `mot_cle` dans n'importe quelle position. Ensuite, elle met les scores en ordre descendant et on la limite avec la clause LIMIT10 signifie qu'on limite à 10 résultats.

Pour savoir la performance d'une requête, il faut qu'on fait le recours à l'aide des outils de PostgreSQL qui permet de mesurer le temps d'exécution et le temps d'exécution du plan sur le serveur.

### Performance
Avec l'essai :

`select recherche('Nomenclature');`

Voici le résultat:

![Recherche_performance](https://github.com/TheRealiPaul/stage_data_science/blob/main/stage_peformance_recherche.png?raw=true)

