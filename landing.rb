# encoding: utf-8
# set_session
# set_cookie
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require 'sinatra/r18n'
require 'bourbon'
require 'json'
require 'pony'


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
  
###################### routes ####################################
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

    get '/:locale/terms' do 
    session[:current_route] = '/terms'
	  erb  :"static_views/terms", :layout => :"layouts/application" 
	end	

	post '/mailer' do 
       puts "************>>>> send mail"	
       mail_stablish = erb :"mailer/simple_contact", locals: {content: params[:content], name: params[:name], phone: params[:phone], institution: params[:institution]}, :layout => false
       puts "************>>>> sending "	
       mail_to_as = ['jose_alfredo@cursa.me', 'gabriel@cursa.me', 'rafael@cursa.me', 'juan@cursa.me']
       mail_to(mail_to_as, params[:email], 'Te han contactado para Cúrsame', mail_stablish )  
	end	

################################ helpers ###############################
helpers do
  def image_tag(name, width_x = '')
    "<img src='/img/#{name}' alt='#{name}' width='#{width_x}' />"
  end

  def link_to(name, url, target = '')
  	if url == 'es' || url == 'en'
  	"<a href='#{url}' target='#{target}'>#{name}</a>" 
  	else
  	"<a href='/#{session[:locale]}/#{url}' target='#{target}' >#{name}</a>"
    end
  end

  def icon_bottom_text(class_icon, text)
  	 "<div><i class='i i-#{class_icon}' /></i></div><span>#{text}</span></p>"
  end

  def external_link(name, url)
  	"<a href='#{url}' target='_blank'>#{name}</a>"
  end

  def mail_to(to_email, from_email, subject, body_mail )
  	Pony.mail(:to => to_email, :from => from_email, :subject => subject, :body => ERB.new(body_mail).result, content_type: "text/html")
  end
end

	
  






