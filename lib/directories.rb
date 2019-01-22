require 'byebug'

## DirectoryLeader (module) - namespacing
#
# Call with loader ...
# ... Directories::Requirer.require_current_directory
# ... Directories::Requirer.require_directory('greet')

module Directories

## Requirer (class)
#
# In:   directory to require
# Out:  
# Side: requires all the ruby files found
#
# Notes:  Call via 'load_dir' or 'load_cur_dir'
#
  class Requirer
    def self.require_directory(directory)
      new(directory).execute_directory
    end
    
    def self.require_current_directory
      new.execute_directory
    end
    
    def initialize(directory = "", files = "")
      @directory = directory
      @path = File.join(Dir.pwd, @directory)
      @file_names = list_directory_contents
      @helper = Directories::FileHelpers
    end
    
    def list_directory_contents
      Dir[File.join(@path, "*.rb")]
    end

    def execute_directory
      add_to_path
      extension_only
      require_directory
    end
    
    def extension_only
      @file_names.map!{|x| @helper.drop_extension(x)}
    end
      
    def add_to_path
      $: << @path
    end

    def require_directory
      @file_names.map{|f| "#{require f} -- #{f}" unless @helper.file_loaded? f}
    end
  end
  
  class FileHelpers
    def self.drop_extension(file)
      file.split('.').first
    end
    
    def self.drop_path(path)
      path.split('/').last 
    end
    
    def self.snake_to_camel(file)
      file.split('_').collect(&:capitalize).join
    end
    
    def self.file_loaded?(file)
      file_only = drop_path(file)  
      file_as_class = snake_to_camel(file_only)
      Directories.const_defined? file_as_class.to_s
    end
  end
end

Directories::Requirer.require_directory('greet')