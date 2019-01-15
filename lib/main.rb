require_relative 'directory_loader' 
# Dir["*.rb"].map{|x| load x}
# require

# working
DirectoryLoader::Require.load_cur_dir
# working
DirectoryLoader::Require.load_dir("greet")


