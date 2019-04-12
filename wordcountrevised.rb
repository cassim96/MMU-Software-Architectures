words.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
