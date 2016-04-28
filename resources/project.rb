require './resources/base_resource.rb'

class Project < BaseResource
  self.site = ENV['URL']
  self.user = ENV['USERNAME']
  self.password = ENV['PASSWORD']
  self.key = ENV['API_KEY']
  self.format = :json
end
