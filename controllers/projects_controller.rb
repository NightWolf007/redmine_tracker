require './controllers/base_controller'
require './views/projects'
require './resources'

class ProjectsController < BaseController
  def index
    super
    @projects = Resource::Project.all
    Projects.index(Router.app, @projects)
  end

  def show(id)
    super(id)
    @project = Resource::Project.find(id)
    Projects.show(Router.app, @project)
  end
end
