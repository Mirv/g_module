require 'optparse'
require_relative 'message_system' 


# require_relative 'lib/file_directories'
require_relative 'file_directories' 
# Directories::Requirer.require_current_directory
  
puts "Entering Greeting Script successfully ..."

options = {}
OptionParser.new do |opt|
  opt.on('--f', '--first_name FIRST_NAME') { |o| options[:firstName] = o.chomp }
  opt.on('--l', '--last_name LAST_NAME') { |o| options[:lastName] = o.chomp }
  opt.on('--c', '--company_name COMPANY_NAME') { |o| options[:company] = o.chomp }
  opt.on('--t', '--template_name TEMPLATE_NAME') { |o| options[:template] = o.chomp }
  opt.on('--d', '--directory_name DATA_DIRECTORY') { |o| options[:directory] = o.chomp }
end.parse!

raise OptionParser::MissingArgument, "First name is required" if options[:firstName].nil?
raise OptionParser::MissingArgument, "Last name is required" if options[:lastName].nil?
raise OptionParser::MissingArgument, "Company name is required" if options[:company].nil?
raise OptionParser::MissingArgument, "Template name is required" if options[:template].nil?

# puts "Opt parsing -- #{options}"

# Doing this as temp dir change allows to keep lib / test dirs
# Dir.chdir('lib') do
  # Directories::Requirer.require_current_directory
  # puts greeting = nil
  # puts "Options received #{options}"
message = MessageSystem.new(options).result unless message
  puts "Message Data loaded ... \n#{message}" if message
  
# end

puts "Exciting Greeting Script.  Goodbye!"