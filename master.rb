# For the purposes of the script, we execute inside the lib dir

require 'optparse'

puts "Entering Greeting Script successfully ..."

options = {}
OptionParser.new do |opt|
  opt.on('--f', '--first_name FIRSTNAME') { |o| options[:first_name] = o }
  opt.on('--l', '--last_name LASTNAME') { |o| options[:last_name] = o }
  opt.on('--c', '--company_name LASTNAME') { |o| options[:company_name] = o }
  opt.on('--t', '--template_name LASTNAME') { |o| options[:template_name] = o }
end.parse!

puts options

Dir.chdir('lib') do
  # setup our dependencies
  target_file = 'load_guest.rb'
  puts "Loading ... '#{target_file}' -- loaded successfully: #{load 'load_guest.rb'}"
end