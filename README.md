# landing-cursame
landing page cúrsame

- creada con sinatra
- JsonP
- erb
- Jquery
- Sass


# Métodos importantes Ruby 

- link_to para llamar un link interno
- external_link para llamar un link externo a la Landing
- help_icon para llamar un icon 
- icon_bottom_text para llamar un icono con texto en la parte baja
- mail_to para disparar un Email
- image_tag para llamar una imagen desde la carpeta img en public

# Métodos importantes en JS

- callViewRemote llama remotamente una vista  desde  un link a una div
- sendForm detecta y dispara formularios via remota por JSON
- sendingAJAX Manda via AJAX datos via POST
- headNotice Atrapa notificacione en el heather
- changeTab Cambia de tab en las vistas como Beneficios y Funciones

# Orden del SASS

Estos son los CSS mas importantes de la aplicación y los que más usamos

	- aplication
		- global
		- bunttons
		- backgrounds
		- pate (css de impacto social)

# Orden de la aplicación 

Este es el mapa de la aplicación por vistas y renders 

	- Carpeta Views
		- Vista index.erb
		- static views
			- functions.erb > funciones
			- benefits.erb  > beneficios
			- inpact.erb    > impacto
			- pate.erb      > Educación Pública
			- contact.erb   > contacto
			- login.erb     > Inicia sesión
			- terms.erb     > Términos y condiciones
			- private.erb   > Aviso de privacidad
			- us.erb        > Nosotros
			- news.erb      > Noticias
			- index_renders
				- banner_head.erb 	> parte inicial de lindex de la landing
				- pitch.erb       	> segunta parte landing 
				- clients.erb     	> tercera parte de landing 
				- stats.erb       	> cuarta parte del landing 
				- functions.erb   	> quinta parte muestra las funciones del landing
				- offer.erb       	> sexta parte del landing
				- trust_us.erb    	> septima parte del landing muestra testimonios
			- pate
				- browsers        	 > contiene los erb para formularios con los navegadores y sus versiones
				- locations      	 > contiene los erb para formularios con los estados y municipios de México
				- call.erb       	 > esta vista contiene la convocatoria de Escuelas Públicas
				- sponsor_form.erb   > contiene el formulario para ser patrocinador
				- head.erb           > primera parte de pate
				- objetive.erb       > segunda parte de pate
				- whowork.erb        > tercera parte de pate
				- chart.erb          > cuarta parte de pate contiene datos y gráficas
				- sponsors.erb       > quinta parte de pate contiene la parte de patrocinadores
				- privacy.erb        > sexta parte de pate contiene la política de privacidad
			- simple_renders
                - testimonials.erb   > contiene un render genérico de testimonios
            - static_renders
                - header.erb         > contiene el head de aplication
                - pateheader.erb     > contiene el head de pate
                - simple_heather.erb > contiene el head en colores standar
                - footer.erb         > contiene el footer



 


