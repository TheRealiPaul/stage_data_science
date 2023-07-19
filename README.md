# stage_data_science

TODO:

Q: Que contiennent les tables dans les schéma louis_v004? Expliquer la structure relationelle et la fonction de chaque table.

A: louis_v004 contient les tables ada_002, chunk, crawl, link, query et score. On peut voir que la table token a une clé primaire `id` et qu'`ada_002` possède la clé étrangère de `token`. 

Q: Quelle distribution prennent les valeurs de longueur du contenu?
- Expliquer le calcul en fonction de la distribution spécifique des valeurs de longueurs de html_content script
- Expliquer et discuter de la performance de votre fonction recherche
