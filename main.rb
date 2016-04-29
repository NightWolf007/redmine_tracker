Dir['./initializers/*.rb'].each{ |s| load s }
require './application'
require './router'

Application.run :projects
