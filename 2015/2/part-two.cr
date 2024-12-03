def run(input : String)
  result = 0
  input.split("\n").map do |prism|
    ribbon_area = begin
      dimensions = prism.split("x").map(&.to_i)
      min, two_min = dimensions.sort[0..1]
      
      (2 * min + 2 * two_min) + dimensions.reduce(1) { |acc, num| acc * num }
    end

    result += ribbon_area
  end

  puts result
end

# run("1x1x10
# 2x3x4")
content = File.read("#{__DIR__}/input.txt")
run(content)
