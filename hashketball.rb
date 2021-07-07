# Write your code below game_hash
require 'pry'
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

# Write code here

# helper method 
def get_players(collection)
  collection[:home][:players].concat(collection[:away][:players])
end 

def num_points_scored(name)
  all_players = get_players(game_hash)
  all_players.each do |player|
    if player[:player_name] == name
      return player[:points]
    end 
  end
end 

def shoe_size(name)
  all_players = get_players(game_hash)
  all_players.each do |player|
    if player[:player_name] == name
      return player[:shoe]
    end
  end 
end 

def team_colors(team)
  game_hash.each do |team_hash, attributes|
    if attributes.has_value?(team)
      return attributes[:colors]
    end   
  end
end 

def team_names
  game_hash.map do |team_hash, attributes|
    attributes[:team_name]
  end
end

def player_numbers(team)
  player_numbers = nil
  game_hash.each do |team_hash, attributes|
    if attributes.has_value?(team)
      player_numbers = attributes[:players].map do |player|
        player[:number]
      end 
    end
  end
  player_numbers
end

def player_stats(name)
  game_hash.each do |team_hash, attributes|
    attributes[:players].each do |player|
      if player.has_value?(name)
        return player 
      end  
    end
  end
end

def big_shoe_rebounds
  all_players = get_players(game_hash)
  biggest_shoe = 0
  player_with_biggest_shoe = ""
  rebound_by_big_shoe_player = 0
  all_players.each do |player|
    if player[:shoe] > biggest_shoe
      biggest_shoe = player[:shoe]
      player_with_biggest_shoe = player 
      rebound_by_big_shoe_player = player[:rebounds]
    end
  end
  rebound_by_big_shoe_player
end 
  
def most_points_scored
  all_players = get_players(game_hash)
  most_points = 0 
  player_with_most_points = ""
  all_players.each do |player|
    if player[:points] > most_points
      most_points = player[:points]
      player_with_most_points = player[:player_name]
    end  
  end
  player_with_most_points
end 

def winning_team
  home_team_score = get_total_score(game_hash[:home])
  away_team_score = get_total_score(game_hash[:away])
  home_team_score > away_team_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end 

#helper method for winning team
def get_total_score(team_hash)
  individual_player_scores = team_hash[:players].map { |player| player[:points] }
  individual_player_scores.reduce { |sum, n| sum + n }
end 

def player_with_longest_name
  all_players = all_players = get_players(game_hash)
  longest_name = ""
  all_players.each do |player|
    if player[:player_name].length > longest_name.length
      longest_name = player[:player_name]
    end
  end   
  longest_name 
end 

def long_name_steals_a_ton?
  all_players = all_players = get_players(game_hash)
  player_with_max_steal = ""
  max_steal = 0
  all_players.each do |player|
    if player[:steals] > max_steal
      max_steal = player[:steals]
      player_with_max_steal = player[:player_name]
    end
  end
  player_with_max_steal == player_with_longest_name
end
  
  

