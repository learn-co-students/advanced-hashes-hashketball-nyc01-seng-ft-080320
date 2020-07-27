require "pry" # Write your code below game_hash

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

def num_points_scored name_of_player
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name_of_player
        return player[:points]
      end
    end
  end
end

def shoe_size name_of_player
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name_of_player
        return player[:shoe]
      end
    end
  end
end

def team_colors team_name
  if team_name == game_hash[:away][:team_name]
    return game_hash[:away][:colors]
  else
    return game_hash[:home][:colors]
  end
end

def team_names
  array_of_team_names = []
  array_of_team_names << game_hash[:away][:team_name]
  array_of_team_names << game_hash[:home][:team_name]
end

def player_numbers team_name
  jersey_numbers = []
   if team_name == game_hash[:away][:team_name]
     game_hash[:away][:players].each do |player|
       jersey_numbers << player[:number]
     end
    else
      game_hash[:home][:players].each do |player|
        jersey_numbers << player[:number]
      end
    end
    jersey_numbers
end


def get_players
  game_hash.map do |location, team|
    team[:players]
  end.flatten
end

def player_stats(name_of_player)
  get_players.find do |player|
    player[:player_name] == name_of_player
  end
end

def biggest_shoe_size
  shoe_array = []
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      shoe_array << player[:shoe]
    end
  end
  shoe_array.max
end

def big_shoe_rebounds
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:shoe] == biggest_shoe_size
        return player[:rebounds]
      end
    end
  end
end






















# def num_points_scored(player_name)
#
# game_hash.each do |location, team_info|
#   team_info[:players].each do |player_info|
#     if player_info[:player_name] == player_name
#       return player_info[:points]
#     end
#
#    end
#  end
#
#
# end
#
#
# def shoe_size(player_name)
#   game_hash.each do |team, team_info|
#     team_info[:players].each do |shoe_size|
#       if shoe_size[:player_name] == player_name
#          return shoe_size[:shoe]
#       end
#     end
#   end
# end
#
# def team_colors(team_input)
#   if team_input == game_hash[:away][:team_name]
#
#     return game_hash[:away][:colors]
#   else return game_hash[:home][:colors]
#   end
# end
#
# def team_names
#   game_hash.collect do |team, team_info|
#     team_info[:team_name]
#   end
# end
#
#
# def player_numbers(team_input)
#
# end
#
#
#
#
#
#
# def get_players
#   game_hash.map do |location, team|
#     team[:players]
#   end.flatten
# end
#
# def player_stats(name_of_player)
#   get_players.find do |player|
#     player[:player_name] == name_of_player
#    end
# end
#
#
#
# def biggest_shoe_size
#
#   shoe_array = []
#   shoe_array << shoe_size
#   shoe_array.max
#   binding.pry
# end
#
#
# def big_shoe_rebounds
#
#   game_hash.each do |location, team_info|
#     team_info[:players].each do |player_info|
#       if player_info[:shoe_size] == biggest_shoe_size
#         return player_info[:rebounds]
#
#       end
#
#     end
#
# end

# end
