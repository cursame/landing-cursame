require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require 'sinatra/r18n'
enable :sessions

R18n::I18n.default = 'es'
R18n.default_places { './i1n8' }
    
    get '/' do 
    	session[:locale] = R18n::I18n.default if session[:locale] == nil
    	redirect  "/#{session[:locale]}"
    end

	get '/:locale' do
	  erb :index, :layout => :"layouts/aplication"
	end
	get '/:locale/us' do 
	  erb  :"static_views/us", :layout => :"layouts/aplication"
	end

	get '/:locale/functions' do 
	  erb  :"static_views/functions", :layout => :"layouts/aplication"
	end

	get '/:locale/plugins' do 
	  erb  :"static_views/plugins", :layout => :"layouts/aplication"
	end

	get '/:locale/benefits' do 
	  erb  :"static_views/benefits", :layout => :"layouts/aplication"
	end

	get '/:locale/social' do 
	  erb  :"static_views/social", :layout => :"layouts/aplication"
	end

	get '/:locale/contact' do 
	  erb  :"static_views/contact", :layout => :"layouts/aplication"
	end

	get '/:locale/jobs' do 
	  erb  :"static_views/jobs", :layout => :"layouts/aplication"
	end

	get '/:locale/rse' do 
	  erb  :"static_views/jobs", :layout => :"layouts/aplication"
	end

	get '/:locale/news' do 
	  erb  :"static_views/news", :layout => :"layouts/aplication"
	end






