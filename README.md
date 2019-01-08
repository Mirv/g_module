# greeting_module
Template for greeting messages

Installation
- Run `git clone https://github.com/mirv/Mirv/greeting_module` to get library
- Ruby install if needed https://www.ruby-lang.org/en/documentation/installation/
- Run `gem install bundler` to get supporting gems
- Run `bundle install` to install support gems 

Usage 
- `master.rb` outside lib acts as interface handling inputs with optparse
- Master hands off to `lib/main.rb` 
- Run `ruby master.rb -h` to list options
- Required ...
    `--f` or `--first_name` 
    `--l` or `--last_name`
    `--c` or `--company_name`
