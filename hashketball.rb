def game_hash()
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien"  => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
  hash
end

def num_points_scored(pname)
  ret = ""
  hash = game_hash()
  hash.each do |team, teamdata|
    teamdata[:players].each do |name, stats|
      if name == pname
        ret = stats[:points]
      end
    end
  end
  ret
end

def shoe_size(pname)
  ret = ""
  hash = game_hash()
  hash.each do |team, teamdata|
    teamdata[:players].each do |name, stats|
      if name == pname
        ret = stats[:shoe]
      end
    end
  end
  ret
end

def team_colors(tname)
  ret = ""
  hash = game_hash()
  hash.each do |team, teamdata|
    if teamdata[:team_name] == tname
      ret = teamdata[:colors]
    end
  end
  ret
end

def team_names()
  hash = game_hash()
  hash.map {|team, teamdata| teamdata[:team_name]}
end

def player_numbers(tname)
  ret = []
  hash = game_hash()
  hash.each do |team, teamdata|
    if teamdata[:team_name] == tname
      teamdata[:players].each {|name, stats| ret << stats[:number] }
    end
  end
  ret
end

def player_stats(pname)
  ret = {}
  hash = game_hash()
  hash.each do |team, teamdata|
    teamdata[:players].each do |name, stats|
      if name == pname
        ret = stats
      end
    end
  end
  ret
end

def big_shoe_rebounds()
  hash = game_hash()
  foo = 0
  big_shoe_player = ""
  bsteam = ""
  hash.each do |team, teamdata|
    teamdata[:players].each do |player, stats|
      if stats[:shoe] > foo
        foo = stats[:shoe]
        big_shoe_player = player
        bsteam = team
      end
    end
  end
  hash[bsteam][:players][big_shoe_player][:rebounds]
end
