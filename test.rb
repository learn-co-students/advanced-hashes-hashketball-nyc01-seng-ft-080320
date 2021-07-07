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


def num_points_scored(player)
  points = 0
  game_hash.each do |title, information|
    information[:players].each do |players|
      players.each do |key, value|
        if value == player
          points = players[:points]
        end
      end
    end
  end
  points
end


def shoe_size(player)
  shoe_size = 0
  game_hash.each do |title, information|
    information[:players].each do |players|
      players.each do |key, value|
        if value == player
          shoe_size = players[:shoe]
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
  team_colors = ""
  game_hash.each do |title, information|
    if information[:team_name] == team
      team_colors = information[:colors]
    end
  end
  team_colors
end

def team_names
  team_names = []
  game_hash.each do |title, information|
    information.each do |key, value|
      if key == :team_name
        team_names.push(value)
      end
    end
  end
  team_names
end

def player_numbers(team)
  numbers_array = []
  game_hash.each do |title, information|
    if information[:team_name] == team
      information[:players].each do |players|
        players.each do |key, value|
          if key == :number
            numbers_array.push(value)
          end
        end
      end
    end
  end
  numbers_array
end

def player_stats(name)
  stats = {}
  game_hash.each do |title, information|
    information[:players].each do |value|
      if value[:player_name] == name
        stats = value
      end
    end
  end
  stats
end


def big_shoe_rebounds
  rebounds = 0
  biggest_shoe_size = 0
  game_hash.each do |title, information|
    information[:players].each do |stats|
      stats.each do |key, value|
        if key == :shoe
          if stats[:shoe] > biggest_shoe_size
            biggest_shoe_size = stats[:shoe]
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
