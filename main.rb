Dir['./initializers/*.rb'].each{ |s| load s }

require 'qml'
require './controllers'

QML.run do |app|
  app.load_path Pathname(__FILE__) + '../views/application.qml'
end
