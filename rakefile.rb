require "data_mapper"

desc "upgrade my DB"

 task :auto_upgrade do
   DataMapper.auto_upgrade! if ENV['RACK_ENV'] == 'development'
   puts "Upgrade successful !"
 end

desc "migrate my DB"

 task :auto_migrate do
    DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
   puts "Migration successful !"
 end
