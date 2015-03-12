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
require './controllers/init'
require './controllers/getroutes'
require './controllers/postroutes'
require './controllers/global_methods'