require "digest"

# I'm really not proud of using brute force here,
# but I have no idea how to solve this problem, really NO IDEA
def run(input : String)
  try = 0
  loop do
    md5 = Digest::MD5.hexdigest(input + try.to_s)
    break if md5.starts_with?("0" * 5)
    try += 1
  end

  puts try
end

content = File.read("#{__DIR__}/input.txt")
run(content)
