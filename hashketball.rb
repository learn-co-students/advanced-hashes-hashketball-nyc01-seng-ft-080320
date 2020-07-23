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
  #I should of probably should of merged the hashses like in the debugging video
def num_points_scored(playerName)
  game_hash[:home][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash[:points];
    end
  }
  game_hash[:away][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash[:points];
    end
  }
end

def shoe_size(playerName)
  game_hash[:home][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash[:shoe];
    end
  }
  game_hash[:away][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash[:shoe];
    end
  }
end

def team_colors(teamName)
  if game_hash[:home][:team_name] == teamName
    return game_hash[:home][:colors];
  end
  
  if game_hash[:away][:team_name] == teamName
    return game_hash[:away][:colors];
  end
end

def team_names
  arrayOfTeamNames = [];
  arrayOfTeamNames << game_hash[:home][:team_name];
  arrayOfTeamNames.push(game_hash[:away][:team_name])
  return arrayOfTeamNames;
end

def player_numbers(teamName)
  player_numbers_array = [];
  
  if game_hash[:home][:team_name] == teamName
    game_hash[:home][:players].each {|playerHash|
      player_numbers_array << playerHash[:number];
    }
  else
    game_hash[:away][:players].each {|playerHash|
      player_numbers_array << playerHash[:number];
    }
  end
  return player_numbers_array;
end

def player_stats(playerName)
  game_hash[:home][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash;
    end
  }
  game_hash[:away][:players].each {|playerHash|
    if playerHash[:player_name] == playerName
      return playerHash;
    end
  }
end

def big_shoe_rebounds
  largestShoe = [0, ''];
  
  game_hash[:home][:players].each {|playerHash|
    if playerHash[:shoe] > largestShoe[0]
      largestShoe[0] = playerHash[:shoe];
      largestShoe[1] = playerHash[:rebounds]
    end
    }
  
  game_hash[:away][:players].each {|playerHash|
    if playerHash[:shoe] > largestShoe[0]
      largestShoe[0] = playerHash[:shoe];
      largestShoe[1] = playerHash[:rebounds]
    end
    }
    
  return largestShoe[1];
end
