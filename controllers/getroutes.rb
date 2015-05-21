###################### routes ####################################

    not_found do
      erb :"errors/notfound", :layout => :"layouts/application"
    end

    error do
       erb :"errors/generic", :layout => :"layouts/application"
    end
    get '/' do 
    	R18n::I18n.default = 'es' if session[:locale] == nil
    	session[:locale] = 'es' if session[:locale] == nil
    	session[:current_route] = ''

    	redirect  "/#{session[:locale]}"
    end

    get '/toen' do 
    	R18n::I18n.default = 'en'
        session[:locale] = 'en'
    	redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    get '/toes' do 
    	R18n::I18n.default = 'es'
        session[:locale] = 'es'
        redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    ###### route map ########
    
    ###### define index ########
	get '/:locale' do
    actual_lang
		########## detectar request para mobile #############
		string = request.user_agent
		user_agent = UserAgent.parse(string)
		session[:browser] = user_agent.browser
		session[:platform] = user_agent.platform

		session[:current_route] = ''
	    erb :index, :layout => :"layouts/application"
	end 

	###### define static routes #########

	get '/:locale/us' do 
    actual_lang
		session[:current_route] = '/us'
	  erb  :"static_views/us", :layout => :"layouts/application"
	end

	get '/:locale/features' do 
    actual_lang
		session[:current_route] = '/features'
	  erb  :"static_views/functions", :layout => :"layouts/application"
	end

	get '/:locale/plugins' do 
    actual_lang
		session[:current_route] = '/plugins'
	  erb  :"static_views/plugins", :layout => :"layouts/application"
	end

	get '/:locale/benefits' do 
    actual_lang
		session[:current_route] = '/benefits'
	  erb  :"static_views/benefits", :layout => :"layouts/application"
	end

	get '/:locale/social' do
    actual_lang 
		session[:current_route] = '/social'
	  erb  :"static_views/social", :layout => :"layouts/application"
	end

	get '/:locale/contact' do 
    actual_lang
		session[:current_route] = '/contact'
	  erb  :"static_views/contact", :layout => :"layouts/application"
	end

	get '/:locale/jobs' do
    actual_lang 
		session[:current_route] = '/jobs'		
	  erb  :"static_views/jobs", :layout => :"layouts/application"
	end

	get '/:locale/rse' do 
    actual_lang
		session[:current_route] = '/rse'		
	  erb  :"static_views/jobs", :layout => :"layouts/application"
	end

	get '/:locale/news' do 
    actual_lang
		session[:current_route] = '/news'		
	  erb  :"static_views/news", :layout => :"layouts/application"
	end

	get '/:locale/member' do
    actual_lang 
    session[:current_route] = '/member'
	  erb  :"static_views/member", :layout => :"layouts/application"
	end

	get '/:locale/find_network' do 
    actual_lang
    session[:current_route] = '/find_network'
	  erb  :"static_views/find_network", :layout => :"layouts/application"
	end	

	get '/:locale/impact' do 
    actual_lang
    session[:current_route] = '/impact'
	  erb  :"static_views/inpact", :layout => :"layouts/application" 
	end	

    get '/:locale/terms' do
    actual_lang 
    session[:current_route] = '/terms'
	  erb  :"static_views/terms", :layout => :"layouts/application" 
	end	

	get  '/:locale/private' do
    actual_lang
		session[:current_route] = '/private'
    erb  :"static_views/private", :layout => :"layouts/application" 
	end

	######## PATE methods ########
	
	get '/:locale/pate' do 
    actual_lang
    session[:current_route] = '/pate'
	  erb  :"static_views/pate", :layout => :"layouts/pate" 
	end	

  get '/:locale/pate/call' do 
    actual_lang
    session[:current_route] = '/pate/call'
	  erb  :"static_views/pate/call", :layout => :"layouts/pate" 
	end	

  get '/:locale/pate/sponsor_form' do 
    actual_lang
    session[:current_route] = '/pate/sponsor_form'
    erb :"static_views/pate/sponsor_form", :layout => :"layouts/pate" 
  end

    ######### define routes from selects ########

	get '/:locale/localities' do
    actual_lang
		@locality = params[:locality]
		localities = erb :"/static_views/pate/locations/#{@locality}", :layout => false
	end

	get '/:locale/browsers' do
    actual_lang
		@browser = params[:browser]
		localities = erb :"/static_views/pate/browsers/#{@browser}", :layout => false
	end

	####### define login routes #############

	get '/:locale/login' do
    actual_lang
		session[:current_route] = '/login'
		erb  :"static_views/login", :layout => :"layouts/application" 
  end

  ###### defin plugins ##########

  get '/:locale/plugin_login' do
    actual_lang 
    session[:current_route] = '/plugin_login'
    response.headers["Access-Control-Allow-Origin"] = "*"
	  erb  :"static_views/plugin_login", :layout => :"layouts/application" 
  end

  get '/:locale/call_login_plugin' do
    actual_lang 
  	response.headers["Access-Control-Allow-Origin"] = "*"
  	localities = erb :"/static_views/plugins/form_login", :layout => false
  end

  get '/cross_origin' do
	  cross_origin
	  "This is available to cross-origin javascripts"
	end

