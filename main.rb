content = Array.new
vocab = Array.new
puts "enter the alphabets"
perm = gets.chomp
puts "enter length of the result"
ln = gets.chomp
ln = ln.to_i
=begin
File.foreach("test.txt").with_index do |line, index|
	puts line = line.split("\n")[0] 
	puts line.length
end
=end

File.foreach("collections.txt").with_index do |line, index|
		line = line.split("\n")[0]
        if(line.length == (ln))
                flag = false
                for i in 0...perm.length
                        if(line[0] == perm[i])
                                flag = true
                        end
                end
                if (flag)
                        vocab.push(line);
                end
        end
end
result = Array.new

combs = perm.chars.to_a.permutation(ln).map &:join
combs.uniq!

vocab.each do |val|
        combs.each do |txt|
                if(val == txt)
                        puts combs.length
                        result.push(txt)
                        combs = combs - [txt]
                end
        end

end

puts "result:"
puts result
