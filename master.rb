# For the purposes of the script, we execute inside the lib dir

require 'optparse'
require_relative 'lib/directory_loader' 

puts "Entering Greeting Script successfully ..."

options = {}
OptionParser.new do |opt|
  opt.on('--f', '--first_name FIRST_NAME') { |o| options[:firstName] = o }
  opt.on('--l', '--last_name LAST_NAME') { |o| options[:lastName] = o }
  opt.on('--c', '--company_name COMPANY_NAME') { |o| options[:company] = o }
  opt.on('--t', '--template_name TEMPLATE_NAME') { |o| options[:template] = o }
  opt.on('--d', '--directory_name DATA_DIRECTORY') { |o| options[:directory] = o }
end.parse!


raise OptionParser::MissingArgument, "First name is required" if options[:firstName].nil?
raise OptionParser::MissingArgument, "Last name is required" if options[:lastName].nil?
raise OptionParser::MissingArgument, "Company name is required" if options[:company].nil?

puts "Opt parsing -- #{options}"

# Doing this as temp dir change allows to keep lib / test dirs
Dir.chdir('lib') do
  DirectoryLoader::Require.load_cur_dir
  puts greeting = nil
  puts options
  puts MessageSystem.new(options).assemble_loaders unless greeting
  
end

puts "Exciting Greeting Script.  Goodbye!"