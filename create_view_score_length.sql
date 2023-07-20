-- créer dans votre schéma une vue score qui donne à chaque ligne dans la table louis_v004.crawl un score
-- entre 0.0 et 1.0 dépendant de la longueur (comparé à la distribution) de la colonne louis_v004.crawl.html_content

create or replace view score AS 
SELECT (ABS(LENGTH(louis_v004.crawl.html_content) -
(SELECT AVG(LENGTH(louis_v004.crawl.html_content))
FROM louis_v004.crawl)) / (select stddev(length(louis_v004.crawl.html_content))
FROM louis_v004.crawl)) as score
from louis_v004.crawl;
