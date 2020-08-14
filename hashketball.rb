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

def find_team(stats, name)
  stats.keys.find {|team| stats[team][:team_name] == name}
end

def num_points_scored(name)
  # knows the number of points scored by each player
  
  stats = game_hash
  
  stats.each do |team, team_stats|
    team_stats[:players].each do |player_hash|
      if player_hash[:player_name] == name
        return player_hash[:points]
      end
    end
  end
  
  return "Sorry, the player was not found"
  
end

def shoe_size(name)
  # knows the shoe size of each player
  
  stats = game_hash
  
  stats.each do |team, team_stats|
    team_stats[:players].each do |player_hash|
      if player_hash[:player_name] == name
        return player_hash[:shoe]
      end
    end
  end
  
  return "Sorry, the player was not found"
  
end

def team_colors(name)
  # knows the Brooklyn Nets colors are Black and White
  # knows the Charlotte Hornets colors are Turquoise and Purple
  
  stats = game_hash
  
  team = find_team(stats, name)
  
  stats[team][:colors]
  
end

def team_names
  # returns the team names
  
  stats = game_hash
  
  stats.keys.collect {|team| stats[team][:team_name]}
  
end

def player_numbers(name)
  # returns the player jersey numbers
  
  stats = game_hash
  
  team = find_team(stats, name)
  
  stats[team][:players].collect {|player| player[:number]}
  
end

def player_stats(name)
  # returns all stats for a given player
  
  stats = game_hash
  
  stats.keys.each do |team|
    stats[team][:players].each do |player|
      if player[:player_name] == name
        return player
      end
    end
  end
  
  return "Sorry, the player was not found"
  
end

def big_shoe_rebounds
  # returns the number of rebounds of the player with the biggest shoe size
  
  stats = game_hash
  
  biggest = {
    player_name: "",
    shoe: 0,
    rebounds: 0
  }
  
  stats.keys.each do |team|
    
    stats[team][:players].each do |player|
      
      if player[:shoe] > biggest[:shoe]
        
        biggest[:player_name] = player[:player_name]
        biggest[:shoe] = player[:shoe]
        biggest[:rebounds] = player[:rebounds]
        
      end
    end
  end
  
  biggest[:rebounds]
  
end

puts big_shoe_rebounds