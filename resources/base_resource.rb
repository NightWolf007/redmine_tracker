require 'active_resource'

class BaseResource < ActiveResource::Base
  class << self
    attr_accessor :key
  end

  def save
    prefix_options[:key] = self.class.key
    super
  end
end
