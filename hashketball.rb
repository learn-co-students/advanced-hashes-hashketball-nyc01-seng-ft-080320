require 'pry'
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

# Write code here
def find_player_info(requested_player)
    game_hash[:home][:players].each { |player|
      if player[:player_name] == requested_player
        #binding.pry
        return player
      end
    }
    game_hash[:away][:players].each { |player|
     if player[:player_name] == requested_player
       #binding.pry
       return player
      end
    }
end

def find_team_info(requested_team)
  
  if game_hash[:home][:team_name] == requested_team
    #binding.pry
    return game_hash[:home]
  end
  if game_hash[:away][:team_name] == requested_team
    #binding.pry
    return game_hash[:away]
  end
end


def num_points_scored(player)
  #write code here
  find_player_info(player)[:points]
end

def shoe_size(player)
  #Write code here
  find_player_info(player)[:shoe]
end

def team_colors(team)
  #write code here
  find_team_info(team)[:colors]
end

def team_names
  #write code here
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  #write code here
  jersey_numbers = []
  find_team_info(team)[:players].each { |player|
    jersey_numbers.push(player[:number])
  }
  jersey_numbers
end

def player_stats(player)
  #write code here
  find_player_info(player)
end

def big_shoe_rebounds
  #write code here
  shoe_rebound = {}
  biggest_shoe = 0
  game_hash[:home][:players].each{ |player|
    shoe_rebound[player[:shoe]] = player[:rebounds]
    if biggest_shoe < player[:shoe]
      biggest_shoe = player[:shoe]
    end
  }
  game_hash[:away][:players].each{ |player|
    shoe_rebound[player[:shoe]] = player[:rebounds]
      if biggest_shoe < player[:shoe]
        biggest_shoe = player[:shoe]
      end
  }
  shoe_rebound[biggest_shoe] 
end
