words = Array.new()
File.opem("/usr/share/dict/words", "r") do |infile|
  while (word = infile.gets)
    words << word
  end
end
words.select!{ }
puts words
puts "there are #{words.length} words longer than #{ARGV[0]} characters"
