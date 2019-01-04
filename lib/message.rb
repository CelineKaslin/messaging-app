require 'data_mapper'

class Message #< Rack::MethodOverride

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, DateTime

end
