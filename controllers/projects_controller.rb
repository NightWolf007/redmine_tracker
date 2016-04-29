require './controllers/base_controller'
require './views/projects'

class ProjectsController < BaseController
  def index
    @projects = Resource::Project.all
    Projects.index(Application.body, @projects)
  end

  def show(id)
    @project = Resource::Project.find(id)
    Projects.show(Application.body, @project)
  end
end
