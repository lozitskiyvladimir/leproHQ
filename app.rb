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

before do
	@posts = Post.order 'created_at DESC'

end

get '/main' do
  erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	@c = Post.new params[:post]
	@c.save

	erb redirect "/main"
end


get '/posts' do
  erb :index
end

get '/comments/:id' do
	@this_post = Post.find params[:id]
	erb :comments
end

post '/comments/:posts_id' do
	p = params[:comment]
	p['posts_id'] = params[:posts_id]
	@c = Comment.new params[:comment]
	@c.save

	redirect to('/comments/' + params[:posts_id])
end
