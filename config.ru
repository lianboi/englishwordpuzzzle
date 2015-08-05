
$stdout.sync = true
arr = Array.new
File.foreach("collections.txt").with_index do |line, index|
	arr.push(line)
end

run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, arr] }
