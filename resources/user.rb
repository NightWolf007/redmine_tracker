require './resources/base.rb'

module Resource
  class User < Base
    def self.current
      find(:current)
    end
  end
end
