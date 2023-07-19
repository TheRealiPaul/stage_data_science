create or replace view score AS 
SELECT (CAST(LENGTH(louis_v004.crawl.html_content) as float) / (SELECT SUM(LENGTH(louis_v004.crawl.html_content)) FROM louis_v004.crawl)) as score
FROM louis_v004.crawl;
