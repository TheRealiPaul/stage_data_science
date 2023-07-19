-- écrire une fonction recherche('mot-clé') qui retourne les dix documents avec le plus haut score contenant
-- le mot-clé
SET search_path TO "quang-long-paul.nguyen.1@ens.etsmtl.ca";

DROP FUNCTION IF EXISTS recherche(mot_cle varchar(255));

CREATE OR REPLACE FUNCTION recherche(mot_cle varchar(255))
RETURNS SETOF documents AS
$$
begin
	RETURN QUERY SELECT * FROM documents
	where content like '%' || mot_cle || '%'
	ORDER BY score desc
	LIMIT 10;
   
END;
$$
LANGUAGE plpgsql;

