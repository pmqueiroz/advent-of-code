def run(input : String)
  result = 0
  input.split("\n").map do |prism|
    dimensions = begin
      l, w, h = prism.split("x").map(&.to_i)

      [l * w, w * h, h * l]
    end
    l_area, w_area, h_area = dimensions
    slack = dimensions.min
    prism_area = 2*l_area + 2*w_area + 2*h_area

    result += prism_area + slack
  end

  puts result
end

# run("1x1x10
# 2x3x4")
content = File.read("#{__DIR__}/input.txt")
run(content)
