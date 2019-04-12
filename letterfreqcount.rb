def  letter_count(word)
   hash = {}
   hash.default = 0
   letters = word.downcase.chars
   letters.each do |letter|
       hash[letter] +=1
 end
 p hash
end
