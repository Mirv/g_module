# greeting_module

Template for greeting messages

Designed to match inputs against files with option of writing your own db adaptor.

If matches are found ...

1) It uses your specific template or the default template
2) It grabs a list of placeholders
3) It attempts to locate each placeholder's value & compute a time based greeting
4) Template assigner will substitute each value

Installation
- Run `git clone https://github.com/mirv/Mirv/greeting_module` to get library
- Ruby install if needed https://www.ruby-lang.org/en/documentation/installation/
- Run `gem install bundler` to get supporting gems
- Run `bundle install` to install support gems 

Usage 
- Run `ruby master.rb -h` to list options
- Required ...
    - `--f` or `--first_name` 
    - `--l` or `--last_name`
    - `--c` or `--company_name`

Notes
- Sub folders use a ruby file with name of folder to load required files & ...
-   ... `require_relative` to call for test purposes