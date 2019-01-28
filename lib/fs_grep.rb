require 'optparse'
##  Use:
#    Searcher.new("require_relative", "", "foo, bar").run_matches
#

class Searcher
  attr_reader :matched

  def self.grep(options)
  # (
  #   matchString:    matches, 
  #   pathName:       directory = "", 
  #   excludedDir:    exclude_dirs = "", 
  #   fileTypes:      fileTypes = "", 
  #   recursive_off:  recursive = true
  #   )
    new(options[:matchString], "", ".c9, .git, proofs")
  end
  
  # '' is search current dir
  def initialize(matches, directory = "", exclude_dirs = "", types = "", recursive_off = false)
    @matches = matches
    @directory = directory.strip
    @types = joiner(include_file_types(types)) || ""
    @exclude_dirs = joiner(excluder(exclude_dirs)) || ""
    @recursive = recursive_off
    @matched = run_matches
    # puts self.inspect
  end
  
  def run_matches
    search = ["grep", "-R", @matches, @exclude_dirs, @directory].join(" ")
    system(*search)
  end
  
  def excluder(target)
    splitter(target).map!{|t| "--exclude-dir=#{t}" }
  end

  def include_file_types(target)
    splitter(target).map!{|t| "--include=*.#{t}" }
  end

  # maybe have this test ', ' exists and fail over to ',' if not?
  def splitter(target)
    target.split(', ')
  end

  def joiner(target)
    target.join(" ")
  end
  
  def self.get_options
    puts "Entering Search Script successfully ..."
    options = {}
    OptionParser.new do |opt|
      opt.on('--m', '--match_string MATCH_STRING') { |o| options[:matchString] = o }
      opt.on('--c', '--path_name START_PATH_NAME') { |o| options[:pathName] = o }
      opt.on('--exc_d', '--excluded_dir EXCLUDED_DIR_LIST') { |o| options[:excludedDir] = o }
      opt.on('--inc_f', '--include_types FILE_TYPES_INCLUDED') { |o| options[:fileTypes] = o }
      opt.on('--r_off', '--recursive_off') { |o| options[:recursive_off] = o }
    end.parse!
  
    raise OptionParser::MissingArgument, "matchString is required" if options[:matchString].nil?
    options
  end 
end

Searcher.grep(Searcher.get_options).matched