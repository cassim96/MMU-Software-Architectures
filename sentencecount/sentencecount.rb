File.open("lyrics.txt", "r") do |infile|
  line = File.readlines("lyrics.txt")
  linecount = line.size
  text = line.join
    puts "#{linecount} lines"
  sentencecount = text.split(/\.|\?|!/).length
    puts "#{sentencecount} sentences"
end
