def run(input : String)
  count = 0
  basement_at = 0
  input.chars.map_with_index do |char, i|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end

    if count == -1
      basement_at = i + 1
      break
    end
  end

  puts basement_at
end

# run("()())")
content = File.read("#{__DIR__}/input.txt")
run(content)
