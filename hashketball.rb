require "./hashketball.rb"
require "pry"

# Write your code below game_hash
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

def num_points_scored(player)
  game_hash
  
  game_hash.each do |team_location, first_nested_hash|
    first_nested_hash.each do |keys, arrays_and_strings|
      if arrays_and_strings.class == Array
        arrays_and_strings.each do |player_stats|
          if player_stats.class == Hash && player_stats[:player_name] == player
            return player_stats[:points]
          end
        end
      end
    end
  end
end


def shoe_size(player)
  
  game_hash
  
  game_hash.each do |team_location, first_nested_hash|
    first_nested_hash.each do |keys, arrays_and_strings|
      if arrays_and_strings.class == Array
        arrays_and_strings.each do |player_stats|
          if player_stats.class == Hash && player_stats[:player_name] == player
            return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash

  game_hash.each do |location, nested_hash|
    if nested_hash[:team_name] == team_name
      return nested_hash[:colors]
    end
  end
end

def team_names
  game_hash
  array = []
  
  game_hash.each do |location, inner_hash|
    array.push(inner_hash[:team_name])
  end
  array
end

def player_numbers(team)
  game_hash
  array_of_players_numbers = []

  game_hash.each do |location, nested_hash|
    if nested_hash[:team_name] == team
      nested_hash.each do |team_data, nested_structures|
        if nested_structures.class == Array
            nested_structures.each do |nested_hash|
              if nested_hash.class == Hash
                array_of_players_numbers.push(nested_hash[:number])
              end
            end
          end
        end
      end
    end
  array_of_players_numbers
end

def player_stats(player)
  game_hash
  
  game_hash.each do |team_location, first_nested_hash|
    first_nested_hash.each do |keys, arrays_and_strings|
      if arrays_and_strings.class == Array
        arrays_and_strings.each do |player_stats|
          if player_stats.class == Hash && player_stats[:player_name] == player
            return player_stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  game_hash
  array_of_shoe_sizes = []

    game_hash.each do |location, nested_hash|
      nested_hash.each do |team_data, nested_structures|
        if nested_structures.class == Array
            nested_structures.each do |nested_hash|
              if nested_hash.class == Hash
                array_of_shoe_sizes.push(nested_hash[:shoe])
              end
            end
          end
        end
      end
    
  array_of_shoe_sizes

  largest_shoe = array_of_shoe_sizes[0]
  counter = 0
  while counter < array_of_shoe_sizes.length do
    if array_of_shoe_sizes[counter] > largest_shoe
      largest_shoe = array_of_shoe_sizes[counter]
    end 
    counter += 1
  end
  largest_shoe

   game_hash.each do |location, nested_hash|
      nested_hash.each do |team_data, nested_structures|
        if nested_structures.class == Array
            nested_structures.each do |nested_hash|
              if nested_hash.class == Hash && nested_hash[:shoe] == largest_shoe
                    return nested_hash[:rebounds]
              end
            end
          end
        end
      end
end