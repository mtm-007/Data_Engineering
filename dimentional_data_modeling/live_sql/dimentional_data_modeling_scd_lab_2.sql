
CREATE TABLE players_scd (
	player_name TEXT,
	scoring_class scoring_class,
	is_active BOOLEAN,
	current_season INTEGER,
	start_season INTEGER,
	end_season INTEGER,
	PRIMARY KEY(player_name, current_season)
)

SELECT player_name,scoring_class, is_active
FROM players
WHERE current_season = 2022;