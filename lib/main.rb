require 'json'
# Dir["*.rb"].map{|x| load x}
# require
puts "Main"
Dir["lib/*.rb"].each {|file| puts "#{require file}" }