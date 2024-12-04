def run(input : String)
  gps = [0, 0]
  visited = { gps => true }

  input.chars.map do |char|
    case char
    when '^'
      gps[1] += 1
    when 'v'
      gps[1] -= 1
    when '>'
      gps[0] += 1
    when '<'
      gps[0] -= 1
    end

    visited[gps] = true
  end

  puts visited.size
end

# run(">")
# run("^>v<")
# run("^v^v^v^v^v")
content = File.read("#{__DIR__}/input.txt")
run(content)
