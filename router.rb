require './controllers'

module Router

  CONTROLLERS = {
    projects: ProjectsController.new
  }.freeze

  def self.path_for(resource)
    CONTROLLERS[resource]
  end
end
