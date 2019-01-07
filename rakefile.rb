require "./config/data_mapper"
require "sinatra/base"

namespace :db do

desc "upgrade my DB"

 task :auto_upgrade do
   DataMapper.auto_upgrade!
   puts "Upgrade successful !"
 end

desc "migrate my DB"

 task :auto_migrate do
    DataMapper.auto_migrate!
   puts "Migration successful !"
 end
end
