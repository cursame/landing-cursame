# landing-cursame
landing page cúrsame

- creada con sinatra
- JsonP
- erb
- Jquery
- Sass
- YAML

# Vagrant y Dockerfile (instalable con configuració)

Se generó un instalable que corre con una maquina virtual configurada
para sinatra.
- Funciona mediante Dockerfile con su maquina virtual y vagrant con su maquina virtual en ubuntu
- maquina: vagrant init gajdaw/sinatra; vagrant up --provider virtualbox
- Compila Ruby desde cero en la versión 2.2.0
- También funciona de una manera dinámica pero sencilla con Foreman.
- Para poder ingresar en la consola de vagrant "vagrant ssh"

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

# YAML estructura

		--- 
		banner_index_head: 
		  m1: "The best educational platform <br/> at the most affordable price in the market."
		  m3: "¿What are the benefits of using Cúrsame?  "
		  m4: " ¿How does Cúrsame work?  "
		  m5: "Ilimited Licence for your school prices from 30 thousand mexican pesos a year"
		benefits: 
		  benefit1: "User Friendly"
		  benefit2: "Simple and Powerful Functions"
		  benefit3: Multipltaform
		  benefit4: "Connection between students and teachers"
		  benefit5: "School management"
		  benefit6: "All stored in the cloud"
		  dbenefit1: "View the syllabus of your teachers."
		  dbenefit2: "Make an academic follow-up"
		  dbenefit3: "Add and remove users"
		  dbenefit4: "Massive mail tool"
		  dbenefit5: "Net configuration capacity"
		  ebenefit1: "Tools for improving the interaction with the teacher."
		  ebenefit2: "Comunicate with your classmates"
		  ebenefit3: "Schedule your activities"
		  ebenefit4: "Check your grades"
		  ebenefit5: "All the school within reach in your tablet or cell phone"
		  ibenefit1: "Use of technology in education."
		  ibenefit2: "Reduction of school violence"
		  ibenefit3: "Improves the channels of communication"
		  ibenefit4: "Have control over your school comunity"
		  ibenefit5: "Use Statistics of the school"
		  mbenefit1: "Tools to create academic content"
		  mbenefit2: "Planning and control of all of your activities"
		  mbenefit3: "Chat with your course classmates"
		  mbenefit4: "Manage your grades"
		  mbenefit5: "Interact with students and board of directors"
		  section1: Teachers
		  section2: Student
		  section3: "Board of directors"
		  section4: Institution
		  subtitle: "All members in the institution get a benefit from Cúrsame"
		  title: Benefits
		bnefits_text: 
		  t1: "Connection between board of directors, teachers and students"
		  t2: "Management of the institution"
		  t3: "All your activities in one place in the cloud"
		  tx1: "Get your institution in touch any moment, any place."
		  tx2: "Manage efficiently the process of teaching and learning."
		  tx3: "Access your school any time any place"
		  call: "I want to know all benefits"
		footer: 
		  contact: Contact
		  english: English
		  gospel: Training
		  jobs: Empleos
		  news: News
		  privatex: "Privacy Statement"
		  radar: " No-bullying Radar "
		  social: "Social Impact"
		  spanish: Spanish
		  terms: "Terms & Conditions"
		forms: 
		  adress: Adress
		  another: Other
		  business_scheme: "Taxpaying regime"
		  commercial: Comercial
		  contact_title: "Contact form"
		  content: Content
		  email: Email
		  industrial: Industrial
		  institution: Institution
		  institution_pate: "Name of the organization or institution you would like to reach"
		  login_title: "Enter Cúrsame"
		  name: Name
		  name_of_representative: Representative
		  password: Password
		  phone: "Phone Number"
		  private: Private
		  public: Public
		  send_contact: Send
		  send_login: Login
		  send_sponsor: Contact
		  services: Servicies
		  society1: "Sociedad anónima"
		  society2: "Sociedad de responsabilidad límitada"
		  society3: "Sociedad anónima promotora de inverisón"
		  society4: "Sociedad comandita simple"
		  society5: "Sociedad en comandita por acciones"
		  society6: "Sociedad en nombre colectivo"
		  society7: "Sociedad cooperativa"
		  sponsor_title: "Sponsor Form"
		  type_contact: "Select one area"
		  sales_area: "Sales area"
		  social_area: "Area of social commitment"
		  suport_area: "Support Area"
		  charge: "Job title"
		functions: 
		  bit: Bit
		  bittext: "Software for flexible and integral school and administrative control to manage the processes of the institutions."
		  f1: Assignments
		  f10: Gospel
		  f10_sub: "Self implementation"
		  f11: Analytics
		  f2: Questionnaires
		  f3: Discusions
		  f4: Commments
		  f5: Chat
		  f6: Comunity
		  f7: Grades
		  f8: Statistics
		  f9: Radar
		  features1: "</br></br>Some features are: </br></br> <li class='block'>Create one or more courses </li> <li class='block'>Deadline </li> <li class='block'>Attached Files </li> <li class='block'>Recommended content </li><li class='block'>Assesment listing</li>"
		  features10: "</br></br>Some of its features are: </br></br><li class='block'>School training according to the user </li><li class='block'> School training per institution</li><li class='block'> Maximizer of abilities per module</li>"
		  features11: "</br></br>Some of its features are"
		  features2: "</br></br>Some of its features are: </br></br> <li class='block'>Create one or more courses </li> <li class='block'>Deadline </li> <li class='block'>Attached Files </li> <li class='block'>Recommended content </li><li class='block'>Assesment listing</li>"
		  features3: "</br></br>Some features are: </br> </br><li class='block'>Create one or more courses </li> <li class='block'>Deadline </li> <li class='block'>Attached Files </li> <li class='block'>Recommended content </li><li class='block'>Assesment listing</li>"
		  features4: "</br></br>Some of its features are: </br></br><li class='block'>Public or private </li><li class='block'>to one or several courses </li><li class='block'>Enriched content (multimedia)</li>"
		  features5: "</br></br>Some of its features are: </br></br><li class='block'>Personal chat with friends and classmates </li><li class='block'>Groupal chats for each course </li><li class='block'>Share multimedia </li><li class='block'>Private messages</li>"
		  features6: "</br></br>Some of its features are: </br></br><li class='block'>Find friends </li><li class='block'> Find classmates and teachers </li><li class='block'>Friendship requests </li><li class='block'>Interaction with profiles</li>"
		  features7: "</br></br>Some of its features are: </br></br><li class='block'>Grades per course </li><li class='block'>Individual Grades </li><li class='block'>Activity Assessment</li>"
		  features8: "</br></br>Some of its features are: </br></br><li class='block'>Platform tools usage </li><li class='block'>Access to the system </li><li class='block'>Grades </li><li class='block'>per course </li><li class='block'>Per student</li>"
		  features9: "</br></br>Some of its features are: </br></br><li class='block'>Analysis and reports of  bullying </li><li class='block'>Bullying Alert System </li><li class='block'> Advice for prevention, detection and management of bullying</li>"
		  mixpanel: MixPanel
		  mixpaneltext: "The most advanced  platform for data analysis of the market and the biggest legal platform in Mexico."
		  plugins: Integrations
		  radar: Radar
		  radartext: "Identifies, anticipates and deals with cases of school violence, be  part of the solution in you educative comunity."
		  text1: "It allows teachers to create academic activities and also allows students to answer to them any place, without having to use paper, increasing the productivity of both students and professors."
		  text10: "Enter Cúrsame´s specialized implementation system for managers, teachers and students; qualify your school quickly."
		  text11: "Access our analysis and report system which let you visualize dinamically the activities of your institution."
		  text2: "Through questionnaires teachers can assess their students easy and automatically, without losing time to neither grade test ítems nor wasting paper to print the tests."
		  text3: "Users can create discusión forums with recommended content and promote the participation of all the comunity involved in the learning process."
		  text4: "It allows all members to comment publicly, grupally or personally to interact social or academically."
		  text5: "Each user can use a chat cannel for his friends and mates. In addition each course has a chat room to share content in real time."
		  text6: "All users have a profile and can see and interact with other friend profiles encouraging social interaction within the institution."
		  text7: "Each user can see his educational progress. Teachers can visualize the results of all of their students easily and in real time."
		  text8: " School managers have Access to a statistics panel where they can see whats happening in the school and take decisions upon that information."
		  text9: "Identifies, anticipates and deals with cases of school violence, be part of the solution in your educative comunity <a href='http://radarescolar.com' targer='_blank'>Ir a Radar Escolar</a>."
		  textplugins: " We have several integrations that will allow you get the most out of your app."
		functions_text: 
		  f1: Tasks
		  f10: Bit
		  f11: GOSPEL
		  f2: Questionnaires
		  f3: Comments
		  f4: Chat
		  f5: Comunity
		  f6: Grades
		  f7: Statistics
		  f8: RADAR
		  f9: "Mix Panel"
		  link: "Discover the functionality of each tool"
		  m1: " We deliver you the most eficient tools for improving the process of teaching, learning and management for students, professors and board of directors of your institution"
		  subtitle: "All you need in one place"
		  title: "Functions and tools"
		impact: 
		  chart_1_txt: "Is the perception of the improvement of management, organization, and paperwork through the use of the platform in the process of teaching/learning"
		  chart_2_txt: "Is the perception teachers have about the improvements on the development of abilities via the use of the platform."
		  chart_3_txt: "Is the improvement on the ability to use and appropiation of technology on education and in daily life of teachers and students promoted by using the platform."
		  general_impact: "General Impact"
		  impact_in_education: "Educational Impact"
		  impact_in_tech: "Impact on the development technological abilities"
		  impact_teachers: "Impact on teachers practice"
		  li1: "Cursame is adopted by an 80% within the first 6 months of use."
		  li2: " 90% of teacher consider Cúrsame to have a positive impact in the process of learning."
		  li3: "70% of users consider that Cúrsame promotes search and Exchange of information."
		  li4: "75% of users consider collaborative learning has been promoted."
		  li5: "100% considers that Cúrsame makes easier to Access and Exchange learning material."
		  li6: "100% of users consider that through Cúrsame some abilitites have been promoted among students."
		  li7: "70% considers Cúrsame to have an impact on significative learning and critical thinking, furthermore the grades have improved quite a lot."
		  libutton: " Ilimited licence for your school from 30,000 mxn per year"
		  link_public: "I want to apply"
		  title: Impact
		lstats: 
		  number1: "145, 734"
		  number2: "314"
		  number3: "32"
		  t1: Users
		  t2: "Institutions using Cúrsame"
		  t3: "Activities in Mexico"
		menu: 
		  already_a_member: "Already a member?"
		  benefits: Benefits
		  contact: Contact
		  functions: Functions
		  home: Home
		  inpact: Impact
		  loggin: "Log In"
		  plugins: Integrations
		  rse: "Public Education"
		  us: "About us"
		pate: 
		  b1: Apply
		  be_sponsor: "I want to sponsor"
		  full_call: "To read the call click here­"
		  here: here­
		  impact_chart_t1: "Impact chart based on users and on institution"
		  impact_chart_t2: "Adoption sorted by school (6 months after implementation)"
		  impact_chart_txt1: "The perception of improvement on management, organization and control over learning activities are much favored using Cúrsame platform."
		  impact_chart_txt2: "Perception teachers have about the development of scholar aptitudes when using Cúrsame platform."
		  lic1: "We have benefited 145,734 students from basic to higher level schools."
		  lic2: "We operate in 314 institutions in different states of Mexico."
		  lic3: "We are adopted by a 80% of users the first 6 months of use."
		  lic4: "90% of teachers consider Cúrsame to have a positive impact on learning."
		  lic5: "70% of users consider Cúrsame to encourage the search and Exchange of information."
		  lic6: "75% of users considers collaborative learning has been promoted while using Cúrsame ."
		  lic7: "The 100% consider that cÃºrsame makes easier the Access and Exchange of learning materials."
		  lic8: "The 100% considers that through Cúrsame scholar aptotudes have been promoted."
		  ob1: "Main Goal"
		  ob2: "Specific objective"
		  private: "Privacy Statement"
		  sponsors: Sponsors
		  t1: "Program for Educational Technology Access"
		  t2: "It is everybodys effort!"
		  t3: "ÂHow does it work?"
		  t4: " Cúrsame impact"
		  testimonials: Testimonies
		  text2: "<p> The Call to apply to this program will be published on January 2015 having as deadline the 1 st december 2015, or otherwise until reaching 500,000 Users .</p> <p> All schools in Mexico are eligible as long as they are public schools. Private Schools cannnot participate.</p>"
		  text3: "<p> Cúrsame has an average cost of $40,000.00 (Fourty thousand Mexican Pesos) a year for school. The financial aid from the Program for Educational Technology covers from 20% up to  100% for institution.</p><p> Join the sponsors team and make students and teachers have access to one of the most educational technologies ever developped.</p>"
		  text4: "Aplica la Ley Federal Protección de Datos Personales en Posesión de Particulares. Esta ley tiene la finalidad de regular el tratamiento legítimo controlado e informado de datos personales, a efecto de garantizar la privacidad y el derecho a la autodeterminación informativa de las personas."
		  textob1: "Promote the Access to quality educational technology through subsidies to public schools in all levels from basic to higher education."
		  textob2: "Implement Cúrsame, an educational technology in the schools that apply and fullfill the selection requirements."
		  txt1: "Do you want to be a sponsor?  Click here"
		pitch: 
		  t1: "Improves the academic performance of the institution"
		  t2: "Communicate any time any place"
		  t3: "All information of your school in statistics"
		  t4: "Increase your profit by enlarging your enrolment"
		social: 
		  li11: "Personal tracking of the students academic progress."
		  li12: " Delivers specialized content according to your needs."
		  li13: "Increases productivity, allows to strenghten teaching and improve learning."
		  li21: "We deliver servers and tablets to those schools in need thanks to our allies."
		  li22: "We provide teachers with technological training and advice."
		  li23: "The platform promotes the digitalof academic content."
		  li31: "Through some indicators we help detect:  Risk of dropping out."
		  li32: "Drug use."
		  li33: " School \"Bullying\" ."
		  sub1: "Improves the quality of education"
		  sub2: "Lessens the digital divide"
		  sub3: "Early detection of red flags"
		  title: "Commitment and social impact"
		trust_us: 
		  autor1: "Ana María"
		  autor2: "Victor Cervantes García"
		  autor3: "Biol. Claudia Fabián"
		  go_benefits: "I Want it in my school"
		  head: "They trust Cúrsame"
		  institution1: "Tecnológico de Estudios Superiores de Ecatepec"
		  institution2: IEMS
		  institution3: "Tecnológico de Estudios Superiores de Ecatepec"
		  testimonial1: "It has been useful for me, as a profesor working with several groups and having to work  and follow the activities and doubts of the students from afar, besides I keep a record of  the evidence of their work all along the course"
		  testimonial2: "Education is a process,that is its worth. Nowadays we are being pressed on to praise the virtues of new technologies. Cúrsame allows us to catalize the educational process within the scope of new technology, meaning that Cúrsame makes us discover that our role in the educational technologie has a gigantic potential and that the work we can develop on them is the building of a new society, by the means within our reach. Thanks for being an educational mean for the youth!."
		  testimonial3: "I have a bachelors degree in Biology, currently me and other professors of an association use  Cúrsame as a top place platform for our students,for it is efficient, quick and has multiple tools for using after class.I can upload tasks, tests, files as slides and readings, I like it because there is a calendar to place important events and a chat to contact my students easily. I strongly believe that Cúrsame can be as competitive as Google or Facebook"



		 


