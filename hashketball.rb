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

def player_stats(name)
  # returns all stats for a given player
  
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:player_name] == name
        return player
      end
    end
  end
end

def final_score
  {
  :home => {
    team_name: game_hash[:home][:team_name],
    team_score: game_hash[:home][:players].sum {|player| player[:points]}
  },
  :away => {
    team_name: game_hash[:away][:team_name],
    team_score: game_hash[:away][:players].sum {|player| player[:points]}
  }}
end

def find_team(name)
  game_hash.keys.find {|team| game_hash[team][:team_name] == name}
end

def all_player_stats
  players = []
  game_hash.each do |team, info|
    info[:players].each do |player_hash|
      players << player_hash
    end
  end
  players
end

def team_stats(name)
  
  players = []
  game_hash[find_team(name)][:players].each do |player_hash|
    players << player_hash
  end
  
  players
  
end

def num_points_scored(name)
  # knows the number of points scored by each player
  
  player_stats(name)[:points]
  
end

def shoe_size(name)
  # knows the shoe size of each player
  
  player_stats(name)[:shoe]
  
end

def team_colors(name)
  # knows the Brooklyn Nets colors are Black and White
  # knows the Charlotte Hornets colors are Turquoise and Purple
  
  team = find_team(name)
  
  game_hash[team][:colors]
  
end

def team_names
  # returns the team names
  
  game_hash.keys.collect {|team| game_hash[team][:team_name]}
  
end

def player_numbers(name)
  # returns the player jersey numbers
  
  team = find_team(name)
  
  game_hash[team][:players].collect {|player| player[:number]}
  
end

def big_shoe_rebounds
  # returns the number of rebounds of the player with the biggest shoe size
  
  biggest = {
    player_name: "",
    shoe: 0,
    rebounds: 0
  }
  
  game_hash.each do |team, info|
    
    info[:players].each do |player|
      
      if player[:shoe] > biggest[:shoe]
        
        biggest = {
          player_name: player[:player_name],
          shoe: player[:shoe],
          rebounds: player[:rebounds]
        }
        
      end
    end
  end
  
  biggest[:rebounds]
  
end

def most_points_scored(stats = all_player_stats)
  # which player had the most points?
  
  player_hash = stats.max {|player| player[:points]}
  
  player_hash[:player_name]
  
end

def winning_team
  # which team had the most points
  
  final_score[:home][:team_score] > final_score[:away][:team_score] ? final_score[:home][:team_name]: final_score[:away][:team_name]
  
end

def player_with_longest_name
  # which player has the longest name?
  
  max_name_length = 0
  max_name_player = ""
  
  all_player_stats.each do |player_hash|
    if player_hash[:player_name].length > max_name_length
      max_name_length = player_hash[:player_name].length
      max_name_player = player_hash[:player_name]
    end
  end
  
  max_name_player
    
end

def long_name_steals_a_ton?
  # returns true if player with longest name had the most steals
  
  most_steals = 0
  most_steals_player = ""
  
  all_player_stats.each do |hash|
    if hash[:steals] > most_steals
      most_steals = hash[:steals]
      most_steals_player = hash[:player_name]
    end
  end
  
  player_with_longest_name == most_steals_player
  
end