require 'sass/plugin/rack'
require './landing'
 
use Sass::Plugin::Rack
 
run Sinatra::Application