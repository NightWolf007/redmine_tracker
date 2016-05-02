require './resources/base.rb'

module Resource
  class User < Base
    ATTRS = [
      :id,
      :login,
      :firstname,
      :lastname,
      :mail,
      :created_on,
      :last_login_on,
      :api_key,
      :custom_fields
    ]

    def self.current
      find(:current)
    end

    def serialize
      user = super
      user[:custom_fields].map! { |f| f.as_json.symbolize_keys}
      user
    end
  end
end
