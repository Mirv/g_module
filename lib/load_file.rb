load 'load_data.rb'

class LoadFile < LoadData
  def self.load(file, dir = 'data')
    target = File.join(dir, file)
    File.open(target)
  end

  # Need a hook here to feel out where the commands are being called from
end