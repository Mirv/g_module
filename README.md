# g_module

Template for g_messages

Designed to match inputs against files with option of writing your own db adaptor.

If matches are found ...

1) It uses your specific template or the default template
2) It grabs a list of placeholders
3) It attempts to locate each placeholder's value & compute a time based greeting
4) Template assigner will substitute each value

Installation
- Run `git clone https://github.com/mirv/Mirv/g_module` to get library
- Ruby install if needed https://www.ruby-lang.org/en/documentation/installation/
- Run `gem install bundler` to get supporting gems
- Run `bundle install` to install support gems 

Usage 
- Run `ruby master.rb -h` to list options from parent directory of 'lib' file

Usage: master [options]
--f, --first_name FIRST_NAME
--l, --last_name LAST_NAME
--c, --company_name COMPANY_NAME
--t, --template_name TEMPLATE_NAME
--d, --directory_name DATA_DIRECTORY

Notes
- Sub folders use `directory_loader` file to load required files & ...
  ... `require_relative` to call for test purposes
- Case study - https://digi.lib.ttu.ee/i/file.php?DLID=3452&t=1
