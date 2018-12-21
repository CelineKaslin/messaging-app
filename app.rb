ENV["RACK_ENV"] ||= "development"

require "rubygems"
require 'data_mapper'
require 'sinatra/base'
require './lib/message'
require './config/datamapper'

class Messaging < Sinatra::Base

  get ('/') do
    @messages = Message.all
    erb(:index)
  end

  post ('/messages') do
    @message = Message.create(content: params[:content], time: Time.now)
    redirect('/')
  end

  get ('/selected-message/:id') do
    @message = Message.get(params[:id])
    erb(:selected_message)
  end

 end
