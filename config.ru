require 'grape'
require 'json'
require 'rack/cors'

$stdout.sync = true
arr = Array.new
File.foreach("collections.txt").with_index do |line, index|
	arr.push(line)
end

use Rack::Static, :index =>'index.html'

use Rack::Cors do
    allow do
      origins '*'
      # location of your API
      resource '*', :headers => :any, :methods => [:get, :post, :options, :put]
    end
end

class API< Grape::API
	format :json
	post :compute do
		content = Array.new
		vocab = Array.new
		puts "enter the alphabets"
		perm = params['thechars']
		puts "enter length of the result"
		ln = params['thelength']
		ln = ln.to_i
		
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
		return {"result"=>result}

	end
	get :hello do
		return {"hello"=>"Lian"}
	end
end

run API.new