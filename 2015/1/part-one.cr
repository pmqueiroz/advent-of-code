def run(input : String)
  count = 0
  input.chars.map do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
  end

  puts count
end

# run("))(((((")
content = File.read("#{__DIR__}/input.txt")
run(content)
