
$stdout.sync = true

run lambda { |env| [ 200, {}, "<p>Hello!</p>" ] }
