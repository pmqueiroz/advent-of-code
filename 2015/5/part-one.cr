def parse(input : String)
  input.split("\n")
end

def forbidden?(line : String)
  ["ab", "cd", "pq", "xy"].any? do |forbidden|
    line.include?(forbidden)
  end
end

def run(input : String)
  parsed_input = parse(input)
  valid_count = 0
  vowels = ["a", "e", "i", "o", "u"]

  parsed_input.map do |line|
    next if forbidden? line

    vowel_count = 0
    line.split("").map_with_index do |char, index|
      if vowels.includes? char
        vowel_count += 1
      end
    end

    if vowel_count >= 3
      valid_count += 1
    end
  end
  count = 0

  puts valid_count
end

run("rthkunfaakmwmush
qxlnvjguikqcyfzt
sleaoasjspnjctqt")
# content = File.read("#{__DIR__}/input.txt")
# run(content)
