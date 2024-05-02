#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
QUERY1="SELECT SUM(winner_goals + opponent_goals) AS total_goals FROM games;"
echo "$($PSQL "$QUERY1")"

echo -e "\nAverage number of goals in all games from the winning teams:"
QUERY2="SELECT AVG(winner_goals) FROM games;"
echo "$($PSQL "$QUERY2")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
QUERY3="SELECT ROUND(AVG(winner_goals), 2) FROM games;"
echo "$($PSQL "$QUERY3")"

echo -e "\nAverage number of goals in all games from both teams:"
QUERY4="SELECT AVG(winner_goals + opponent_goals) FROM games;"
echo "$($PSQL "$QUERY4")"

echo -e "\nMost goals scored in a single game by one team:"
QUERY5="SELECT MAX(winner_goals) FROM games;"
echo "$($PSQL "$QUERY5")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
QUERY6="SELECT COUNT(*) FROM games WHERE winner_goals > 2;"
echo "$($PSQL "$QUERY6")"

echo -e "\nWinner of the 2018 tournament team name:"
QUERY7="SELECT teams.name FROM games INNER JOIN teams ON teams.team_id = games.winner_id WHERE round LIKE 'Final' AND year = 2018;"
echo "$($PSQL "$QUERY7")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
QUERY8="SELECT name FROM games INNER JOIN teams ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE round LIKE 'Eighth-Final' AND year = 2014 ORDER BY name;"
echo "$($PSQL "$QUERY8")"

echo -e "\nList of unique winning team names in the whole data set:"
QUERY9="SELECT DISTINCT(name) FROM games INNER JOIN teams ON teams.team_id = games.winner_id ORDER BY name;"
echo "$($PSQL "$QUERY9")"

echo -e "\nYear and team name of all the champions:"
QUERY10="SELECT games.year, teams.name FROM games INNER JOIN teams ON teams.team_id = games.winner_id WHERE round LIKE 'Final' AND team_id = games.winner_id ORDER BY teams.name DESC;"
echo "$($PSQL "$QUERY10")"


echo -e "\nList of teams that start with 'Co':"
QUERY11="SELECT name FROM teams WHERE name LIKE 'Co%'"
echo "$($PSQL "$QUERY11")"
