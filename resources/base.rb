require 'active_resource'
require './lib/json_formatter'

module Resource
  class Base < ActiveResource::Base
    self.site = ENV['URL']
    self.user = ENV['RUSERNAME']
    self.password = ENV['RPASSWORD']
    self.format = ::JsonFormatter.new(:collection_name)

    self.headers['X-Redmine-API-Key'] = ENV['API_KEY']

    def serialize
      as_json.symbolize_keys
    end
  end
end
