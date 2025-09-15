WITH last_season_scd AS(
	SELECT * FROM players_scd
	WHERE current_season = 2021
	AND end_season = 2021
),
	historical_scd AS(
	SELECT * FROM players_scd
	WHERE current_season = 2021
	AND end_season < 2021
	),
	
	this_season_data AS(
	SELECT * FROM players
	WHERE current_season = 2022
	)

SELECT 
	ts.player_name,
	ts.scoring_class as ts_scoring_class,
	ts.is_active as ts_is_active,
	ls.scoring_class as ls_scoring_class,
	ls.is_active as ls_is_active
FROM this_season_data ts 
LEFT JOIN last_season_scd ls ON ts.player_name = ls.player_name