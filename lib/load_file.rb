load 'load_data.rb'
require 'json'

class LoadFile < LoadData
  def self.load(file)
    begin
      File.open(file)
    rescue Errno::ENOENT
      # TODO - inject logger here
      puts "File not found --- In #{__FILE__} --- '#{file}'"
      raise Errno::ENOENT
    end
  end
end