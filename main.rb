content = Array.new
vocab = Array.new
perm = "tqojdjndtjzz"
ln = 3

File.foreach("englishwords.txt").with_index do |line, index|
        if(line.length == 5)
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

combs = perm.chars.to_a.permutation(3).map &:join
vocab.each do |val|
        combs.each do |txt|
                if(val[0,3] == txt)
                        result.push(txt)
                end
        end
end

puts "result:"
puts result
