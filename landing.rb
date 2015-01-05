require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'

get '/' do
  erb :index, :layout => :"layouts/aplication"
end

get '/functions' do 
  erb  :"static_views/functions", :layout => :"layouts/aplication"
end

get '/plugins' do 
  erb  :"static_views/plugins", :layout => :"layouts/aplication"
end

get '/benefits' do 
  erb  :"static_views/benefits", :layout => :"layouts/aplication"
end

get '/social' do 
  erb  :"static_views/social", :layout => :"layouts/aplication"
end

get '/contact' do 
  erb  :"static_views/contact", :layout => :"layouts/aplication"
end



