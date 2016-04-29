require 'active_resource'

class BaseResource < ActiveResource::Base
  self.site = ENV['URL']
  self.user = ENV['USERNAME']
  self.password = ENV['PASSWORD']
  self.format = :json

  headers['X-Redmine-API-Key'] = ENV['API_KEY']
end
