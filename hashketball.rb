require "pry"

def game_hash()
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


def num_points_scored(name)
  score_home = players_name(game_hash()[:home][:players], name)
  if score_home != nil 
    return score_home
  end
  return players_name(game_hash()[:away][:players], name)
   
end
 
 
def players_name(players, name)
  score = nil 
  players.each do |player|
    if player[:player_name] == name
      score = player[:points]
    end
  end
  score
end
      
    

 
def shoe_size(name)
  home_size = players_size(game_hash()[:home][:players], name)
  if home_size != nil
    return home_size
  end
  return players_size(game_hash()[:away][:players], name)
end

def players_size(players, name)
  size = nil 
  players.each do |player|
    if player[:player_name] == name
      size = player[:shoe]
    end
  end
  size
end 



def team_colors(team_name)
  colors = []
  game_hash().each do |key , value|
    if value[:team_name] == team_name
      colors = value[:colors]
    end
  end
  colors 
end

def team_names ()
  names = []
  game_hash().each do |keys , value|
    names << value[:team_name]
  end
  names
end


def player_numbers(team_name)
  #game_hash().each do |key , value|
    if game_hash()[:home][:team_name].to_s == team_name
     return jersey_numbers(game_hash()[:home][:players])
   else
     return jersey_numbers(game_hash()[:away][:players])
   end
   
end

def jersey_numbers(players)
  numbers = []
  players.each do |player_number|
    numbers << player_number[:number]
  end
  numbers
end 


def player_stats(player_name)
  player_hash = find_player(game_hash()[:home][:players], player_name)
  if player_hash == nil
    player_hash = find_player(game_hash()[:away][:players], player_name)
  end
  player_hash
end 

  def find_player(player , player_name)
    stats = nil 
    player.each do |player|
      if player[:player_name] == player_name
        stats = player
      end
    end
    stats
  end
  
  
def big_shoe_rebounds()
  players = game_hash()[:home][:players] + game_hash()[:away][:players]
  rebounds = nil 
  size = -1
   players.each do |element|
     if element[:shoe] > size
      rebounds = element[:rebounds]
      size = element[:shoe]
     end
  end  
  rebounds
end
  
    
  
 
      
      
  
  #2- return that player's number of rebounds 
  #3- remember to think about return values here 
  

