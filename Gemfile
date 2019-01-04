# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
gem 'sinatra'
ruby '2.5.1'
gem 'dm-postgres-adapter'
gem 'data_mapper'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop', '0.56.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
