# For the purposes of the script, we execute inside the lib dir

require 'optparse'

puts "Entering Greeting Script successfully ..."

options = {}
OptionParser.new do |opt|
  opt.on('--f', '--first_name FIRSTNAME') { |o| options[:first_name] = o }
  opt.on('--l', '--last_name LASTNAME') { |o| options[:last_name] = o }
  opt.on('--c', '--company_name COMPANYNAME') { |o| options[:company_name] = o }
  opt.on('--t', '--template_name TEMPLATENAME') { |o| options[:template_name] = o }
end.parse!

puts options

# Doing this as temp dir change allows to keep lib / test dirs
Dir.chdir('lib') do
  # setup our dependencies
  # Dir["*.rb"].map{|x| puts load x}
  target_file = 'load_guest.rb'
  puts "Loading ... '#{target_file}' -- loaded successfully: #{load 'load_guest.rb'}"
end

puts "Exciting Greeting Script.  Goodbye!"