require 'active_resource'
require './lib/json_formatter'

module Resource
  class Base < ActiveResource::Base
    self.site = ENV['URL']
    self.user = ENV['USERNAME']
    self.password = ENV['PASSWORD']
    self.format = ::JsonFormatter.new(:collection_name)

    headers['X-Redmine-API-Key'] = ENV['API_KEY']
  end
end
