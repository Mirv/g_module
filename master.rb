# For the purposes of the script, we execute inside the lib dir

require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--first_name FIRSTNAME') { |o| options[:first_name] = o }
  opt.on('--last_name LASTNAME') { |o| options[:last_name] = o }
end.parse!

puts options

Dir.chdir('lib') do
  # setup our dependencies
  load 'load_guest.rb'
  
  # def initialize
    puts "Hi"
    puts "--#{LoadGuest.load('Guests.json', 'data')}"
  # end
end