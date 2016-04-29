require 'green_shoes'
require './router'
require './views/projects'

class Application < Shoes
  url '/', :index

  def self.run(resource)
    Shoes.app(title: 'Redmine Tracker',
              height: 600, width: 400) do
      Router.app = self
      visit '/'
      p location
      # Router.path_for(resource).index
    end
  end

  def index
    Projects.index(self, nil)
  end
end
