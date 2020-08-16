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

def search_by_player(selected_player, attribute)
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:player_name] == selected_player
        return player[attribute]
      end
    end
  end
end

def search_by_team(selected_team, attribute)
  game_hash.each do |team, info|
    if info[:team_name] == selected_team
      return info[attribute]
    end
  end
end

def all_players
  all_players = []
  game_hash.each do |team, info|
    info[:players].each do |player|
       all_players << player[:player_name]
      end
    end
  all_players
end

def num_points_scored(selected_player)
  search_by_player(selected_player, :points)
end

def shoe_size (selected_player)
  search_by_player(selected_player, :shoe)
end

def team_colors(selected_team)
  search_by_team(selected_team, :colors)
end

def team_names
  teams = []
  game_hash.each do |team, info|
    teams << info[:team_name]
  end
  teams
end

def player_numbers(selected_team)
  jersey_numbers = []
  players = search_by_team(selected_team, :players)
  players.each do |player|
    jersey_numbers << player[:number]
  end
  jersey_numbers
end

def player_stats(selected_player)
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:player_name] == selected_player
        return player
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  big_shoe_player = ""
  players = all_players
  
  players.each do |player|
    shoe = shoe_size(player)
    if shoe > biggest_shoe
      biggest_shoe = shoe
      big_shoe_player = player
    end
  end
  search_by_player(big_shoe_player, :rebounds)
end

def most_points_scored
  most_points = 0
  highest_scorer = ""
  players = all_players
  
  players.each do |player|
    points = search_by_player(player, :points)
    if points > most_points
      most_points = points
      highest_scorer = player
    end
  end
  highest_scorer
end

def winning_team
  team_names = []
  score_array = []
  game_hash.each do |team, info|
    score = 0
    team_names << info[:team_name]
    info[:players].each do |player|
      score = score + player[:points]
    end
    score_array << score
  end
  if score_array[0] > score_array[1]
    winner = team_names[0]
  else
    winner = team_names[1]
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  long_name = 0
  players = all_players()
  players.each do |name|
    if name.length > long_name
      long_name = name.length
      longest_name = name
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  thief = ""
  longest_name = player_with_longest_name()
  players = all_players()
  players.each do |player|
    steals = search_by_player(player, :steals)
    if steals > most_steals
      most_steals = steals
      thief = player
    end
  end
  if thief = longest_name
    return true
  else 
    return false
  end
end