# Call with loader ...
# ... DirectoryLoader::Require.load_dir('greet')

## DirectoryLeader (module) - namespacing
#

## Require (class)
#
# In:   directory to require
# Out:  
# Side: requires all the ruby files found
#
# Notes:  Call via 'load_dir' or 'load_cur_dir'
#
module DirectoryLoader
  class Require
    def self.load_dir(directory)
      files = Dir.chdir('greet'){Dir["*.rb"] }
      new(files).execute_dir(directory)
    end
    
    def self.load_cur_dir(directory)
      files = Dir["*.rb"] 
      new(files).execute_dir(directory)
    end
    
    def initialize(files)
      @files = files
      puts "init #{@files}"
    end
    
    def execute_dir(directory)
      add_to_path(directory)
      drop_extension
      dir_load
    end
    
    def drop_extension
      @files.map!{|x| x = x.split('.').first}
    end
      
    def add_to_path(directory)
      puts dir_to_add = File.join(Dir.pwd, directory)
      $: << dir_to_add
      puts $:
    end

    def dir_load
      @files.each{|f| require f}
    end
  end
end
