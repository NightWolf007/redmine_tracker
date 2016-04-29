Dir['./initializers/*.rb'].each{ |s| load s }
require './application'

Application.run
