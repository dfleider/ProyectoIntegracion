class WelcomeController < ApplicationController
require 'rest-client'
  def index
    @almacenes = RestClient.get  'http://integracion-2016-dev.herokuapp.com/bodega/almacenes', {:Authorization => 'INTEGRACION grupo1:tZc659DanGMyROdZcvl3ph/A1Oc=', :content_type => 'application/json'}
  end
end
