###################### define run methods #########################
enable :sessions
enable :cross_origin

register Sinatra::AssetPack
  ##### sass #####
  configure do
    set :scss, {:style => :compressed, :debug_info => false}
    set :allow_origin, :any
    set :allow_methods, [:get, :post, :options]

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
 