require_relative 'file_helpers'

## DirectoryLeader (module) - namespacing
#
# Call with loader ...
# ... Directories::Requirer.require_current_directory
# ... Directories::Requirer.require_directory('greet')
# 
# Note shelved due to calling itself & caller file - need to write ignore method

module Directories
  def self.search(target, ignore)
    # ack target 
  end
  
require 'byebug'

## Requirer (class)
#
# In:   directory to require
# Out:  
# Side: requires all the ruby files found
#
# Notes:  Call via 'load_dir' or 'load_cur_dir'
#
  class Requirer
    include FileHelpers
    
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
      @file_names.map!{|x| drop_extension(x)}
    end
      
    def add_to_path
      $: << @path
    end

    def require_directory
      @file_names.map do |f| 
        "#{require f} -- #{f}" unless file_loaded? f, Directories
      end
    end
    
  end
end

