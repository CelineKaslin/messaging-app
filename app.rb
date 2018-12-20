  ENV["RACK_ENV"] ||= "development"

require "rubygems"
require 'data_mapper'
require 'sinatra/base'
require './lib/message'

class Messaging < Sinatra::Base

  enable :sessions

  before do
    session[:messages] ||=[]
    session[:id] ||=1
  end

  get ('/') do
    @messages = session[:messages]
    erb(:index)
  end

  post ('/messages') do
    id = session[:id]
    message = Message.new(params[:content], id)
    id += 1
    session[:id] = id
    session[:messages] << message
    redirect('/')
  end

  get ('/selected-message/:id') do
    id = params[:id].to_i
    messages = session[:messages]
    messages.each do |message|
      if message.id == id
        @message = message.content
      end
    end
    erb(:selected_message)
  end

 end
