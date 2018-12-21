require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messenger/#{ENV["RACK_ENV"]}")

DataMapper.finalize
DataMapper.auto_migrate!
