require 'sinatra/base'
require 'haml'

module Sinatra
  module Html5BoilerplateHelpers
    
    def conditional_html( lang = "en", &block )
      haml_concat <<-"HTML".gsub( /^\s+/, '' )
        <!--[if lt IE 7 ]>              <html lang="#{lang}" class="no-js ie6"> <![endif]-->
        <!--[if IE 7 ]>                 <html lang="#{lang}" class="no-js ie7"> <![endif]-->
        <!--[if IE 8 ]>                 <html lang="#{lang}" class="no-js ie8"> <![endif]-->
        <!--[if IE 9 ]>                 <html lang="#{lang}" class="no-js ie9"> <![endif]-->
        <!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}" class="no-js"> <!--<![endif]-->      
      HTML
      haml_concat capture( &block ) << "\n</html>" if block_given?
    end
    
  end

  helpers Html5BoilerplateHelpers
end

