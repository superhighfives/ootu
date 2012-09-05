require 'rubygems'
require 'sinatra'
require './sinatra/html5helpers'
require './sinatra/hamlhelpers'
require 'sass'
require 'haml'

class Ootu < Sinatra::Base
  helpers Sinatra::Html5BoilerplateHelpers
  helpers Sinatra::HamlHelpers
  
  get '/' do
    @name = 'index'
    @id = params[:v] if defined?(params[:v])
    @sadface = true if params[:result] == 'sadface'
    haml :index
  end

  post '/' do
    regex = /youtube.com.*(?:\/|v=)([^&$]+)/
    id = params[:url].match(regex)
    unless id.nil?
      redirect "/?v=#{id[1]}"
    else
      redirect "/?result=sadface"
    end
  end

  get '/css/style.css' do
    scss :stylesheet
  end
    
end