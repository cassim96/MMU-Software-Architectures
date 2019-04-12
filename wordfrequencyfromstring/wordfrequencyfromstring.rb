def count_words(string)
  Hash[
    string.scan(/[a-zA-Z]+/)
      .group_by{|word| word.downcase}
      .map{|word, words|[word, words.size]}
  ]
 end

puts count_words 'I was 09809 home -- Yes! yes!  You was'
