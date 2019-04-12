#frequency = Hash.new(0)
input_file = File.open('lyrics.txt', 'r')
output_file = File.open('wordfrequency.txt', 'w')
input_file.read.downcase.scan(/\b[a-z]{3,16}\b/) {|word| frequency[word] = frequency[word] + 1}
frequency.keys.sort.each{|key| output_file.print key,' => ',frequency[key], "\n"}
exit
