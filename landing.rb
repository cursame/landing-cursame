# encoding: utf-8
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require 'sinatra/r18n'
enable :sessions

	###### tranlating methods ########

    R18n.default_places { './i1n8' }
    
    get '/' do 
    	R18n::I18n.default = 'es' if session[:locale] == nil
    	session[:locale] = R18n::I18n.default if session[:locale] == nil
    	session[:current_route] = ''
    	redirect  "/#{session[:locale]}"
    end

    get '/to_en' do 
    	R18n::I18n.default = 'en'
        session[:locale] = R18n::I18n.default
    	redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    get '/to_es' do 
    	R18n::I18n.default = 'es'
        session[:locale] = R18n::I18n.default
      sredirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    ###### route map ########

	get '/:locale' do
		session[:current_route] = ''
	  erb :index, :layout => :"layouts/aplication"
	end 

	get '/:locale/us' do 
		session[:current_route] = '/us'
	  erb  :"static_views/us", :layout => :"layouts/aplication"
	end

	get '/:locale/functions' do 
		session[:current_route] = '/functions'
	  erb  :"static_views/functions", :layout => :"layouts/aplication"
	end

	get '/:locale/plugins' do 
		session[:current_route] = '/plugins'
	  erb  :"static_views/plugins", :layout => :"layouts/aplication"
	end

	get '/:locale/benefits' do 
		session[:current_route] = '/benefits'
	  erb  :"static_views/benefits", :layout => :"layouts/aplication"
	end

	get '/:locale/social' do 
		session[:current_route] = '/social'
	  erb  :"static_views/social", :layout => :"layouts/aplication"
	end

	get '/:locale/contact' do 
		session[:current_route] = '/contact'		
	  erb  :"static_views/contact", :layout => :"layouts/aplication"
	end

	get '/:locale/jobs' do 
		session[:current_route] = '/jobs'		
	  erb  :"static_views/jobs", :layout => :"layouts/aplication"
	end

	get '/:locale/rse' do 
		session[:current_route] = '/rse'		
	  erb  :"static_views/jobs", :layout => :"layouts/aplication"
	end

	get '/:locale/news' do 
		session[:current_route] = '/news'		
	  erb  :"static_views/news", :layout => :"layouts/aplication"
	end

	get '/:locale/member' do 
    session[:current_route] = '/member'
	  erb  :"static_views/member", :layout => :"layouts/aplication"
	end

	get '/:locale/find_network' do 
    session[:current_route] = '/find_network'
	  erb  :"static_views/find_network", :layout => :"layouts/aplication"
	end	





