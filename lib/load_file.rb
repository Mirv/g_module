load 'load_data.rb'
require 'json'

class LoadFile < LoadData
  # def self.load(dir = 'data', file = 'Guests.json')
  #   file = File.join(dir, file)
  #   begin
  #     puts "dir in LF #{file}"
  #     puts "#{dir} -- #{file} LF"
  #     puts "os dir #{Dir.pwd}"
  #     puts "file ---- #{file}"
  #     File.open(file) 
  #   rescue Errno::ENOENT
  #     # puts "In #{__FILE__} --- File not found --- '#{dir}/#{file}'"
  #     raise Errno::ENOENT, "File not found --- In #{__FILE__} --- '#{file}'"
  #   end
  # end
  
  def self.load(file)
    begin
      File.open(file)
    rescue Errno::ENOENT
      raise Errno::ENOENT, "File not found --- In #{__FILE__} --- '#{file}'"
    end
  end
end