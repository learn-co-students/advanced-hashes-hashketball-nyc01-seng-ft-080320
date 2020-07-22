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

def get_player_stat(player_name, stat)
  stat_back = 0
  game_hash.each do |home_away, team_data|
    count = 0
    player_list = team_data[:players]
    while count < player_list.length
      if player_list[count][:player_name] == player_name
        stat_back = player_list[count][stat]
      end
      count += 1
    end
  end
  stat_back
end

def num_points_scored(player_name)
  get_player_stat(player_name, :points)
end

def shoe_size(player_name)
  get_player_stat(player_name, :shoe)
end



def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names()
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  player_list = get_player_list(team)
  jersey_numbers = []
  count = 0
  while count<player_list.length
    jersey_numbers << get_player_stat(player_list[count][:player_name], :number)
    count += 1
  end
  jersey_numbers
end

def get_player_list(team)
  player_array = []
  if game_hash[:home][:team_name] == team
    player_array = game_hash[:home][:players]
  else
    player_array = game_hash[:away][:players]
  end
  player_array
end

def get_full_player_list()
  full_player_list = []
  game_hash.each do |home_away, value|
    value[:players].each do |player|
      full_player_list << player
    end
  end
  full_player_list
end

def player_stats(player)
  stats = {}
  stats_keys = game_hash[:home][:players][0].keys
  stats_keys.each do |stat|
    stats[stat] = get_player_stat(player, stat)
  end
  stats
end

def big_shoe_rebounds()
  get_player_stat(get_player_most_stat(:shoe), :rebounds)
end

def most_points_scored()
  get_player_stat(get_player_most_stat(:points), :points)
end

def get_player_most_stat(stat)
  player_list = get_full_player_list
  max_stat = nil
  max_stat_player = ""
  player_list.each do |player|
    if max_stat == nil || player[stat] > max_stat
      max_stat = player[stat]
      max_stat_player = player[:player_name]
    end
  end
  max_stat_player
end

def winning_team()
  if team_points(team_names[0]) > team_points(team_names[1])
    team_names[0]
  else
    team_names[1]
  end
end

def team_points(team)
  team_points = 0
  get_player_list(team).each do |y|
    team_points += y[:points]
  end
  team_points
end

def player_with_longest_name()
  player_list = get_full_player_list
  max_stat = ""
  max_stat_player = ""
  player_list.each do |player|
    if max_stat == "" || player[:player_name].length > max_stat.length
      max_stat = player[:player_name]
      max_stat_player = player[:player_name]
    end
  end
  max_stat_player
end

def long_name_steals_a_ton()
  get_player_most_stat(:steals) == player_with_longest_name
end

