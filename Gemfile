source :gemcutter

gem 'rails', '2.3.4', :require => nil
gem "unicorn" #, "3.0.0"

gem "packet"
gem "fastercsv"
gem "mysql"
gem "mysql_retry_lost_connection"
gem "spreadsheet"
gem "restfulx", "1.2.5"

# resque
#gem "redis"#, "2.2.2"
#gem "redis-namespace"#, "1.0.3"
#gem "resque"#, '1.19.0'
#gem 'daemon-spawn', :require => 'daemon_spawn'
#gem "SystemTimer"
#gem "parallel" #,:git=>"https://github.com/grosser/parallel.git"
#gem "ruby-spreadsheet", :git=>"git://scm.ywesee.com/spreadsheet"

# backgroundrb
gem "chronic"

gem "haml"
gem "jpmobile", "0.0.8"
gem "zipruby"
gem "fabrication"
gem "nokogiri"
gem "will_paginate"
gem "json"

group :development,:test do
  gem "thoughtbot-factory_girl"
  gem 'wirble'
  gem 'dike'

  gem 'rspec'         ,'= 1.3.1'
  gem 'rspec-rails'   ,'= 1.3.3'
  #gem 'factory_girl'  ,'= 1.3.3'
  gem 'webrat'        ,'= 0.7.3'
  gem 'shoulda'       ,'= 2.11.3'

  gem 'spork', '= 0.8.5'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'growl'
end

group :deploy do
  gem "capistrano"#, :git => "https://github.com/capistrano/capistrano.git"
  #gem "capistrano-ext"#, :git => "https://github.com/jamis/capistrano-ext.git"
  gem "capistrano_colors"
end

gem "gap"
