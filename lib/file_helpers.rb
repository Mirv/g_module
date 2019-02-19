# module FileHelpers
#   def drop_extension(file)
#     file.split('.').first
#   end
  
#   def drop_path(path)
#     path.split('/').last 
#   end
  
#   def snake_to_camel(file)
#     file.split('_').collect(&:capitalize).join
#   end
  
#   # needs file to check and class/module to check against
#   def file_loaded?(file, constant_name)
#     file_only = drop_path(file)  
#     file_as_class = snake_to_camel(file_only)
#     constant_name.const_defined? file_as_class.to_s
#     Object.const_defined? file_as_class
#   end
# end