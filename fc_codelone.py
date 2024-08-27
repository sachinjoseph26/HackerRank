from itertools import combinations

def count_teams(skills, minPlayers, minLevel, maxLevel):
    # Filter players that meet the skill level criteria
    valid_players = [skill for skill in skills if minLevel <= skill <= maxLevel]
    
    # Initialize the count of valid teams
    team_count = 0
    
    # Iterate over the possible team sizes (from minPlayers to the length of valid players list)
    for team_size in range(minPlayers, len(valid_players) + 1):
        # Count all combinations of valid players with the current team size
        team_count += len(list(combinations(valid_players, team_size)))
    
    return team_count

# Example usage
skills = [12, 4, 6, 13, 5, 10]
minPlayers = 3
minLevel = 4
maxLevel = 10

result = count_teams(skills, minPlayers, minLevel, maxLevel)
print(result)  # Output should be 5
