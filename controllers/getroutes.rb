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

    get '/to_en' do 
    	R18n::I18n.default = 'en'
        session[:locale] = 'en'
    	redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    get '/to_es' do 
    	R18n::I18n.default = 'es'
        session[:locale] = 'es'
        redirect  "/#{session[:locale]}#{session[:current_route]}"  
    end

    ###### route map ########
    
    ###### define index ########
	get '/:locale' do
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

    get '/:locale/terms' do 
    session[:current_route] = '/terms'
	  erb  :"static_views/terms", :layout => :"layouts/application" 
	end	

	get  '/:locale/private' do
		session[:current_route] = '/private'
        erb  :"static_views/private", :layout => :"layouts/application" 
	end

	######## PATE methods ########
	
	get '/:locale/pate' do 
    session[:current_route] = '/pate'
	  erb  :"static_views/pate", :layout => :"layouts/pate" 
	end	

    get '/:locale/pate/call' do 
    session[:current_route] = '/pate/call'
	  erb  :"static_views/pate/call", :layout => :"layouts/pate" 
	end	

    get '/:locale/pate/sponsor_form' do 
    session[:current_route] = '/pate/sponsor_form'
      erb :"static_views/pate/sponsor_form", :layout => :"layouts/pate" 
    end

    ######### define routes from selects ########

	get '/:locale/localities' do
		@locality = params[:locality]
		localities = erb :"/static_views/pate/locations/#{@locality}", :layout => false
	end

	get '/:locale/browsers' do
		@browser = params[:browser]
		localities = erb :"/static_views/pate/browsers/#{@browser}", :layout => false
	end

	####### define login routes #############

	get '/:locale/login' do
		session[:current_route] = '/login'
		erb  :"static_views/login", :layout => :"layouts/application" 
    end

    ###### defin plugins ##########

    get '/:locale/plugin_login' do 
        session[:current_route] = '/plugin_login'
        response.headers["Access-Control-Allow-Origin"] = "*"

		erb  :"static_views/plugin_login", :layout => :"layouts/application" 

    end

    get '/:locale/call_login_plugin' do 
    	response.headers["Access-Control-Allow-Origin"] = "*"

    	localities = erb :"/static_views/plugins/form_login", :layout => false

    end

    get '/cross_origin' do
	  cross_origin
	  "This is available to cross-origin javascripts"
	end

