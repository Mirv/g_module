require 'byebug'
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
  # puts Require
  # puts self.Require
  # class self.Require
  
  class Require
    def self.load_dir(directory)
      # files = Dir.chdir(directory){Dir["*.rb"] }
      new(directory).execute_dir
    end
    
    def self.load_cur_dir
      new.execute_dir
    end
    
    def initialize(directory = "", files = "")
      @directory = directory
      @path = File.join(Dir.pwd, @directory)
      @file_names = list_directory_contents
    end
    
    def list_directory_contents
      Dir[File.join(@path, "*.rb")]
    end
    
    def send_files
      @file_names
    end
    
    def execute_dir
      add_to_path
      drop_extension
      dir_load
    end
    
    def drop_extension
      @file_names.map!{|x| x = x.split('.').first}
    end
      
    def add_to_path
      $: << @path
    end

    def dir_load
      @file_names.map{|f| "#{require f} -- #{f}" unless f_loaded? f}
    end
    
    def f_loaded?(file)
      file_only = file.split('/').last  # remove path if there
      file_as_class = snake_to_camel(file_only)
      DirectoryLoader.const_defined? file_as_class.to_s
    end
    
    def snake_to_camel(file)
      file.split('_').collect(&:capitalize).join
    end
  end
end
DirectoryLoader::Require.load_dir('greet')