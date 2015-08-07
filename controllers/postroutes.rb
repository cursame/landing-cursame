
	####### define route form posts ########

	post '/mailer' do 
       puts "************>>>> send mail"	
       mail_stablish = erb :"mailer/simple_contact", locals: {content: params[:content], name: params[:name], phone: params[:phone], institution: params[:institution], charge: params[:charge], email: params[:email]}, :layout => false
       puts "************>>>> sending "	
       ####### detecting params required #######
       if params[:name].empty? || params[:phone].empty? || params[:email].empty?
              puts '>>>>>> error in send email'
              redirect "/#{session[:locale]}/contact?error=813"
       else
              case "#{params[:simglearea]}"
              	  when  "Area de ventas" 
                	  #mail_to_as = ['ignacio@cursa.me', 'rafael@cursa.me', 'fernanda@cursa.me', 'jose_alfredo@cursa.me']
                    mail_to_as = "'jose_alfredo@cursa.me', 'alfredo@cursa.me'"
                    contact_title = "Contacto de ventas Cúrsame"
                	  puts "#{params[:simglearea]}"
              	  when  "Sales area"
                	  mail_to_as = ['ignacio@cursa.me', 'rafael@cursa.me', 'fernanda@cursa.me', 'jose_alfredo@cursa.me']
                    contact_title = "Contacto de ventas Cúrsame"
                	  puts "#{params[:simglearea]}"
              	  when  "Area de compromiso social"
                	  mail_to_as = ['ignacio@cursa.me', 'juan@cursa.me', 'fernanda@cursa.me']
                	  contact_title "Contacto para Impacto social Cúrsame"
                	  puts "#{params[:simglearea]}"
              	  when  "Area of social commitment"
                	  mail_to_as = ['ignacio@cursa.me', 'juan@cursa.me', 'fernanda@cursa.me']
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
          mail_stablish = erb :"mailer/sponsor", locals: {institution: params[:nameinstitution], name: params[:name], phone: params[:phone], email: params[:email], states: params[:states], locations: params[:municipios], adress: params[:adress], option1: params[:option1], option2: params[:option2], option3: params[:option3], option4: params[:option4], option5: params[:option5], option6: params[:option6], society: params[:society] }, :layout => false
	   puts "************>>>> sending "	
	   mail_to_as = ['leon@cursa.me', 'ignacio@cursa.me', 'fernanda@cursa.me', 'juan@cursa.me']
     mail_to(mail_to_as, 'cursame-non-reply@cursa.me', 'Contacto de PATE', mail_stablish )  
	end
    