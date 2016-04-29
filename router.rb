require './controllers'

module Router

  CONTROLLERS = {
    projects: ProjectsController.new
  }

  @@app = nil

  def self.path_for(resource)
    CONTROLLERS[resource]
  end

  def self.app=(app)
    @@app = app
  end

  def self.app
    @@app
  end
end
