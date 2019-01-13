module FSLoad
  class Requirement
    def self.load_dir(directory)
      puts "Start directory - #{Dir.pwd}"
      files = Dir.chdir('greet') do
        puts "Next directory - #{Dir.pwd}"
        Dir["*.rb"] #.each {|file| puts file }
      end
      new(files).execute_dir
    end
    
    def initialize(files)
      @files = files
      puts "init #{@files}"
    end
    
    def execute_single
      drop_extension
      add_to_path
      single_load
    end
    
    def drop_extension
      @files.map!{|x| x = x.split('.').first}
    end
      
    def add_to_path(directory = 'greet')
      $: << "#{Dir.pwd}/#{directory}"
    end
      
    def single_load
      require 'range'
      puts Range.new(1,24).in_range?(3)
    end
    
    def dir_load
      @files.each{|f| require f}
    end
    
    def execute_dir
      add_to_path
      drop_extension
      dir_load
      puts Range.new(1,24).in_range?(3)
    end
  end
end

FSLoad::Requirement.load_dir('greet')
