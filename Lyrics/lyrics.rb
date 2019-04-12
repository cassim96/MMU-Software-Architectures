File.open("lyrics.txt", "r") do |infile|
  while (line = infile.gets)
    num = 0
    while num < 5
      num = num.next
    puts " #{num}: #{line}"
  end
end
end
