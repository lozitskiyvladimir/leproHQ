#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:lepro.db"

class Post < ActiveRecord::Base
		has_many :comments
end

class Comment < ActiveRecord::Base

end


get '/main' do
  erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	@post = params[:content]
	@autor = params[:autor]

	Post.create :post => @post, :autor => @autor

	erb redirect "/main"
end


get '/posts' do
  erb :index
end
