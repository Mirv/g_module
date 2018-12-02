load 'load_data.rb'

class LoadFile < LoadData
  def self.load(file, dir = 'data')
    target = File.open(File.join(dir, file))
  end

  # Need a hook here to feel out where the commands are being called from
end