#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:lepro.db"

class Post < ActiveRecord::Base
		has_many :comments
end



get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/new' do
  erb "Hello World"
end

get '/posts' do
  erb "Hello World"
end

get '/main' do
  erb "Hello World"
end
