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
require 'aws/ses'
require 'sanitize'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/cross_origin'
require 'useragent'

###################### define run methods #########################
enable :sessions
enable :cross_origin

register Sinatra::AssetPack
  ##### sass #####
  configure do
    set :scss, {:style => :compressed, :debug_info => false}
    set :allow_origin, :any
  end
  
  get '/css/:name.css' do |name|
	  content_type :css
	  scss "sass/#{name}".to_sym, :layout => false
  end


	###### tranlating methods ########

    R18n.default_places { './i1n8' }

    ###### compresors ########

    assets {
	    serve '/js',     from: 'public/js'        # Default
	    serve '/sass',    from: 'views/sass'       # Default
	    serve '/images', from: 'public/img'    # Default

	    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
	    css_compression :sass   # :simple | :sass | :yui | :sqwish
	  }
 

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

	####### define route forms ########

	post '/mailer' do 
       puts "************>>>> send mail"	
       mail_stablish = erb :"mailer/simple_contact", locals: {content: params[:content], name: params[:name], phone: params[:phone], institution: params[:institution], charge: params[:charge], email: params[:email]}, :layout => false
       puts "************>>>> sending "	

       case "#{params[:simglearea]}"
       	  when  "Area de ventas" 
       	  mail_to_as = ['gabriel@cursa.me', 'rafael@cursa.me', 'fernanda@cursa.me', 'jose_alfredo@cursa.me']
       	  contact_title = "Contacto de ventas Cúrsame"
       	  puts "#{params[:simglearea]}"
       	  when  "Sales area"
       	  mail_to_as = ['gabriel@cursa.me', 'rafael@cursa.me', 'fernanda@cursa.me', 'jose_alfredo@cursa.me']
       	  contact_title = "Contacto de ventas Cúrsame"
       	  puts "#{params[:simglearea]}"
       	  when  "Area de compromiso social"
       	  mail_to_as = ['juan@cursa.me', 'fernanda@cursa.me']
       	  contact_title "Contacto para Impacto social Cúrsame"
       	  puts "#{params[:simglearea]}"
       	  when  "Area of social commitment"
       	  mail_to_as = ['juan@cursa.me', 'fernanda@cursa.me']
       	  contact_title "Contacto para Impacto social Cúrsame"
       	  puts "#{params[:simglearea]}"
       	  when   "Area de soporte" 
       	  mail_to_as = ['juan@cursa.me', 'fernanda@cursa.me']
       	  contact_title = "Contacto de soporte"
       	  puts "#{params[:simglearea]}"
       	  when "Support Area"
       	  mail_to_as = ['juan@cursa.me', 'fernanda@cursa.me']
       	  contact_title = "Contacto de soporte"
       	  puts "#{params[:simglearea]}"
       end
       mail_to(mail_to_as, 'cursame-non-reply@cursa.me', contact_title, mail_stablish )  
	end	

	post '/send_call' do 
	   puts "************>>>> send mail"
	   puts params
       mail_stablish = erb :"mailer/call", locals: {name: params[:name], charge: params[:charge],email: params[:email], phone: params[:phone], institution: params[:institution], states: params[:states], locations: params[:municipios], option1: params[:option1], option2: params[:option2], option3: params[:option3], option4: params[:option4], number_of_users: params[:number_of_users], option5: params[:option5], option6: params[:option6], enlace: params[:enlace], calenlace: params[:calenlace], internet: params[:internet], option7: params[:option7], option8: params[:option8], option9: params[:option9], option10: params[:option10], option11: params[:option11], velinternet: params[:velinternet], browser: params[:browser], versionbrowser: params[:versionbrowser], computers: params[:computers], functional_computers: params[:functional_computers], interesdedocentes: params[:interesdedocentes], usodetics: params[:usodetics], examples_from_user_tics: params[:examples_from_user_tics], teacheshavecomputers: params[:teacheshavecomputers], imactfromtecnologicineducation: params[:imactfromtecnologicineducation], option12: params[:option12], option13: params[:option13], option14: params[:option14], option15: params[:option15], option16: params[:option16], option17: params[:option17],  familiarizadoprofesores: params[:familiarizadoprofesores] }, :layout => false
       puts "************>>>> sending "	
       mail_to_as = ['leon@cursa.me', 'juan@cursa.me', 'erika@cursa.me', 'jose_alfredo@cursa.me', 'fernanda@cursa.me']
      
       mail_to(mail_to_as, 'cursame-non-reply@cursa.me', 'Contacto de PATE', mail_stablish )  
	end

	post '/contact_sponsor' do 
	   puts  "************>>>> send mail"
       mail_stablish = erb :"mailer/sponsor", locals: {institution: params[:nameinstitution], name: params[:name], phone: params[:phone], email: params[:email], states: params[:states], locations: params[:municipios], adress: params[:adress], option1: params[:option1], option2: params[:option2], option3: params[:option3], option4: params[:option4], option5: params[:option5], option5: params[:option5], option6: params[:option6], society: params[:society] }, :layout => false
	   puts "************>>>> sending "	
	   mail_to_as = ['leon@cursa.me', 'ignacio@cursa.me', 'fernanda@cursa.me', 'juan@cursa.me']
	   #mail_to_as = 'jose_alfredo@cursa.me'
       mail_to(mail_to_as, 'cursame-non-reply@cursa.me', 'Contacto de PATE', mail_stablish )  
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
    

################################ helpers ###############################
helpers do
  
  ####### call image ########

  def image_tag(name, width_x = '', classx = '')
    "<img src='/img/#{name}' alt='#{name}' width='#{width_x}' class='#{classx}' />"
  end

  ####### insternal static link ###########

  def link_to(name, url, target = '', classhtml = '')
    if session[:locale] == nil
       locale = 'es'
     else
       locale = session[:locale]
    end
  	if url == 'to_es' || url == 'to_en'
  	"<a href='/#{url}' target='#{target}'>#{name}</a>" 
  	else
  	"<a href='/#{locale}/#{url}' target='#{target}' class='#{classhtml}' >#{name}</a>"
    end
  end

  ############ to puts icons #############


  def icon_bottom_text(class_icon, text= '')
  	 "<div><i class='i i-#{class_icon}' /></i></div><span>#{text}</span></p>"
  end

  def help_icon(class_icon)
    "<i class='i i-#{class_icon}' /></i>"
  end


  ############ to puts external links #########
  def external_link(name, url)
  	"<a href='#{url}' target='_blank'>#{name}</a>"
  end
  

  ############## mobile helper ##############

  def mobile_validate?
    platform = session[:platform].to_s
    #puts "#{platform}"
     case platform.downcase  
     when 'iphone'
      true
     when 'android'
      true
     when 'firefox'
      true
     when 'windows phone'
      true
     when 'linux'
      true
     else
      false
     end  
  end

  ############# mail method SES #############

  def mail_to(to_email, from_email, subject, body_mail )

  	ses = AWS::SES::Base.new(
	  :access_key_id     => 'AKIAIDEOIKQ6IJYTQ24A',
	  :secret_access_key => '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'
	)

  	subject = Sanitize.clean(subject)
  	body_mail = Sanitize.clean(body_mail)
	
	ses.send_email(
	    :to => to_email, 
	    :from => from_email, 
	    :subject => subject,
	    :body => body_mail
    )

  	#Pony.mail(:to => to_email, :from => from_email, :subject => subject, :body => ERB.new(body_mail).result, content_type: "text/html", :via => :ses)
  end
end

	
  






