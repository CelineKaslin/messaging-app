ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'sinatra/base'
require './lib/message'
require './config/datamapper'

class Messaging < Sinatra::Base
  enable :method_override

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/messages' do
    @message = Message.create(content: params[:content], time: Time.now)
    redirect('/')
  end

  get '/selected-message/:id' do
    @message = Message.get(params[:id])
    erb(:selected_message)
  end

 get '/edit_message/:id' do
   @message = Message.get(params[:id])
   erb(:edit_message)
 end

 put '/edit/:id' do
   @message = Message.get(params[:id])
   @message.update(content: params[:content])
   redirect ("/selected-message/#{params[:id]}")
 end

 delete '/delete/:id' do
   @message = Message.get(params[:id]).destroy
   redirect('/')
 end

end
