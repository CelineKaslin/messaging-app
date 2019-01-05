require 'data_mapper'
require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messenger_#{ENV["RACK_ENV"]}")

DataMapper.finalize
