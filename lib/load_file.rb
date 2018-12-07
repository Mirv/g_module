load 'load_data.rb'
require 'json'

class LoadFile < LoadData
  def self.load(file)
    begin
      File.open(file)
    rescue Errno::ENOENT
      raise Errno::ENOENT, "File not found --- In #{__FILE__} --- '#{file}'"
    end
  end
end