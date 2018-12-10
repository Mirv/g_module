load 'load_data.rb'
require 'json'

class LoadFile < LoadData
  attr_reader :data

  def opener(file)
    begin
      file = File.open(file)
    rescue Errno::ENOENT
      # TODO - inject logger here
      # puts "File not found --- In #{__FILE__} --- '#{file}'"
      return nil
    end
    return file
  end
  
    # assumes last listed entry is the most current TODO - detect multipe entries
  def pull_records(source)
    return JSON.parse(source.read)
  end
end