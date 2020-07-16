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

def num_points_scored(given_name)
  
  points = nil
  
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if given_name == player[:player_name]
            points = player[:points]
          end
        end
      end
    end
  end
  return points
end


def shoe_size(given_name)

  shoe_size = nil
  
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if given_name == player[:player_name]
            shoe_size = player[:shoe]
          end
        end
      end
    end
  end
  return shoe_size
end


def team_colors(given_team_name)
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if data == given_team_name
        return game_hash[homeaway][:colors]
      end
    end
  end
end
  
  
def team_names
  team_names_array = []
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if attribute == :team_name
        team_names_array << data
      end
    end
  end
  return team_names_array
end
  

def player_numbers(given_team_name)
  player_numbers_array = []
  game_hash.each do |homeaway, teamspecs|
    if teamspecs[:team_name] == given_team_name
      teamspecs.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            player_numbers_array << player[:number]
          end
        end
      end
    end
  end
  return player_numbers_array
end
  
def player_stats(given_player_name)
  
  player_stats = {}
  
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == given_player_name
            player_stats[:player_name] = player[:player_name]
            player_stats[:number] = player[:number]
            player_stats[:shoe] = player[:shoe]
            player_stats[:points] = player[:points]
            player_stats[:rebounds] = player[:rebounds]
            player_stats[:assists] = player[:assists]
            player_stats[:steals] = player[:steals]
            player_stats[:blocks] = player[:blocks]
            player_stats[:slam_dunks] = player[:slam_dunks]  #seems like there should be an easier way to return these hashes instead of having list every single one, and then add into a new hash
          end
        end
      end
    end
  end
  return player_stats
end
  
def big_shoe_rebounds
  
  shoe_size = 0
  rebounds = 0
  
  game_hash.each do |homeaway, teamspecs|
    teamspecs.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > shoe_size
            shoe_size = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  return rebounds
end






