require 'sinatra/base'
require 'haml'

module Sinatra
  module HamlHelpers
    
    def render_file(filename)
      contents = File.read("views/" + filename)
      Haml::Engine.new(contents).render
    end
    
  end

  helpers HamlHelpers
end

