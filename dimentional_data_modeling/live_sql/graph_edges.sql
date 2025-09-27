WITH deduped AS (
	SELECT *, row_number() OVER (PARTITION BY player_id, game_id) AS row_num
	FROM game_details
),
	filtered AS (
		SELECT * FROM deduped
		WHERE row_num =1
	)
	SELECT 
		f1.player_name,
		f2.player_name,
		f1.team_abbreviation,
		f2.team_abbreviation
		FROM filtered f1
			JOIN filtered f2
			ON f1.game_id= f2.game_id
			AND f1.player_name <>f2.player_name



INSERT INTO edges
WITH deduped AS (
	SELECT *, row_number() OVER (PARTITION BY player_id, game_id) AS row_num
	FROM game_details
)
SELECT 
	player_id AS subject_identifier,
	'player'::vertex_type AS subject_type,
	game_id AS object_identifier,
	'game'::vertex_type AS object_type,
	'plays_in'::edge_type AS edge_type,
	json_build_object(
		'start_position', start_position,
		'pts', pts,
		'team_id', team_id,
		'team_abbreviation', team_abbreviation
	) AS properties

FROM deduped
WHERE row_num=1;


SELECT
	v.properties->>'player_name',
	MAX(CAST(e.properties->>'pts' AS INTEGER))
FROM vertices v 
JOIN edges e
	ON e.subject_identifier = v.identifier
	AND e.subject_type = v.type
GROUP BY 1
ORDER BY 2 DESC

SELECT player_id, game_id, COUNT(1)
FROM game_details
GROUP BY 1,2


SELECT type, COUNT(1)
FROM vertices
GROUP BY 1