require 'data_mapper'
require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messenger_#{Sinatra::Base.environment}")

DataMapper.finalize
