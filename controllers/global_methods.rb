################################ helpers ###############################
helpers do
  
  def actual_lang
    session[:locale] = params[:locale]
  end
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
  	if url == 'toes' || url == 'toen'
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
    puts "#{platform.downcase}"
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

  def mail_to(to_email, from_email, subject, body_mail)

  	ses = AWS::SES::Base.new(
	  :access_key_id     => 'AKIAIDEOIKQ6IJYTQ24A',
	  :secret_access_key => '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'
	  )

  	subject = Sanitize.clean(subject)
  	body_mail = Sanitize.clean(body_mail)
	  
    @to_email = to_email.split(',')
    puts @to_email

  	  #ses.send_email(
  	   # :to =>  @to_email, 
  	   # :from => from_email, 
  	   # :subject => subject,
  	   # :body => body_mail
      # )

  	#Pony.mail(:to => to_email, :from => from_email, :subject => subject, :body => ERB.new(body_mail).result, content_type: "text/html", :via => :ses)
  end

end