#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Cleaning and resetting the data
echo $($PSQL "TRUNCATE games, teams")

# Inserting the teams using the winners and opponents
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do 
  if [[ $YEAR != "year" ]] 
  then
    
    # get winner id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # insert winner
    # if not found
    if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert winner
      INSERT_TEAM_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

			if [[ $INSERT_TEAM_WINNER_RESULT == "INSERT 0 1" ]]
			then
				echo "Inserted team: $WINNER"
			fi

    fi

    # insert opponent
    # get opponent id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert winner
      INSERT_TEAM_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

			if [[ $INSERT_TEAM_OPPONENT_RESULT == "INSERT 0 1" ]]
			then
				echo "Inserted team: $OPPONENT"
			fi

    fi
  fi
done

# Inserting the teams using the winners and opponents
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do 
  if [[ $YEAR != "year" ]] 
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OPP_GOALS)")

    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted the results of $WINNER vs $OPPONENT"
    fi

  fi
done