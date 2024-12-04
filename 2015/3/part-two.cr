require "set"

def navigate(direction : Char, gps : Array(Int32), visited : Set(String))
  case direction
  when '^'
    gps[1] += 1
  when 'v'
    gps[1] -= 1
  when '>'
    gps[0] += 1
  when '<'
    gps[0] -= 1
  end

  visited << gps.to_s
end

def run(input : String)
  santa_gps = [0, 0]
  robot_gps = [0, 0]
  santa_visited = Set{santa_gps.to_s}
  robot_visited = Set{robot_gps.to_s}

  input.chars.map_with_index do |char, i|
    gps = i.even? ? santa_gps : robot_gps
    visited = i.even? ? santa_visited : robot_visited

    navigate(char, gps, visited)
  end

  puts (santa_visited | robot_visited).size
end

# run("^v")
# run("^>v<")
# run("^v^v^v^v^v")
content = File.read("#{__DIR__}/input.txt")
run(content)
