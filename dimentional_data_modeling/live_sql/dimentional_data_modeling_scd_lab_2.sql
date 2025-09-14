-- CREATE TABLE players_scd (
-- 	player_name TEXT,
-- 	scoring_class scoring_class,
-- 	is_active BOOLEAN,
-- 	start_season INTEGER,
-- 	end_season INTEGER,
-- 	current_season INTEGER,
-- 	PRIMARY KEY(player_name, current_season)
-- );


WITH with_previous AS(
	SELECT 
		player_name,
		scoring_class,
		current_season,
		is_active,
		LAG(scoring_class, 1) OVER(PARTITION BY player_name ORDER BY current_season) as previous_scoring_class,
		LAG(is_active, 1) OVER(PARTITION BY player_name ORDER BY current_season) as previous_is_active
	FROM players
)

SELECT *,
	CASE
		WHEN scoring_class <> previous_scoring_class THEN 1 
		ELSE 0 
	END AS scoring_class_change_indicator,
	CASE
		WHEN is_active <> previous_is_active THEN 1
		ELSE 0
	END AS is_active_change_indicator
		
FROM with_previous
