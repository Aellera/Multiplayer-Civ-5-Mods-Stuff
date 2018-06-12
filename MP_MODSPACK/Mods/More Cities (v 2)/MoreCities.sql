/*-**************-*\
More Cities
Found as many cities as you like!
by Civitar
\*-**************-*/

--Units
UPDATE Units SET Capture = 'UNITCLASS_SETTLER' WHERE Type = 'UNIT_SETTLER'; --captured Settlers remain Settlers

--Unhappiness
UPDATE Defines SET Value = 0 WHERE Name = 'UNHAPPINESS_PER_CITY'; --no unhappiness from number of cities
UPDATE Defines SET Value = 1 WHERE Name = 'UNHAPPINESS_PER_POPULATION'; --lower unhappiness from number of citizens
UPDATE Defines SET Value = 3 WHERE Name = 'UNHAPPINESS_PER_CAPTURED_CITY'; --lower unhappiness from number of captured cities
UPDATE Defines SET Value = 2 WHERE Name = 'UNHAPPINESS_PER_OCCUPIED_POPULATION'; --lower unhappiness from subjugated population
UPDATE HandicapInfos SET NumCitiesUnhappinessMod = 0; --no unhappiness from number of cities regardless of difficulty setting
UPDATE Worlds SET NumCitiesUnhappinessPercent = 0; --no unhappiness from number of cities regardless of map size

--Policies
UPDATE Worlds SET NumCitiesPolicyCostMod = 0; --no policy cost modifier from number of cities

--Technologies
UPDATE Worlds SET NumCitiesTechCostMod = 0; --no tech cost modifier from number of cities

--Leaders
UPDATE Defines SET Value = 1 WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_HIGH';
UPDATE Defines SET Value = 2 WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_MEDIUM';
UPDATE Defines SET Value = 4 WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_LOW';

--Tooltip and pedia edits
UPDATE Language_en_US SET Text = 'If you annex the city, you make it a part of your empire. You have total control over the city, just as if you had constructed the city yourself. The one downside to annexation is that doing so makes your citizens unhappy, and you will be required to construct happiness-related buildings like colosseums or connect up to luxury resources to counteract their displeasure.' WHERE Tag = 'TXT_KEY_CITIES_ANNEXINGCITY_HEADING3_BODY';
UPDATE Language_en_US SET Text = 'The following cause unhappiness:[NEWLINE][NEWLINE]Raw Population: As your civ grows, the people get increasingly crowded and unhappy and demand more stuff to keep them amused.[NEWLINE][NEWLINE]Annexed Cities: If you capture and annex foreign cities, their inhabitants won''t be happy.' WHERE Tag = 'TXT_KEY_HAPPINESS_CAUSESUNHAPPINESS_HEADING2_BODY';
UPDATE Language_en_US SET Text = '[ICON_HAPPINESS_4] Unhappiness from number of [ICON_CITIZEN] Citizens halved.' WHERE Tag = 'TXT_KEY_TRAIT_POPULATION_GROWTH';
UPDATE Language_en_US SET Text = 'Every (non-occupied) City produces 0 [ICON_HAPPINESS_4] Unhappiness.' WHERE Tag = 'TXT_KEY_NUMBER_OF_CITIES_TT';
UPDATE Language_en_US SET Text = 'Every (non-occupied) City produces 0 [ICON_HAPPINESS_4] Unhappiness (normally).' WHERE Tag = 'TXT_KEY_NUMBER_OF_CITIES_TT_NORMALLY';
UPDATE Language_en_US SET Text = 'Every [ICON_OCCUPIED] Occupied City produces 3 [ICON_HAPPINESS_4] Unhappiness.' WHERE Tag = 'TXT_KEY_NUMBER_OF_OCCUPIED_CITIES_TT';
UPDATE Language_en_US SET Text = 'Every [ICON_CITIZEN] Citizen in a (non-occupied) City produces 1 [ICON_HAPPINESS_4] Unhappiness.' WHERE Tag = 'TXT_KEY_POP_UNHAPPINESS_TT';
UPDATE Language_en_US SET Text = 'Every [ICON_CITIZEN] Citizen in an [ICON_OCCUPIED] Occupied City produces 2 [ICON_HAPPINESS_4] Unhappiness.' WHERE Tag = 'TXT_KEY_OCCUPIED_POP_UNHAPPINESS_TT';