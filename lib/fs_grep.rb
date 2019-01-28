require 'optparse'
require 'shellwords'

##  Use:
#    Searcher.new("require_relative", "", "foo, bar").run_matches
#

class Searcher
  attr_reader :matched

  def self.grep(options)
    matches =         options[:matchString]   || ""
    directory =       options[:pathName]      || ""
    exclude_dirs =    options[:excludedDir]   || ".c9, .git, proofs" 
    fileTypes =        options[:fileTypes]    || "rb"
    recursive_off =   options[:recursive_off] || false

    new(matches, directory, exclude_dirs, fileTypes, recursive_off)
  end
  
  # '' is search current dir
  def initialize(matches, directory = "*", exclude_dirs = "", types = "", recursive_off = false)
    @matches =      matches.shellescape
    @directory =    directory.strip.shellescape
    @types =        include_file_types(types) || ""
    @exclude_dirs = excluder(exclude_dirs)    || ""
    @recursive =    recursive_off
    @matched =      run_matches
  end
  
  def run_matches
    basics_params = ["grep", "'#{@matches}'", @types, @exclude_dirs].flatten 
    puts basics_params << "-R" unless @recursive_off  # if flag don't Recursive
    search = basics_params.join(" ")
    puts system(*search)
  end
  
  # array of cmdline dirs to skip with the tag for grep added
  def excluder(target)
    splitter(target).map!{|t| "--exclude-dir=#{t}".shellescape }
  end

  def include_file_types(target)
    splitter(target).map!{|t| "--include=*.#{t}".shellescape }
  end

  # maybe have this test ', ' exists and fail over to ',' if not?
  def splitter(target)
    target.split(', ')
  end

  # def joiner(target)
  #   target.join(" ")
  # end
  
  def self.get_options
    puts "Entering Search Script successfully ..."
    options = {}
    OptionParser.new do |opt|
      opt.on('--m', '--match_string MATCH_STRING') { |o| options[:matchString] = o }
      opt.on('--p', '--path_name START_PATH_NAME') { |o| options[:pathName] = o }
      opt.on('--e', '--excluded_dir EXCLUDED_DIR_LIST') { |o| options[:excludedDir] = o }
      opt.on('--i', '--include_types FILE_TYPES_INCLUDED') { |o| options[:fileTypes] = o }
      opt.on('--r', '--recursive_off BOOLEAN_TYPE') { |o| options[:recursive_off] = o }
    end.parse!
  
    raise OptionParser::MissingArgument, "matchString is required" if options[:matchString].nil?
    options
  end 
end

Searcher.grep(Searcher.get_options).matched