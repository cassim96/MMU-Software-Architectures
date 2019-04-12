puts "Enter string: "
gets.chomp.downcase
.each_char.with_object(Hash.new(0)){|c, h| h[c] += 1}
.sort_by{|_, v| v}
.reverse
.each{|k, v| puts k + ", " + v.to_s + " " + "*" * v}
