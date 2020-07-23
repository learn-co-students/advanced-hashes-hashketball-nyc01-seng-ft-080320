#Attempt at refactoring my...lengthy...first solution. Trying to logically break up the data set at the outset, and then insighting, instead of doing the reverse. .fetch is fun

require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

#Helper Methods

def get_all_teams
  #Return an array of team hashes #=> [:home, :away]
  game_hash.values
end

def get_team(team_name)
  #Return the hash of given team name. Searches through "get_all_teams" to find the first key that has a value which matches the given "team" argument.
  get_all_teams.find do |team|
    team.fetch(:team_name) == team_name
  end
end

def get_all_players
  #Fetch the values (hashes) of the [:players] key for each [:home] and [:away] key and then join the arrays.
  home_players = game_hash[:home].fetch(:players)
  away_players = game_hash[:away].fetch(:players)
  home_players + away_players
end

def get_player(player_name)
  #Finds the player hash where the value of the [:player_name] key matches the player_name argument.
  get_all_players.find do |name| 
    name.fetch(:player_name) == player_name
  end
end

def get_player_stat(player_name, stat)
  #Fetches given stat for given player
  player = get_player(player_name)
  player.fetch(stat)
end

#Lab Methods

def num_points_scored(player_name)
  #Calls "get_player_stat" method and passes player_name and the requested stat as symbol
  get_player_stat(player_name, :points)
end

def shoe_size(player_name)
  #Calls "get_player_stat" method and passes player_name and the requested stat as symbol
  get_player_stat(player_name, :shoe)
end

def team_colors(team_name)
  #Gets the hash of the team, then calls for the value of the [:colors] key
  get_team(team_name)[:colors]
end

def team_names
  #Collects all the values of the [:team_name] key within get_all_teams hash
  get_all_teams.collect do |team|
    team[:team_name]
  end
end

def player_numbers(team)
  #For each player on the given team, collect his number to an array.
  get_team(team)[:players].collect do |player|
    player[:number]
  end
end

def player_stats(player)
  #Calls method to bring up player's hash of stats
  get_player(player)
end

#Bonus methods below

def get_player_list(team)
  #Fetches the value of the key [:players] of a given team. Returns an array of hashes.
  get_team(team).fetch(:players)
end

def big_shoe_rebounds()
  #Finds the player with the biggest stat ":shoe", then gets that player's ":rebound" stat.
  get_player_stat(get_player_most_stat(:shoe), :rebounds)
end

def most_points_scored()
  #Calls on a method to find the player with the most of a given stat. In this case...:points.
  get_player_most_stat(:points)
end

def winning_team
  #Gets the total points for each team, then if/elses for the winner.
  home_points = team_points(team_names[0])
  away_points = team_points(team_names[1])
  home_points > away_points ? team_names[0] : team_names[1]
end

def team_points(team)
  #Grabs all the players from the given team and iterates sum over each player's [:points] value.
  get_player_list(team).sum do |player|
    player[:points]
  end
end

def get_player_most_stat(stat)
  #Store an arrayed sort! of players given a state, then return the associated player name.
  sorted_array = get_all_players.sort! {|a, b| b[stat] <=> a[stat]}
  sorted_array[0][:player_name]
end

def player_with_longest_name
  #Store an arrayed sort! of players given name length, the return the associated player name.
  sorted_array = get_all_players.sort! {|a, b| b[:player_name].length <=> a[:player_name].length}
  sorted_array[0][:player_name]
end

def long_name_steals_a_ton
  #Finds player with most stat (:steals) and compares to player with longest name.
  get_player_most_stat(:steals) == player_with_longest_name
end
