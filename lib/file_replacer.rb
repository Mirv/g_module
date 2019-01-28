# require_relative 'lib/file_helpers'
# require_relative 'lib/file_directories'

class Replacer
  # extends FileHelpers
  # includes ::Searcher
  def initialize(directory, ignore = "", log_changes = false)
    @log_changes = log_changes
    @directory = directory
    @ignore = ignore
  end

  def dry_run(target = "")
    Searcher::
    puts p
  end
  
  def replace(replacement)
  end
end

##  Use:
#    Searcher.new("require_relative", "", "foo, bar").run_matches
#
class Searcher
  attr_reader :matched
  
  # '' is search current dir
  def initialize(matches, directory = "", exclude_dirs = "", types = "", recursive = true)
    @matches = matches
    @directory = directory.strip
    @types = optionize(types, "--include=*.") || ""
    @exclude_dirs = optionize(exclude_dirs, "exclude-dir").strip || ""
    @recursive = recursive
    @matched = run_matches
  end
  
  def run_matches
    if @recursive
      search = ["grep", "-R", @matches, @exclude_dirs, @directory].join(" ")
      system(*search)
    end
  end

  def optionize(a_string = "foo, bar", x="exclude-dir")
    return "" unless a_string
    a_string.prepend(', ')  # otherwise last option in a_string is unchanged
    a_string.gsub(', ', " --#{x}=") << " "  # add space so not touching others
  end

end

# puts Searcher.new('').files
# puts Searcher.new('').count
# puts Searcher.new('').relevant("load")

# Replacer.new('lib').dry_run