require 'active_resource'

class BaseResource < ActiveResource::Base
  class << self
    attr_accessor :key
  end

  self.include_format_in_path = false
  self.site = ENV['URL']
  self.user = ENV['USERNAME']
  self.password = ENV['PASSWORD']
  self.key = ENV['API_KEY']
  self.format = :json


  def save
    prefix_options[:key] = self.class.key
    super
  end
end
