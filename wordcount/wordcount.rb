File.open("lyrics.txt", "r") do |f|
  f.each_line do |line|
    words = line.split(' ').each do |word|
      word_count[word] += 1
        if word_count.has_key? word
      word_count[word] = 1
        if not word_count.has_key? word
puts word_count
end
end
end
