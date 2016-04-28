class WelcomeController < ApplicationController
require 'rest-client'
require 'rubygems'
require 'base64'
require 'cgi'
require 'hmac-sha1'
  def index
    #OBTENER LOS ALMACENES
    key = 'W0B@c0w9.xqo1nQ'
    signature = 'GET'
    hmac = HMAC::SHA1.new(key)
    hmac.update(signature)
    clave = Base64.encode64("#{hmac.digest}")
    almacenes = RestClient.get 'http://integracion-2016-dev.herokuapp.com/bodega/almacenes', {:Authorization => 'INTEGRACION grupo1:' + clave, :content_type => 'application/json'}
    @almacenesJson = almacenes #Esta es solo para debug
    almacenesArreglo = almacenes.split("},")
    nAlmacenes = almacenesArreglo.length - 1
    #Creamos un arreglo 2d de los almacenes con sus atributos
    @almacenes = []
    i = 0
    until i > (nAlmacenes) do
      almacenAt = almacenesArreglo[i].split(',')
      almacenID = almacenAt[0].split(':')[1].tr('""', '')
      almacenGrupo = almacenAt[1].split(':')[1].tr('""', '')
      almacenPulmon = almacenAt[2].split(':')[1].tr('""', '')
      almacenDespacho = almacenAt[3].split(':')[1].tr('""', '')
      almacenRecepcion = almacenAt[4].split(':')[1].tr('""', '')
      almacenTotal = almacenAt[5].split(':')[1].tr('""', '')
      almacenUsado = almacenAt[6].split(':')[1].tr('""', '')
      almacenV = almacenAt[7].split(':')[1].tr('""', '')
      almacen = [almacenID, almacenGrupo, almacenPulmon, almacenDespacho, almacenRecepcion, almacenTotal, almacenUsado, almacenV]
      @almacenes << almacen
      i += 1
    end
    #signature = 'GET571262aaa980ba030058a14c'
    #hmac = HMAC::SHA1.new(key)
    #hmac.update(signature)
    #clave = Base64.encode64("#{hmac.digest}")
    #almacenes = RestClient.get 'http://integracion-2016-dev.herokuapp.com/bodega/skusWithStock', {:Authorization => 'INTEGRACION grupo1:' + clave, :content_type => 'application/json', :params => {:almacenId => '571262aaa980ba030058a14c'}}
    #OBTENER EL CONTENIDO DE CADA ALMACEN
    i = 0
    @signature = [1,2,3,4,5]
    @clave = [1,2,3,4,5]
    until i > nAlmacenes do
      id = @almacenes[i][0]
      @signature[i] = 'GET' + id
      #hmac = HMAC::SHA1.new(key)
      hmac.update(signature)
      @clave[i] = Base64.encode64("#{hmac.digest}")
      #almacenes = RestClient.get 'http://integracion-2016-dev.herokuapp.com/bodega/skusWithStock', {:Authorization => 'INTEGRACION grupo1:' + clave, :content_type => 'application/json', :params => {:almacenId => '571262aaa980ba030058a14c'}}
      i += 1
    end
  end
end
