require 'qml'
require './resources/project'

class ProjectsController
  include QML::Access

  register_to_qml under: 'ProjectsController', version: '1.0'

  property(:model) { QML::ArrayModel.new(*Resource::Project::ATTRS) }

  def index
    Thread.new do
      QML.next_tick do
        model.clear
        Resource::Project.all.each do |project|
          model << project.serialize
        end
      end
    end
    model
  end

  # def show(app, id)
  #   @project = Resource::Project.find(id)
  #   Projects.show(app, @project)
  # end
end
