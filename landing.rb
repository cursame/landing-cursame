# encoding: utf-8
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require 'sinatra/r18n'
require 'bourbon'


#http://version4.cursa.me/users/sign_in?auth_token=
enable :sessions
  
  ##### sass #####
  configure do
    set :scss, {:style => :compressed, :debug_info => false}
  end
  
  get '/css/:name.css' do |name|
	  content_type :css
	  scss "sass/#{name}".to_sym, :layout => false
  end


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
        redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    ###### route map ########

	get '/:locale' do
		session[:current_route] = ''
	    erb :index, :layout => :"layouts/application"

	end 

	get '/:locale/us' do 
		session[:current_route] = '/us'
	  erb  :"static_views/us", :layout => :"layouts/application"
	end

	get '/:locale/features' do 
		session[:current_route] = '/features'
	  erb  :"static_views/functions", :layout => :"layouts/application"
	end

	get '/:locale/plugins' do 
		session[:current_route] = '/plugins'
	  erb  :"static_views/plugins", :layout => :"layouts/application"
	end

	get '/:locale/benefits' do 
		session[:current_route] = '/benefits'
	  erb  :"static_views/benefits", :layout => :"layouts/application"
	end

	get '/:locale/social' do 
		session[:current_route] = '/social'
	  erb  :"static_views/social", :layout => :"layouts/application"
	end

	get '/:locale/contact' do 
		session[:current_route] = '/contact'		
	  erb  :"static_views/contact", :layout => :"layouts/application"
	end

	get '/:locale/jobs' do 
		session[:current_route] = '/jobs'		
	  erb  :"static_views/jobs", :layout => :"layouts/application"
	end

	get '/:locale/rse' do 
		session[:current_route] = '/rse'		
	  erb  :"static_views/jobs", :layout => :"layouts/application"
	end

	get '/:locale/news' do 
		session[:current_route] = '/news'		
	  erb  :"static_views/news", :layout => :"layouts/application"
	end

	get '/:locale/member' do 
    session[:current_route] = '/member'
	  erb  :"static_views/member", :layout => :"layouts/application"
	end

	get '/:locale/find_network' do 
    session[:current_route] = '/find_network'
	  erb  :"static_views/find_network", :layout => :"layouts/application"
	end	

	get '/:locale/impact' do 
    session[:current_route] = '/impact'
	  erb  :"static_views/inpact", :layout => :"layouts/application" 
	end	
	
	get '/:locale/pate' do 
    session[:current_route] = '/pate'
	  erb  :"static_views/pate", :layout => :"layouts/pate" 
	end	

helpers do
  def image_tag(name)
    "<img src='/img/#{name}' alt='#{name}' width='80%' />"
  end

  def link_to(name, url)
  	"<a href='/#{session[:locale]}/#{url}'>#{name}</a>"
  end

  def icon_bottom_text(class_icon, text)
  	 "<div><i class='i i-#{class_icon}' /></i></div><span>#{text}</span></p>"
  end
end

	
  






