# require_relative 'lib/file_helpers'
# require_relative 'lib/file_directories'

class Replacer
  # extends FileHelpers
  def initialize(directory, ignore, log_changes = false)
    @print = print_too
    @directory = directory
    @ignore = ignore
  end
  
  def dry_run(target)
    
  end
  
  def replace(replacement)
  end
end

class Searcher
  def initialize(directory)
  "lib"
  rbfiles = File.join("**", directory, "*.rb")
  result = Dir.glob(rbfiles)
  puts result
  end
  
end

Searcher.new('lib')